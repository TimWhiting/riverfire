import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
export 'package:dartz/dartz.dart' show Either, Unit;
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
class StateError<E, T> with _$StateError<E, T> {
  StateError._();
  factory StateError.valid(T? state) = _ValidState;
  factory StateError.error({
    required E error,
    T? lastValidState,
  }) = _ErrorState;

  late final T? current = when(valid: (s) => s, error: (e, s) => s);

  late final bool hasError = this is _ErrorState;

  late final E? errorOrNull = when(valid: (s) => null, error: (e, s) => e);

  late final String errorString =
      when(valid: (s) => 'No Error', error: (e, s) => e.toString());
}
