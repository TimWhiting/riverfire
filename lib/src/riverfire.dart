import 'package:cloud_firestore/cloud_firestore.dart';
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
FutureProvider<FirebaseApp> createRiverFireApp(Future<FirebaseApp> app) =>
    FutureProvider<FirebaseApp>((_) => app);

FutureProvider<RiverFireConfig> createRiverFireConfig(
        FutureProvider<FirebaseApp> app,
        {bool persistWeb = true}) =>
    FutureProvider<RiverFireConfig>((ref) async => RiverFireConfig(
          ref,
          await ref.read(app).future,
          persistWeb: persistWeb,
        ));

FutureProvider<RiverFireAuth> createRiverFireAuth(
        FutureProvider<FirebaseApp> app) =>
    FutureProvider<RiverFireAuth>(
        (ref) async => RiverFireAuth(ref, await ref.read(app).future));

FutureProvider<RiverFirestoreService<T>>
    createRiverFirestoreService<T extends FirestoreDoc>(
  FutureProvider<RiverFireConfig> config, {
  @required CollectionReference Function(Firestore) getCollection,
  @required T Function(DocumentSnapshot) fromFirestore,
  Query Function(CollectionReference) getQuery,
  T Function(T) toFirestore,
}) =>
        FutureProvider<RiverFirestoreService<T>>(
          (ref) async => RiverFirestoreService(
            ref,
            await ref.read(config).future,
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
  final CollectionReference Function(Firestore) _getCollection;
  final Query Function(CollectionReference) _getQuery;
  final T Function(DocumentSnapshot) _fromFirestore;
  final T Function(T) _toFirestore;
  final Firestore _firestore;

  Stream<Either<FirestoreFailure, KtList<T>>> watchAll() async* {
    yield* _getQuery(_getCollection(_firestore))
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, KtList<T>>(
            snapshot.documents.map(_fromFirestore).toImmutableList(),
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
          .document(doc.id)
          .setData(_toFirestore(doc).toJson());

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
          .document(doc.id)
          .updateData(_toFirestore(doc).toJson());

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
      await _getCollection(_firestore).document(doc.id).delete();

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
  RiverFireConfig(this.ref, this.app, {bool persistWeb = true}) {
    firestore = Firestore(app: app)..settings(persistenceEnabled: persistWeb);
  }
  final FirebaseApp app;
  Firestore firestore;
  FirebaseApp get firebaseApp => app;
  final ProviderReference ref;
}

class RiverFireAuth {
  RiverFireAuth(this.ref, this.app) {
    _auth = FirebaseAuth.fromApp(app);
  }
  final ProviderReference ref;
  final FirebaseApp app;
  FirebaseAuth _auth;
  FirebaseAuth get auth => _auth;
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
