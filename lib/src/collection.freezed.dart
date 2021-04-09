// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirestoreFailure _$FirestoreFailureFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'insufficientPermissions':
      return _FirestoreFailureInsufficientPermissions.fromJson(json);
    case 'unableToUpdate':
      return _FirestoreFailureUnableToUpdate.fromJson(json);
    case 'unexpected':
      return _FirestoreFailureUnexpected.fromJson(json);
    case 'uninitialized':
      return _FirestoreFailureUninitialized.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$FirestoreFailureTearOff {
  const _$FirestoreFailureTearOff();

  _FirestoreFailureInsufficientPermissions insufficientPermissions() {
    return _FirestoreFailureInsufficientPermissions();
  }

  _FirestoreFailureUnableToUpdate unableToUpdate() {
    return _FirestoreFailureUnableToUpdate();
  }

  _FirestoreFailureUnexpected unexpected(String e) {
    return _FirestoreFailureUnexpected(
      e,
    );
  }

  _FirestoreFailureUninitialized uninitialized() {
    return _FirestoreFailureUninitialized();
  }

  FirestoreFailure fromJson(Map<String, Object> json) {
    return FirestoreFailure.fromJson(json);
  }
}

/// @nodoc
const $FirestoreFailure = _$FirestoreFailureTearOff();

/// @nodoc
mixin _$FirestoreFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() insufficientPermissions,
    required TResult Function() unableToUpdate,
    required TResult Function(String e) unexpected,
    required TResult Function() uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? insufficientPermissions,
    TResult Function()? unableToUpdate,
    TResult Function(String e)? unexpected,
    TResult Function()? uninitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreFailureInsufficientPermissions value)
        insufficientPermissions,
    required TResult Function(_FirestoreFailureUnableToUpdate value)
        unableToUpdate,
    required TResult Function(_FirestoreFailureUnexpected value) unexpected,
    required TResult Function(_FirestoreFailureUninitialized value)
        uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreFailureInsufficientPermissions value)?
        insufficientPermissions,
    TResult Function(_FirestoreFailureUnableToUpdate value)? unableToUpdate,
    TResult Function(_FirestoreFailureUnexpected value)? unexpected,
    TResult Function(_FirestoreFailureUninitialized value)? uninitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreFailureCopyWith<$Res> {
  factory $FirestoreFailureCopyWith(
          FirestoreFailure value, $Res Function(FirestoreFailure) then) =
      _$FirestoreFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirestoreFailureCopyWithImpl<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  _$FirestoreFailureCopyWithImpl(this._value, this._then);

  final FirestoreFailure _value;
  // ignore: unused_field
  final $Res Function(FirestoreFailure) _then;
}

