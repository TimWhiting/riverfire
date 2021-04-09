// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StateErrorTearOff {
  const _$StateErrorTearOff();

  _ValidState<E, T> valid<E, T>(T? state) {
    return _ValidState<E, T>(
      state,
    );
  }

  _ErrorState<E, T> error<E, T>({required E error, T? lastValidState}) {
    return _ErrorState<E, T>(
      error: error,
      lastValidState: lastValidState,
    );
  }
}

/// @nodoc
const $StateError = _$StateErrorTearOff();

/// @nodoc
mixin _$StateError<E, T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? state) valid,
    required TResult Function(E error, T? lastValidState) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? state)? valid,
    TResult Function(E error, T? lastValidState)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidState<E, T> value) valid,
    required TResult Function(_ErrorState<E, T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidState<E, T> value)? valid,
    TResult Function(_ErrorState<E, T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  $Res call({T? state});
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
    Object? state = freezed,
  }) {
    return _then(_ValidState<E, T>(
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
class _$_ValidState<E, T> extends _ValidState<E, T> {
  _$_ValidState(this.state) : super._();

  @override
  final T? state;

  @override
  String toString() {
    return 'StateError<$E, $T>.valid(state: $state)';
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

  @JsonKey(ignore: true)
  @override
  _$ValidStateCopyWith<E, T, _ValidState<E, T>> get copyWith =>
      __$ValidStateCopyWithImpl<E, T, _ValidState<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? state) valid,
    required TResult Function(E error, T? lastValidState) error,
  }) {
    return valid(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? state)? valid,
    TResult Function(E error, T? lastValidState)? error,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidState<E, T> value) valid,
    required TResult Function(_ErrorState<E, T> value) error,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidState<E, T> value)? valid,
    TResult Function(_ErrorState<E, T> value)? error,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class _ValidState<E, T> extends StateError<E, T> {
  factory _ValidState(T? state) = _$_ValidState<E, T>;
  _ValidState._() : super._();

  T? get state => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ValidStateCopyWith<E, T, _ValidState<E, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorStateCopyWith<E, T, $Res> {
  factory _$ErrorStateCopyWith(
          _ErrorState<E, T> value, $Res Function(_ErrorState<E, T>) then) =
      __$ErrorStateCopyWithImpl<E, T, $Res>;
  $Res call({E error, T? lastValidState});
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
    Object? error = freezed,
    Object? lastValidState = freezed,
  }) {
    return _then(_ErrorState<E, T>(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
      lastValidState: lastValidState == freezed
          ? _value.lastValidState
          : lastValidState // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
class _$_ErrorState<E, T> extends _ErrorState<E, T> {
  _$_ErrorState({required this.error, this.lastValidState}) : super._();

  @override
  final E error;
  @override
  final T? lastValidState;

  @override
  String toString() {
    return 'StateError<$E, $T>.error(error: $error, lastValidState: $lastValidState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorState<E, T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.lastValidState, lastValidState) ||
                const DeepCollectionEquality()
                    .equals(other.lastValidState, lastValidState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(lastValidState);

  @JsonKey(ignore: true)
  @override
  _$ErrorStateCopyWith<E, T, _ErrorState<E, T>> get copyWith =>
      __$ErrorStateCopyWithImpl<E, T, _ErrorState<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? state) valid,
    required TResult Function(E error, T? lastValidState) error,
  }) {
    return error(this.error, lastValidState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? state)? valid,
    TResult Function(E error, T? lastValidState)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, lastValidState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidState<E, T> value) valid,
    required TResult Function(_ErrorState<E, T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidState<E, T> value)? valid,
    TResult Function(_ErrorState<E, T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState<E, T> extends StateError<E, T> {
  factory _ErrorState({required E error, T? lastValidState}) =
      _$_ErrorState<E, T>;
  _ErrorState._() : super._();

  E get error => throw _privateConstructorUsedError;
  T? get lastValidState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorStateCopyWith<E, T, _ErrorState<E, T>> get copyWith =>
      throw _privateConstructorUsedError;
}
