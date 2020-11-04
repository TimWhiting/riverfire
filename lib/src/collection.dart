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

  Future<Either<FirestoreFailure, Unit>> delete(String docId) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore).doc(docId).delete();

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

extension RiverFireServiceConfigX on FutureProvider<RiverFireConfig> {
  Provider<RiverFirestoreService<T>>
      riverFirestoreService<T extends FirestoreDoc>({
    @required CollectionReference Function(FirebaseFirestore) getCollection,
    @required T Function(DocumentSnapshot) fromFirestore,
    Query Function(CollectionReference) getQuery,
    T Function(T) toFirestore,
  }) =>
          createRiverFirestoreService(this,
              getCollection: getCollection,
              fromFirestore: fromFirestore,
              getQuery: getQuery,
              toFirestore: toFirestore);
}

/// Watches a doc with [docId] for changes and exposes the state in a state notifier, also provides an interface for updating that doc
class RiverFirestoreDocWatcher<T extends FirestoreDoc>
    extends StateNotifier<T> {
  RiverFirestoreDocWatcher(
      {this.service,
      this.read,
      this.docId,
      StateProvider<FirestoreFailure> errorProvider})
      : errorProvider =
            errorProvider ?? StateProvider<FirestoreFailure>((ref) => null),
        super(null) {
    service.watchById(docId).listen(_updateState);
  }

  final StateProvider<FirestoreFailure> errorProvider;
  final RiverFirestoreService<T> service;
  final Reader read;
  final String docId;

  void _updateState(Either<FirestoreFailure, T> doc) {
    doc.fold(
      (failure) => read(errorProvider).state = failure,
      (newState) => state = newState,
    );
  }

  T get current => state;

  /// Updates the doc with [docId] with [updateFunction]
  ///
  /// If the current state is null, [updateIfNull] determines whether to overwrite or create the document
  Future<Either<FirestoreFailure, Unit>> update(T Function(T) updateFunction,
      {bool updateIfNull = false}) async {
    if (state != null || updateIfNull) {
      return service.update(updateFunction(state));
    }
    return right<FirestoreFailure, Unit>(unit);
  }
}

extension DocWatcher<T extends FirestoreDoc> on RiverFirestoreService<T> {
  StateNotifierProvider<RiverFirestoreDocWatcher<T>> docWatcher(String docId,
          {StateProvider<FirestoreFailure> errorProvider}) =>
      StateNotifierProvider<RiverFirestoreDocWatcher<T>>((ref) =>
          RiverFirestoreDocWatcher<T>(
              service: this,
              read: ref.read,
              docId: docId,
              errorProvider: errorProvider));
}

/// Watches a collection for changes and exposes the state in a state notifier, also provides an interface for updating that doc
class RiverFirestoreCollectionWatcher<T extends FirestoreDoc>
    extends StateNotifier<KtList<T>> {
  RiverFirestoreCollectionWatcher(
      {this.service, this.read, StateProvider<FirestoreFailure> errorProvider})
      : errorProvider =
            errorProvider ?? StateProvider<FirestoreFailure>((ref) => null),
        super(null) {
    service.watchAll().listen(_updateState);
  }

  final Reader read;
  final RiverFirestoreService<T> service;
  final StateProvider<FirestoreFailure> errorProvider;

  void _updateState(Either<FirestoreFailure, KtList<T>> updates) {
    updates.fold(
      (failure) => read(errorProvider).state = failure,
      (newState) => state = newState,
    );
  }

  KtList<T> get current => state;

  /// Updates the doc with [id] with [updateFunction]
  Future<Either<FirestoreFailure, Unit>> update(
      String id, T Function(T) updateFunction) async {
    if (state != null) {
      return service.update(updateFunction(state.first((t) => t.id == id)));
    }
    return right<FirestoreFailure, Unit>(unit);
  }

  /// Removes doc with [docId]
  Future<Either<FirestoreFailure, Unit>> delete(String docId) async {
    if (state != null) {
      return service.delete(docId);
    }
    return right<FirestoreFailure, Unit>(unit);
  }

  /// Adds the [doc] to the collection
  Future<Either<FirestoreFailure, Unit>> create(T doc) async {
    if (state != null) {
      return service.create(doc);
    }
    return right<FirestoreFailure, Unit>(unit);
  }
}

extension CollectionWatcher<T extends FirestoreDoc>
    on RiverFirestoreService<T> {
  StateNotifierProvider<RiverFirestoreCollectionWatcher<T>> collectionWatcher(
          {StateProvider<FirestoreFailure> errorProvider}) =>
      StateNotifierProvider<RiverFirestoreCollectionWatcher<T>>((ref) =>
          RiverFirestoreCollectionWatcher<T>(
              service: this, read: ref.read, errorProvider: errorProvider));
}
