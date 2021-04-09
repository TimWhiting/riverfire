import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'app.dart';
import 'state_error.dart';
part 'collection.freezed.dart';
part 'collection.g.dart';

T identity<T>(T item) => item;
Query defaultQuery(CollectionReference ref) => ref.limit(20);

Provider<RiverFirestoreService<T>>
    createRiverFirestoreService<T extends FirestoreDoc>(
  FutureProvider<RiverFireConfig> config, {
  required CollectionReference Function(Reader, FirebaseFirestore)
      getCollection,
  required T Function(DocumentSnapshot) fromFirestore,
  required Query Function(CollectionReference) getQuery,
  T Function(T)? toFirestore,
}) =>
        Provider<RiverFirestoreService<T>>(
          (ref) => RiverFirestoreService(
            ref.read,
            config,
            (firestore) => getCollection(ref.read, firestore),
            getQuery,
            fromFirestore,
            toFirestore,
          ),
        );

class RiverFirestoreService<T extends FirestoreDoc> {
  RiverFirestoreService(this.read, this.config, this._getCollection,
      this._getQuery, this._fromFirestore, T Function(T)? toFirestore)
      : _toFirestore = toFirestore ?? identity {
    _init();
  }

  final Reader read;
  final FutureProvider<RiverFireConfig> config;
  final CollectionReference Function(FirebaseFirestore) _getCollection;
  final Query Function(CollectionReference) _getQuery;
  final T Function(DocumentSnapshot) _fromFirestore;
  final T Function(T) _toFirestore;
  FirebaseFirestore? _firestore;

  Future<void> _init() async {
    _firestore = (await read(config.future)).firestore;
  }

  bool get initialized => _firestore != null;

  Stream<Either<FirestoreFailure, List<T>>> watchAll() async* {
    if (!initialized) {
      yield left(FirestoreFailure.uninitialized());
      return;
    }
    yield* _getQuery(_getCollection(_firestore!))
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, List<T>>(
            List.unmodifiable(snapshot.docs.map(_fromFirestore)),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException &&
          e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    });
  }

  Future<Either<FirestoreFailure, bool>> exists(String docId) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      final fDoc = await _getCollection(_firestore!).doc(docId).get();
      if (fDoc.exists) {
        return right(true);
      } else {
        return right(false);
      }
    } on FirebaseException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    }
  }

  Stream<Either<FirestoreFailure, T>> watch(T doc) async* {
    if (!initialized) {
      yield left(FirestoreFailure.uninitialized());
      return;
    }
    yield* _getCollection(_firestore!)
        .doc(doc.id)
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, T>(
            _fromFirestore(snapshot),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException &&
          e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    });
  }

  Stream<Either<FirestoreFailure, T>> watchById(String docId) async* {
    if (!initialized) {
      yield left(FirestoreFailure.uninitialized());
      return;
    }
    yield* _getCollection(_firestore!)
        .doc(docId)
        .snapshots()
        .map(
          (snapshot) => right<FirestoreFailure, T>(
            _fromFirestore(snapshot),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException &&
          e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        // log.error(e.toString());
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    });
  }

  Future<Either<FirestoreFailure, Unit>> create(T doc) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore!)
          .doc(doc.id)
          .set(_toFirestore(doc).toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else {
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    }
  }

  Future<Either<FirestoreFailure, Unit>> update(T doc) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore!)
          .doc(doc.id)
          .update(_toFirestore(doc).toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else if (e.message?.contains('NOT_FOUND') == true) {
        return left(FirestoreFailure.unableToUpdate());
      } else {
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    }
  }

  Future<Either<FirestoreFailure, Unit>> delete(String docId) async {
    if (!initialized) {
      return left(FirestoreFailure.uninitialized());
    }
    try {
      await _getCollection(_firestore!).doc(docId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return left(FirestoreFailure.insufficientPermissions());
      } else if (e.message?.contains('NOT_FOUND') == true) {
        return left(FirestoreFailure.unableToUpdate());
      } else {
        return left(FirestoreFailure.unexpected(e.toString()));
      }
    }
  }
}

@freezed
class FirestoreFailure with _$FirestoreFailure {
  FirestoreFailure._();
  factory FirestoreFailure.insufficientPermissions() =
      _FirestoreFailureInsufficientPermissions;
  factory FirestoreFailure.unableToUpdate() = _FirestoreFailureUnableToUpdate;
  factory FirestoreFailure.unexpected(String e) = _FirestoreFailureUnexpected;
  factory FirestoreFailure.uninitialized() = _FirestoreFailureUninitialized;
  factory FirestoreFailure.fromJson(Map<String, dynamic> json) =>
      _$FirestoreFailureFromJson(json);

  late final bool insufficientPermissions =
      this is _FirestoreFailureInsufficientPermissions;
  late final bool unableToUpdate = this is _FirestoreFailureUnableToUpdate;

