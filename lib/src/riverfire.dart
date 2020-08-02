import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartx/dartx.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:kt_dart/kt.dart';
import 'package:riverpod/riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
part 'riverfire.freezed.dart';
part 'riverfire.g.dart';

T identity<T>(T item) => item;
Query defaultQuery(CollectionReference ref) => ref.limit(10);
Provider<GoogleSignIn> createGoogleSignIn(GoogleSignIn signIn) =>
    Provider((ref) => signIn);
Provider<FirebaseApp> createRiverFireApp(FirebaseApp app) =>
    Provider<FirebaseApp>((_) => app);

Provider<RiverFireConfig> createRiverFireConfig(Provider<FirebaseApp> app,
        {bool persist = true}) =>
    Provider<RiverFireConfig>((ref) => RiverFireConfig(
          ref,
          ref.read(app),
          persist: persist,
        ));

Provider<RiverFireAuth> createRiverFireAuth(
        Provider<FirebaseApp> app, Provider<GoogleSignIn> signIn) =>
    Provider<RiverFireAuth>(
        (ref) => RiverFireAuth(ref, ref.read(app), ref.read(signIn)));

Provider<RiverFirestoreService<T>>
    createRiverFirestoreService<T extends FirestoreDoc>(
  Provider<RiverFireConfig> config, {
  @required CollectionReference Function(FirebaseFirestore) getCollection,
  @required T Function(DocumentSnapshot) fromFirestore,
  Query Function(CollectionReference) getQuery,
  T Function(T) toFirestore,
}) =>
        Provider<RiverFirestoreService<T>>(
          (ref) => RiverFirestoreService(
            ref,
            ref.read(config),
            getCollection,
            getQuery,
            fromFirestore,
            toFirestore,
          ),
        );

class RiverFirestoreService<T extends FirestoreDoc> {
  RiverFirestoreService(this.ref, this.config, this._getCollection,
      this._getQuery, this._fromFirestore, T Function(T) toFirestore)
      : _toFirestore = toFirestore ?? identity,
        _firestore = config.firestore,
        assert(_fromFirestore != null),
        assert(_getCollection != null);
  final ProviderReference ref;
  final RiverFireConfig config;
  final CollectionReference Function(FirebaseFirestore) _getCollection;
  final Query Function(CollectionReference) _getQuery;
  final T Function(DocumentSnapshot) _fromFirestore;
  final T Function(T) _toFirestore;
  final FirebaseFirestore _firestore;

  Stream<Either<FirestoreFailure, KtList<T>>> watchAll() async* {
    yield* _getQuery(_getCollection(_firestore))
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, KtList<T>>(
            snapshot.docs.map(_fromFirestore).toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected());
      }
    });
  }

  Future<Either<FirestoreFailure, Unit>> create(T doc) async {
    try {
      await _getCollection(_firestore)
          .doc(doc.id)
          .set(_toFirestore(doc).toJson());

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        return left(FirestoreFailure.unexpected());
      }
    }
  }

  Future<Either<FirestoreFailure, Unit>> update(T doc) async {
    try {
      await _getCollection(_firestore)
          .doc(doc.id)
          .update(_toFirestore(doc).toJson());

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(FirestoreFailure.unableToUpdate());
      } else {
        return left(FirestoreFailure.unexpected());
      }
    }
  }

  Future<Either<FirestoreFailure, Unit>> delete(T doc) async {
    try {
      await _getCollection(_firestore).doc(doc.id).delete();

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(FirestoreFailure.unableToUpdate());
      } else {
        return left(FirestoreFailure.unexpected());
      }
    }
  }
}

class RiverFireConfig {
  RiverFireConfig(this.ref, this.app, {bool persist = true}) {
    firestore = FirebaseFirestore.instanceFor(app: app);
    firestore.settings = Settings(persistenceEnabled: persist);
  }
  final FirebaseApp app;
  FirebaseFirestore firestore;
  FirebaseApp get firebaseApp => app;
  final ProviderReference ref;
}

class RiverFireAuth {
  RiverFireAuth(this.ref, this.app, this.signInWithGoogle) {
    _auth = FirebaseAuth.instance;
  }
  final ProviderReference ref;
  final FirebaseApp app;
  final GoogleSignIn signInWithGoogle;
  FirebaseAuth _auth;
  FirebaseAuth get auth => _auth;
  FirebaseUser user;
  Stream<FirebaseUser> get authState => auth.onAuthStateChanged;

  Future<FirebaseUser> signInAnonymously() async {
    print('Signing in anonymously');
    try {
      final authResult = await auth.signInAnonymously();
      user = authResult.user;
      print('signed in ${user.displayName} silently');
      return user;
    } on Exception catch (e, st) {
      print(e);
      print(st);
    }
    return user;
  }

  Future<FirebaseUser> signIn() async {
    print('Signing in');
    try {
      final googleUser = await signInWithGoogle.signInSilently();
      if (googleUser == null) {
        try {
          final googleUser = await signInWithGoogle.signIn();
          final googleAuth = await googleUser.authentication;
          final googleCredential = GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          user = (await auth.signInWithCredential(googleCredential)).user;
          print('signed in ${user.displayName}');
          return user;
        } on Exception catch (e, st) {
          print(e);
          print(st);
        }
      } else {
        final googleAuth = await googleUser.authentication;
        final googleCredential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        user = (await auth.signInWithCredential(googleCredential)).user;
        print('signed in ${user.displayName} silently');
        return user;
      }
    } on Exception catch (e, st) {
      print(e);
      print(st);
    }

    Future.delayed(1000.milliseconds, () {
      print(user);
    });
    return user;
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}

@freezed
abstract class FirestoreFailure with _$FirestoreFailure {
  factory FirestoreFailure.insufficientPermissions() =
      _FirestoreFailureInsufficientPermissions;
  factory FirestoreFailure.unableToUpdate() = _FirestoreFailureUnableToUpdate;
  factory FirestoreFailure.unexpected() = _FirestoreFailureUnexpected;
  factory FirestoreFailure.fromJson(Map<String, dynamic> json) =>
      _$FirestoreFailureFromJson(json);

  @late
  bool get insufficientPermissions =>
      this is _FirestoreFailureInsufficientPermissions;
  @late
  bool get unableToUpdate => this is _FirestoreFailureUnableToUpdate;
  @late
  bool get unexpected => this is _FirestoreFailureUnexpected;
}

abstract class FirestoreDoc {
  String get id;
  Map<String, dynamic> toJson();
}