/// @nodoc
abstract class _$FirestoreFailureInsufficientPermissionsCopyWith<$Res> {
  factory _$FirestoreFailureInsufficientPermissionsCopyWith(
          _FirestoreFailureInsufficientPermissions value,
          $Res Function(_FirestoreFailureInsufficientPermissions) then) =
      __$FirestoreFailureInsufficientPermissionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$FirestoreFailureInsufficientPermissionsCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res>
    implements _$FirestoreFailureInsufficientPermissionsCopyWith<$Res> {
  __$FirestoreFailureInsufficientPermissionsCopyWithImpl(
      _FirestoreFailureInsufficientPermissions _value,
      $Res Function(_FirestoreFailureInsufficientPermissions) _then)
      : super(_value,
            (v) => _then(v as _FirestoreFailureInsufficientPermissions));

  @override
  _FirestoreFailureInsufficientPermissions get _value =>
      super._value as _FirestoreFailureInsufficientPermissions;
}

@JsonSerializable()

/// @nodoc
class _$_FirestoreFailureInsufficientPermissions
    extends _FirestoreFailureInsufficientPermissions {
  _$_FirestoreFailureInsufficientPermissions() : super._();

  factory _$_FirestoreFailureInsufficientPermissions.fromJson(
          Map<String, dynamic> json) =>
      _$_$_FirestoreFailureInsufficientPermissionsFromJson(json);

  @override
  String toString() {
    return 'FirestoreFailure.insufficientPermissions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirestoreFailureInsufficientPermissions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() insufficientPermissions,
    required TResult Function() unableToUpdate,
    required TResult Function(String e) unexpected,
    required TResult Function() uninitialized,
  }) {
    return insufficientPermissions();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? insufficientPermissions,
    TResult Function()? unableToUpdate,
    TResult Function(String e)? unexpected,
    TResult Function()? uninitialized,
    required TResult orElse(),
  }) {
    if (insufficientPermissions != null) {
      return insufficientPermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreFailureInsufficientPermissions value)
        insufficientPermissions,
    required TResult Function(_FirestoreFailureUnableToUpdate value)
        unableToUpdate,
    required TResult Function(_FirestoreFailureUnexpected value) unexpected,
    required TResult Function(_FirestoreFailureUninitialized value)
        uninitialized,
  }) {
    return insufficientPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreFailureInsufficientPermissions value)?
        insufficientPermissions,
    TResult Function(_FirestoreFailureUnableToUpdate value)? unableToUpdate,
    TResult Function(_FirestoreFailureUnexpected value)? unexpected,
    TResult Function(_FirestoreFailureUninitialized value)? uninitialized,
    required TResult orElse(),
  }) {
    if (insufficientPermissions != null) {
      return insufficientPermissions(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FirestoreFailureInsufficientPermissionsToJson(this)
      ..['runtimeType'] = 'insufficientPermissions';
  }
}

abstract class _FirestoreFailureInsufficientPermissions
    extends FirestoreFailure {
  factory _FirestoreFailureInsufficientPermissions() =
      _$_FirestoreFailureInsufficientPermissions;
  _FirestoreFailureInsufficientPermissions._() : super._();

  factory _FirestoreFailureInsufficientPermissions.fromJson(
          Map<String, dynamic> json) =
      _$_FirestoreFailureInsufficientPermissions.fromJson;
}

/// @nodoc
abstract class _$FirestoreFailureUnableToUpdateCopyWith<$Res> {
  factory _$FirestoreFailureUnableToUpdateCopyWith(
          _FirestoreFailureUnableToUpdate value,
          $Res Function(_FirestoreFailureUnableToUpdate) then) =
      __$FirestoreFailureUnableToUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$FirestoreFailureUnableToUpdateCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res>
    implements _$FirestoreFailureUnableToUpdateCopyWith<$Res> {
  __$FirestoreFailureUnableToUpdateCopyWithImpl(
      _FirestoreFailureUnableToUpdate _value,
      $Res Function(_FirestoreFailureUnableToUpdate) _then)
      : super(_value, (v) => _then(v as _FirestoreFailureUnableToUpdate));

  @override
  _FirestoreFailureUnableToUpdate get _value =>
      super._value as _FirestoreFailureUnableToUpdate;
}

@JsonSerializable()

/// @nodoc
class _$_FirestoreFailureUnableToUpdate
    extends _FirestoreFailureUnableToUpdate {
  _$_FirestoreFailureUnableToUpdate() : super._();

  factory _$_FirestoreFailureUnableToUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$_$_FirestoreFailureUnableToUpdateFromJson(json);

  @override
  String toString() {
    return 'FirestoreFailure.unableToUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FirestoreFailureUnableToUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() insufficientPermissions,
    required TResult Function() unableToUpdate,
    required TResult Function(String e) unexpected,
    required TResult Function() uninitialized,
  }) {
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? insufficientPermissions,
    TResult Function()? unableToUpdate,
    TResult Function(String e)? unexpected,
    TResult Function()? uninitialized,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreFailureInsufficientPermissions value)
        insufficientPermissions,
    required TResult Function(_FirestoreFailureUnableToUpdate value)
        unableToUpdate,
    required TResult Function(_FirestoreFailureUnexpected value) unexpected,
    required TResult Function(_FirestoreFailureUninitialized value)
        uninitialized,
  }) {
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreFailureInsufficientPermissions value)?
        insufficientPermissions,
    TResult Function(_FirestoreFailureUnableToUpdate value)? unableToUpdate,
    TResult Function(_FirestoreFailureUnexpected value)? unexpected,
    TResult Function(_FirestoreFailureUninitialized value)? uninitialized,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FirestoreFailureUnableToUpdateToJson(this)
      ..['runtimeType'] = 'unableToUpdate';
  }
}

abstract class _FirestoreFailureUnableToUpdate extends FirestoreFailure {
  factory _FirestoreFailureUnableToUpdate() = _$_FirestoreFailureUnableToUpdate;
  _FirestoreFailureUnableToUpdate._() : super._();

  factory _FirestoreFailureUnableToUpdate.fromJson(Map<String, dynamic> json) =
      _$_FirestoreFailureUnableToUpdate.fromJson;
}

/// @nodoc
abstract class _$FirestoreFailureUnexpectedCopyWith<$Res> {
  factory _$FirestoreFailureUnexpectedCopyWith(
          _FirestoreFailureUnexpected value,
          $Res Function(_FirestoreFailureUnexpected) then) =
      __$FirestoreFailureUnexpectedCopyWithImpl<$Res>;
  $Res call({String e});
}