  late final bool unexpected = this is _FirestoreFailureUnexpected;
}

abstract class FirestoreDoc {
  String get id;
  Map<String, dynamic> toJson();
}

extension RiverFireServiceConfigX on FutureProvider<RiverFireConfig> {
  Provider<RiverFirestoreService<T>>
      riverFirestoreService<T extends FirestoreDoc>({
    required CollectionReference Function(Reader, FirebaseFirestore)
        getCollection,
    required T Function(DocumentSnapshot) fromFirestore,
    required Query Function(CollectionReference) getQuery,
    T Function(T)? toFirestore,
  }) =>
          createRiverFirestoreService(
            this,
            getCollection: getCollection,
            fromFirestore: fromFirestore,
            getQuery: getQuery,
            toFirestore: toFirestore,
          );
}

/// Watches a doc with [docId] for changes and exposes the state in a state notifier, also provides an interface for updating that doc
class RiverFirestoreDocWatcher<T extends FirestoreDoc>
    extends StateNotifierWithErrorProvider<FirestoreFailure, T?> {
  RiverFirestoreDocWatcher({
    required this.serviceProvider,
    required this.read,
    required this.docId,
    required T? initialState,
  }) : super(initialState) {
    init();
  }
  Future<void> init() async {
    final existsOrError = await _service.exists(docId);
    final result = existsOrError.fold((e) => null, (exists) => exists);
    if (result == false && state.current != null) {
      await _service.create(state.current!);
    }
    _service.watchById(docId).listen((s) => nextState = s);
  }

  final Provider<RiverFirestoreService<T>> serviceProvider;
  final Reader read;
  final String docId;

  RiverFirestoreService<T> get _service => read(serviceProvider);

  /// Updates the doc with [docId] with [updateFunction]
  ///
  /// If the current state is null, [updateIfNull] determines whether to overwrite or create the document
  Future<Either<FirestoreFailure, bool>> update(
    T Function(T) updateFunction, {
    bool updateIfNull = false,
  }) async {
    if (state.current != null || updateIfNull) {
      return (await _service.update(updateFunction(state.current!)))
          .map((r) => true);
    }
    return right<FirestoreFailure, bool>(false);
  }
}

extension DocWatcher<T extends FirestoreDoc>
    on Provider<RiverFirestoreService<T>> {
  StateNotifierProvider<RiverFirestoreDocWatcher<T>,
      StateError<FirestoreFailure, T?>> docWatcher(
          Provider<String> docIdProvider,
          {required T Function(Reader) initialState}) =>
      StateNotifierProvider<RiverFirestoreDocWatcher<T>,
          StateError<FirestoreFailure, T?>>(
        (ref) => RiverFirestoreDocWatcher<T>(
          serviceProvider: this,
          read: ref.read,
          docId: ref.watch(docIdProvider),
          initialState: initialState(ref.read),
        ),
      );
}

/// Watches a collection for changes and exposes the state in a state notifier, also provides an interface for updating that doc
class RiverFirestoreCollectionWatcher<T extends FirestoreDoc>
    extends StateNotifierWithErrorProvider<FirestoreFailure, List<T>> {
  RiverFirestoreCollectionWatcher({
    required this.serviceProvider,
    required this.read,
  }) : super(List.unmodifiable([])) {
    _service.watchAll().listen((s) => nextState = s);
  }

  final Reader read;
  final Provider<RiverFirestoreService<T>> serviceProvider;
  RiverFirestoreService<T> get _service => read(serviceProvider);

  /// Updates the doc with [id] with [updateFunction]
  Future<Either<FirestoreFailure, bool>> update(
      String id, T Function(T) updateFunction) async {
    if (state.current != null && state.hasError) {
      return (await _service.update(
              updateFunction(state.current!.firstWhere((t) => t.id == id))))
          .map((r) => true);
    }
    return right<FirestoreFailure, bool>(false);
  }

  /// Removes doc with [docId]
  Future<Either<FirestoreFailure, bool>> delete(String docId) async {
    if (state.current != null) {
      return (await _service.delete(docId)).map((r) => true);
    }
    return right<FirestoreFailure, bool>(false);
  }

  /// Adds the [doc] to the collection
  Future<Either<FirestoreFailure, bool>> create(T doc) async {
    if (state.current != null) {
      return (await _service.create(doc)).map((r) => true);
    }
    return right<FirestoreFailure, bool>(false);
  }
}

extension CollectionWatcher<T extends FirestoreDoc>
    on Provider<RiverFirestoreService<T>> {
  StateNotifierProvider<RiverFirestoreCollectionWatcher<T>,
          StateError<FirestoreFailure, List<T>>>
      collectionWatcher() => StateNotifierProvider<
              RiverFirestoreCollectionWatcher<T>,
              StateError<FirestoreFailure, List<T>>>(
            (ref) => RiverFirestoreCollectionWatcher<T>(
              serviceProvider: this,
              read: ref.read,
            ),
          );
}
