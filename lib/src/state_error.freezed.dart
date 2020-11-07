// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StateErrorTearOff {
  const _$StateErrorTearOff();

// ignore: unused_element
  _ValidState<E, T> valid<E, T>(T state) {
    return _ValidState<E, T>(
      state,
    );
  }

// ignore: unused_element
  _ErrorState<E, T> error<E, T>({T lastValidState, E error}) {
    return _ErrorState<E, T>(
      lastValidState: lastValidState,
      error: error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StateError = _$StateErrorTearOff();

/// @nodoc
mixin _$StateError<E, T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result valid(T state),
    @required Result error(T lastValidState, E error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result valid(T state),
    Result error(T lastValidState, E error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result valid(_ValidState<E, T> value),
    @required Result error(_ErrorState<E, T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result valid(_ValidState<E, T> value),
    Result error(_ErrorState<E, T> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $StateErrorCopyWith<E, T, $Res> {
  factory $StateErrorCopyWith(
          StateError<E, T> value, $Res Function(StateError<E, T>) then) =
      _$StateErrorCopyWithImpl<E, T, $Res>;
}

/// @nodoc
class _$StateErrorCopyWithImpl<E, T, $Res>
    implements $StateErrorCopyWith<E, T, $Res> {
  _$StateErrorCopyWithImpl(this._value, this._then);

  final StateError<E, T> _value;
  // ignore: unused_field
  final $Res Function(StateError<E, T>) _then;
}

/// @nodoc
abstract class _$ValidStateCopyWith<E, T, $Res> {
  factory _$ValidStateCopyWith(
          _ValidState<E, T> value, $Res Function(_ValidState<E, T>) then) =
      __$ValidStateCopyWithImpl<E, T, $Res>;
  $Res call({T state});
}

/// @nodoc
class __$ValidStateCopyWithImpl<E, T, $Res>
    extends _$StateErrorCopyWithImpl<E, T, $Res>
    implements _$ValidStateCopyWith<E, T, $Res> {
  __$ValidStateCopyWithImpl(
      _ValidState<E, T> _value, $Res Function(_ValidState<E, T>) _then)
      : super(_value, (v) => _then(v as _ValidState<E, T>));

  @override
  _ValidState<E, T> get _value => super._value as _ValidState<E, T>;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(_ValidState<E, T>(
      state == freezed ? _value.state : state as T,
    ));
  }
}

/// @nodoc
class _$_ValidState<E, T> implements _ValidState<E, T> {
  _$_ValidState(this.state) : assert(state != null);

  @override
  final T state;

  bool _didcurrent = false;
  T _current;

  @override
  T get current {
    if (_didcurrent == false) {
      _didcurrent = true;
      _current = when(valid: (s) => s, error: (s, e) => s);
    }
    return _current;
  }

  bool _didhasError = false;
  bool _hasError;

  @override
  bool get hasError {
    if (_didhasError == false) {
      _didhasError = true;
      _hasError = this is _ErrorState;
    }
    return _hasError;
  }

  bool _diderror = false;
  E _error;

  @override
  E get error {
    if (_diderror == false) {
      _diderror = true;
      _error = when(valid: (s) => null, error: (s, e) => e);
    }
    return _error;
  }

  bool _diderrorString = false;
  String _errorString;

  @override
  String get errorString {
    if (_diderrorString == false) {
      _diderrorString = true;
      _errorString =
          when(valid: (s) => 'No Error', error: (s, e) => e.toString());
    }
    return _errorString;
  }

  @override
  String toString() {
    return 'StateError<$E, $T>.valid(state: $state, current: $current, hasError: $hasError, error: $error, errorString: $errorString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ValidState<E, T> &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @override
  _$ValidStateCopyWith<E, T, _ValidState<E, T>> get copyWith =>
      __$ValidStateCopyWithImpl<E, T, _ValidState<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result valid(T state),
    @required Result error(T lastValidState, E error),
  }) {
    assert(valid != null);
    assert(error != null);
    return valid(state);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result valid(T state),
    Result error(T lastValidState, E error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (valid != null) {
      return valid(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result valid(_ValidState<E, T> value),
    @required Result error(_ErrorState<E, T> value),
  }) {
    assert(valid != null);
    assert(error != null);
    return valid(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result valid(_ValidState<E, T> value),
    Result error(_ErrorState<E, T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class _ValidState<E, T> implements StateError<E, T> {
  factory _ValidState(T state) = _$_ValidState<E, T>;

  T get state;
  _$ValidStateCopyWith<E, T, _ValidState<E, T>> get copyWith;
}

/// @nodoc
abstract class _$ErrorStateCopyWith<E, T, $Res> {
  factory _$ErrorStateCopyWith(
          _ErrorState<E, T> value, $Res Function(_ErrorState<E, T>) then) =
      __$ErrorStateCopyWithImpl<E, T, $Res>;
  $Res call({T lastValidState, E error});
}

/// @nodoc
class __$ErrorStateCopyWithImpl<E, T, $Res>
    extends _$StateErrorCopyWithImpl<E, T, $Res>
    implements _$ErrorStateCopyWith<E, T, $Res> {
  __$ErrorStateCopyWithImpl(
      _ErrorState<E, T> _value, $Res Function(_ErrorState<E, T>) _then)
      : super(_value, (v) => _then(v as _ErrorState<E, T>));

  @override
  _ErrorState<E, T> get _value => super._value as _ErrorState<E, T>;

  @override
  $Res call({
    Object lastValidState = freezed,
    Object error = freezed,
  }) {
    return _then(_ErrorState<E, T>(
      lastValidState: lastValidState == freezed
          ? _value.lastValidState
          : lastValidState as T,
      error: error == freezed ? _value.error : error as E,
    ));
  }
}

/// @nodoc
class _$_ErrorState<E, T> implements _ErrorState<E, T> {
  _$_ErrorState({this.lastValidState, this.error});

  @override
  final T lastValidState;
  @override
  final E error;

  bool _didcurrent = false;
  T _current;

  @override
  T get current {
    if (_didcurrent == false) {
      _didcurrent = true;
      _current = when(valid: (s) => s, error: (s, e) => s);
    }
    return _current;
  }

  bool _didhasError = false;
  bool _hasError;

  @override
  bool get hasError {
    if (_didhasError == false) {
      _didhasError = true;
      _hasError = this is _ErrorState;
    }
    return _hasError;
  }

  bool _diderror = false;
  E _error;

  @override
  E get error {
    if (_diderror == false) {
      _diderror = true;
      _error = when(valid: (s) => null, error: (s, e) => e);
    }
    return _error;
  }

  bool _diderrorString = false;
  String _errorString;

  @override
  String get errorString {
    if (_diderrorString == false) {
      _diderrorString = true;
      _errorString =
          when(valid: (s) => 'No Error', error: (s, e) => e.toString());
    }
    return _errorString;
  }

  @override
  String toString() {
    return 'StateError<$E, $T>.error(lastValidState: $lastValidState, error: $error, current: $current, hasError: $hasError, error: $error, errorString: $errorString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorState<E, T> &&
            (identical(other.lastValidState, lastValidState) ||
                const DeepCollectionEquality()
                    .equals(other.lastValidState, lastValidState)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lastValidState) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$ErrorStateCopyWith<E, T, _ErrorState<E, T>> get copyWith =>
      __$ErrorStateCopyWithImpl<E, T, _ErrorState<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result valid(T state),
    @required Result error(T lastValidState, E error),
  }) {
    assert(valid != null);
    assert(error != null);
    return error(lastValidState, this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result valid(T state),
    Result error(T lastValidState, E error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(lastValidState, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result valid(_ValidState<E, T> value),
    @required Result error(_ErrorState<E, T> value),
  }) {
    assert(valid != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result valid(_ValidState<E, T> value),
    Result error(_ErrorState<E, T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState<E, T> implements StateError<E, T> {
  factory _ErrorState({T lastValidState, E error}) = _$_ErrorState<E, T>;

  T get lastValidState;
  E get error;
  _$ErrorStateCopyWith<E, T, _ErrorState<E, T>> get copyWith;
}
