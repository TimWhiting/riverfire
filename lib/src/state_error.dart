import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/all.dart';
part 'state_error.freezed.dart';

class StateNotifierWithErrorProvider<E, T>
    extends StateNotifier<StateError<E, T>> {
  StateNotifierWithErrorProvider(T initialState)
      : super(StateError.valid(initialState));

  // ignore: avoid_setters_without_getters
  set nextState(Either<E, T> s) {
    state = s.fold(
      (e) => StateError.error(lastValidState: state.current, error: e),
      (v) => StateError.valid(v),
    );
  }

  void clearError() {
    if (state.hasError) {
      state = state.map(
        valid: (s) => s,
        error: (e) => StateError.valid(e.lastValidState),
      );
    }
  }
}

/// A class that handles errors, but keeps the last state
@freezed
abstract class StateError<E, T> with _$StateError<E, T> {
  factory StateError.valid(T state) = _ValidState;
  factory StateError.error({T lastValidState, E error}) = _ErrorState;

  @late
  T get current => when(valid: (s) => s, error: (s, e) => s);
  @late
  bool get hasError => this is _ErrorState;
  @late
  E get error => when(valid: (s) => null, error: (s, e) => e);
  @late
  String get errorString =>
      when(valid: (s) => 'No Error', error: (s, e) => e.toString());
}
