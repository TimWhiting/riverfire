import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'app.dart';
part 'collection.freezed.dart';
part 'collection.g.dart';

T identity<T>(T item) => item;
Query defaultQuery(CollectionReference ref) => ref.limit(20);

Provider<RiverFirestoreService<T>>
    createRiverFirestoreService<T extends FirestoreDoc>(
  FutureProvider<RiverFireConfig> config, {
  @required CollectionReference Function(FirebaseFirestore) getCollection,
  @required T Function(DocumentSnapshot) fromFirestore,
  Query Function(CollectionReference) getQuery,
  T Function(T) toFirestore,
}) =>
        Provider<RiverFirestoreService<T>>(
          (ref) => RiverFirestoreService(
            ref.read,
            config,
            getCollection,
            getQuery,
            fromFirestore,
            toFirestore,
          ),
        );

class RiverFirestoreService<T extends FirestoreDoc> {
  RiverFirestoreService(this.read, this.config, this._getCollection,
      this._getQuery, this._fromFirestore, T Function(T) toFirestore)
      : _toFirestore = toFirestore ?? identity,
        assert(_fromFirestore != null),
        assert(_getCollection != null) {
    _init();
  }

  final Reader read;
  final FutureProvider<RiverFireConfig> config;
  final CollectionReference Function(FirebaseFirestore) _getCollection;
  final Query Function(CollectionReference) _getQuery;
  final T Function(DocumentSnapshot) _fromFirestore;
  final T Function(T) _toFirestore;
  FirebaseFirestore _firestore;

  Future<void> _init() async {
    _firestore = (await read(config.future)).firestore;
  }

  bool get initialized => _firestore != null;

  Stream<Either<FirestoreFailure, KtList<T>>> watchAll() async* {
    if (!initialized) {
      yield left(FirestoreFailure.uninitialized());
      return;
    }
    yield* _getQuery(_getCollection(_firestore))
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, KtList<T>>(
            snapshot.docs.map(_fromFirestore).toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected());
      }
    });
  }

  Future<Either<FirestoreFailure, bool>> exists(T doc) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      final fDoc = await _getCollection(_firestore).doc(doc.id).get();
      if (fDoc.exists) {
        return right(true);
      } else {
        return right(false);
      }
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected());
      }
    }
  }

  Stream<Either<FirestoreFailure, T>> watch(T doc) async* {
    if (!initialized) {
      yield left(FirestoreFailure.uninitialized());
      return;
    }
    yield* _getCollection(_firestore)
        .doc(doc.id)
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, T>(
            _fromFirestore(snapshot),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected());
      }
    });
  }

  Stream<Either<FirestoreFailure, T>> watchById(String docId) async* {
    if (!initialized) {
      yield left(FirestoreFailure.uninitialized());
      return;
    }
    yield* _getCollection(_firestore)
        .doc(docId)
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, T>(
            _fromFirestore(snapshot),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected());
      }
    });
  }

  Future<Either<FirestoreFailure, Unit>> create(T doc) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore)
          .doc(doc.id)
          .set(_toFirestore(doc).toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        return left(FirestoreFailure.unexpected());
      }
    }
  }

  Future<Either<FirestoreFailure, Unit>> update(T doc) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore)
          .doc(doc.id)
          .update(_toFirestore(doc).toJson());

      return right(unit);
    } on FirebaseException catch (e) {
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
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore).doc(doc.id).delete();

      return right(unit);
    } on FirebaseException catch (e) {
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

@freezed
abstract class FirestoreFailure with _$FirestoreFailure {
  factory FirestoreFailure.insufficientPermissions() =
      _FirestoreFailureInsufficientPermissions;
  factory FirestoreFailure.unableToUpdate() = _FirestoreFailureUnableToUpdate;
  factory FirestoreFailure.unexpected() = _FirestoreFailureUnexpected;
  factory FirestoreFailure.uninitialized() = _FirestoreFailureUninitialized;
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

class RiverFirestoreDocWatcher<T extends FirestoreDoc>
    extends StateNotifier<T> {
  RiverFirestoreDocWatcher({this.service, this.docId}) : super(null) {
    service.watchById(docId).listen((d) => state = d.getOrElse(() => null));
  }

  final RiverFirestoreService<T> service;
  final String docId;

  T get current => state;
  void update(T Function(T) updateFunction, {bool updateIfNull = false}) {
    if (state != null || updateIfNull) {
      service.update(updateFunction(state));
    }
  }
}

extension DocWatcher<T extends FirestoreDoc> on RiverFirestoreService<T> {
  RiverFirestoreDocWatcher<T> docWatcher(String id) =>
      RiverFirestoreDocWatcher<T>(service: this, docId: id);
}