/// @nodoc
class __$FirestoreFailureUnexpectedCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res>
    implements _$FirestoreFailureUnexpectedCopyWith<$Res> {
  __$FirestoreFailureUnexpectedCopyWithImpl(_FirestoreFailureUnexpected _value,
      $Res Function(_FirestoreFailureUnexpected) _then)
      : super(_value, (v) => _then(v as _FirestoreFailureUnexpected));

  @override
  _FirestoreFailureUnexpected get _value =>
      super._value as _FirestoreFailureUnexpected;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_FirestoreFailureUnexpected(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FirestoreFailureUnexpected extends _FirestoreFailureUnexpected {
  _$_FirestoreFailureUnexpected(this.e) : super._();

  factory _$_FirestoreFailureUnexpected.fromJson(Map<String, dynamic> json) =>
      _$_$_FirestoreFailureUnexpectedFromJson(json);

  @override
  final String e;

  @override
  String toString() {
    return 'FirestoreFailure.unexpected(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirestoreFailureUnexpected &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  _$FirestoreFailureUnexpectedCopyWith<_FirestoreFailureUnexpected>
      get copyWith => __$FirestoreFailureUnexpectedCopyWithImpl<
          _FirestoreFailureUnexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() insufficientPermissions,
    required TResult Function() unableToUpdate,
    required TResult Function(String e) unexpected,
    required TResult Function() uninitialized,
  }) {
    return unexpected(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? insufficientPermissions,
    TResult Function()? unableToUpdate,
    TResult Function(String e)? unexpected,
    TResult Function()? uninitialized,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreFailureInsufficientPermissions value)
        insufficientPermissions,
    required TResult Function(_FirestoreFailureUnableToUpdate value)
        unableToUpdate,
    required TResult Function(_FirestoreFailureUnexpected value) unexpected,
    required TResult Function(_FirestoreFailureUninitialized value)
        uninitialized,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreFailureInsufficientPermissions value)?
        insufficientPermissions,
    TResult Function(_FirestoreFailureUnableToUpdate value)? unableToUpdate,
    TResult Function(_FirestoreFailureUnexpected value)? unexpected,
    TResult Function(_FirestoreFailureUninitialized value)? uninitialized,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FirestoreFailureUnexpectedToJson(this)
      ..['runtimeType'] = 'unexpected';
  }
}

abstract class _FirestoreFailureUnexpected extends FirestoreFailure {
  factory _FirestoreFailureUnexpected(String e) = _$_FirestoreFailureUnexpected;
  _FirestoreFailureUnexpected._() : super._();

  factory _FirestoreFailureUnexpected.fromJson(Map<String, dynamic> json) =
      _$_FirestoreFailureUnexpected.fromJson;

  String get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FirestoreFailureUnexpectedCopyWith<_FirestoreFailureUnexpected>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FirestoreFailureUninitializedCopyWith<$Res> {
  factory _$FirestoreFailureUninitializedCopyWith(
          _FirestoreFailureUninitialized value,
          $Res Function(_FirestoreFailureUninitialized) then) =
      __$FirestoreFailureUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$FirestoreFailureUninitializedCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res>
    implements _$FirestoreFailureUninitializedCopyWith<$Res> {
  __$FirestoreFailureUninitializedCopyWithImpl(
      _FirestoreFailureUninitialized _value,
      $Res Function(_FirestoreFailureUninitialized) _then)
      : super(_value, (v) => _then(v as _FirestoreFailureUninitialized));

  @override
  _FirestoreFailureUninitialized get _value =>
      super._value as _FirestoreFailureUninitialized;
}

@JsonSerializable()

/// @nodoc
class _$_FirestoreFailureUninitialized extends _FirestoreFailureUninitialized {
  _$_FirestoreFailureUninitialized() : super._();

  factory _$_FirestoreFailureUninitialized.fromJson(
          Map<String, dynamic> json) =>
      _$_$_FirestoreFailureUninitializedFromJson(json);

  @override
  String toString() {
    return 'FirestoreFailure.uninitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FirestoreFailureUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() insufficientPermissions,
    required TResult Function() unableToUpdate,
    required TResult Function(String e) unexpected,
    required TResult Function() uninitialized,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? insufficientPermissions,
    TResult Function()? unableToUpdate,
    TResult Function(String e)? unexpected,
    TResult Function()? uninitialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreFailureInsufficientPermissions value)
        insufficientPermissions,
    required TResult Function(_FirestoreFailureUnableToUpdate value)
        unableToUpdate,
    required TResult Function(_FirestoreFailureUnexpected value) unexpected,
    required TResult Function(_FirestoreFailureUninitialized value)
        uninitialized,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreFailureInsufficientPermissions value)?
        insufficientPermissions,
    TResult Function(_FirestoreFailureUnableToUpdate value)? unableToUpdate,
    TResult Function(_FirestoreFailureUnexpected value)? unexpected,
    TResult Function(_FirestoreFailureUninitialized value)? uninitialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FirestoreFailureUninitializedToJson(this)
      ..['runtimeType'] = 'uninitialized';
  }
}

abstract class _FirestoreFailureUninitialized extends FirestoreFailure {
  factory _FirestoreFailureUninitialized() = _$_FirestoreFailureUninitialized;
  _FirestoreFailureUninitialized._() : super._();

  factory _FirestoreFailureUninitialized.fromJson(Map<String, dynamic> json) =
      _$_FirestoreFailureUninitialized.fromJson;
}
