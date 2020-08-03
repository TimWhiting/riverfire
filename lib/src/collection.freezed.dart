// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FirestoreFailure _$FirestoreFailureFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'insufficientPermissions':
      return _FirestoreFailureInsufficientPermissions.fromJson(json);
    case 'unableToUpdate':
      return _FirestoreFailureUnableToUpdate.fromJson(json);
    case 'unexpected':
      return _FirestoreFailureUnexpected.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$FirestoreFailureTearOff {
  const _$FirestoreFailureTearOff();

// ignore: unused_element
  _FirestoreFailureInsufficientPermissions insufficientPermissions() {
    return _FirestoreFailureInsufficientPermissions();
  }

// ignore: unused_element
  _FirestoreFailureUnableToUpdate unableToUpdate() {
    return _FirestoreFailureUnableToUpdate();
  }

// ignore: unused_element
  _FirestoreFailureUnexpected unexpected() {
    return _FirestoreFailureUnexpected();
  }
}

// ignore: unused_element
const $FirestoreFailure = _$FirestoreFailureTearOff();

mixin _$FirestoreFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result insufficientPermissions(),
    @required Result unableToUpdate(),
    @required Result unexpected(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result insufficientPermissions(),
    Result unableToUpdate(),
    Result unexpected(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result insufficientPermissions(
            _FirestoreFailureInsufficientPermissions value),
    @required Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    @required Result unexpected(_FirestoreFailureUnexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result insufficientPermissions(
        _FirestoreFailureInsufficientPermissions value),
    Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    Result unexpected(_FirestoreFailureUnexpected value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

abstract class $FirestoreFailureCopyWith<$Res> {
  factory $FirestoreFailureCopyWith(
          FirestoreFailure value, $Res Function(FirestoreFailure) then) =
      _$FirestoreFailureCopyWithImpl<$Res>;
}

class _$FirestoreFailureCopyWithImpl<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  _$FirestoreFailureCopyWithImpl(this._value, this._then);

  final FirestoreFailure _value;
  // ignore: unused_field
  final $Res Function(FirestoreFailure) _then;
}

abstract class _$FirestoreFailureInsufficientPermissionsCopyWith<$Res> {
  factory _$FirestoreFailureInsufficientPermissionsCopyWith(
          _FirestoreFailureInsufficientPermissions value,
          $Res Function(_FirestoreFailureInsufficientPermissions) then) =
      __$FirestoreFailureInsufficientPermissionsCopyWithImpl<$Res>;
}

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
class _$_FirestoreFailureInsufficientPermissions
    implements _FirestoreFailureInsufficientPermissions {
  _$_FirestoreFailureInsufficientPermissions();

  factory _$_FirestoreFailureInsufficientPermissions.fromJson(
          Map<String, dynamic> json) =>
      _$_$_FirestoreFailureInsufficientPermissionsFromJson(json);

  bool _didinsufficientPermissions = false;
  bool _insufficientPermissions;

  @override
  bool get insufficientPermissions {
    if (_didinsufficientPermissions == false) {
      _didinsufficientPermissions = true;
      _insufficientPermissions =
          this is _FirestoreFailureInsufficientPermissions;
    }
    return _insufficientPermissions;
  }

  bool _didunableToUpdate = false;
  bool _unableToUpdate;

  @override
  bool get unableToUpdate {
    if (_didunableToUpdate == false) {
      _didunableToUpdate = true;
      _unableToUpdate = this is _FirestoreFailureUnableToUpdate;
    }
    return _unableToUpdate;
  }

  bool _didunexpected = false;
  bool _unexpected;

  @override
  bool get unexpected {
    if (_didunexpected == false) {
      _didunexpected = true;
      _unexpected = this is _FirestoreFailureUnexpected;
    }
    return _unexpected;
  }

  @override
  String toString() {
    return 'FirestoreFailure.insufficientPermissions(insufficientPermissions: $insufficientPermissions, unableToUpdate: $unableToUpdate, unexpected: $unexpected)';
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
  Result when<Result extends Object>({
    @required Result insufficientPermissions(),
    @required Result unableToUpdate(),
    @required Result unexpected(),
  }) {
    assert(insufficientPermissions != null);
    assert(unableToUpdate != null);
    assert(unexpected != null);
    return insufficientPermissions();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result insufficientPermissions(),
    Result unableToUpdate(),
    Result unexpected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (insufficientPermissions != null) {
      return insufficientPermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result insufficientPermissions(
            _FirestoreFailureInsufficientPermissions value),
    @required Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    @required Result unexpected(_FirestoreFailureUnexpected value),
  }) {
    assert(insufficientPermissions != null);
    assert(unableToUpdate != null);
    assert(unexpected != null);
    return insufficientPermissions(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result insufficientPermissions(
        _FirestoreFailureInsufficientPermissions value),
    Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    Result unexpected(_FirestoreFailureUnexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
    implements FirestoreFailure {
  factory _FirestoreFailureInsufficientPermissions() =
      _$_FirestoreFailureInsufficientPermissions;

  factory _FirestoreFailureInsufficientPermissions.fromJson(
          Map<String, dynamic> json) =
      _$_FirestoreFailureInsufficientPermissions.fromJson;
}

abstract class _$FirestoreFailureUnableToUpdateCopyWith<$Res> {
  factory _$FirestoreFailureUnableToUpdateCopyWith(
          _FirestoreFailureUnableToUpdate value,
          $Res Function(_FirestoreFailureUnableToUpdate) then) =
      __$FirestoreFailureUnableToUpdateCopyWithImpl<$Res>;
}

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
class _$_FirestoreFailureUnableToUpdate
    implements _FirestoreFailureUnableToUpdate {
  _$_FirestoreFailureUnableToUpdate();

  factory _$_FirestoreFailureUnableToUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$_$_FirestoreFailureUnableToUpdateFromJson(json);

  bool _didinsufficientPermissions = false;
  bool _insufficientPermissions;

  @override
  bool get insufficientPermissions {
    if (_didinsufficientPermissions == false) {
      _didinsufficientPermissions = true;
      _insufficientPermissions =
          this is _FirestoreFailureInsufficientPermissions;
    }
    return _insufficientPermissions;
  }

  bool _didunableToUpdate = false;
  bool _unableToUpdate;

  @override
  bool get unableToUpdate {
    if (_didunableToUpdate == false) {
      _didunableToUpdate = true;
      _unableToUpdate = this is _FirestoreFailureUnableToUpdate;
    }
    return _unableToUpdate;
  }

  bool _didunexpected = false;
  bool _unexpected;

  @override
  bool get unexpected {
    if (_didunexpected == false) {
      _didunexpected = true;
      _unexpected = this is _FirestoreFailureUnexpected;
    }
    return _unexpected;
  }

  @override
  String toString() {
    return 'FirestoreFailure.unableToUpdate(insufficientPermissions: $insufficientPermissions, unableToUpdate: $unableToUpdate, unexpected: $unexpected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FirestoreFailureUnableToUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result insufficientPermissions(),
    @required Result unableToUpdate(),
    @required Result unexpected(),
  }) {
    assert(insufficientPermissions != null);
    assert(unableToUpdate != null);
    assert(unexpected != null);
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result insufficientPermissions(),
    Result unableToUpdate(),
    Result unexpected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result insufficientPermissions(
            _FirestoreFailureInsufficientPermissions value),
    @required Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    @required Result unexpected(_FirestoreFailureUnexpected value),
  }) {
    assert(insufficientPermissions != null);
    assert(unableToUpdate != null);
    assert(unexpected != null);
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result insufficientPermissions(
        _FirestoreFailureInsufficientPermissions value),
    Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    Result unexpected(_FirestoreFailureUnexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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

abstract class _FirestoreFailureUnableToUpdate implements FirestoreFailure {
  factory _FirestoreFailureUnableToUpdate() = _$_FirestoreFailureUnableToUpdate;

  factory _FirestoreFailureUnableToUpdate.fromJson(Map<String, dynamic> json) =
      _$_FirestoreFailureUnableToUpdate.fromJson;
}

abstract class _$FirestoreFailureUnexpectedCopyWith<$Res> {
  factory _$FirestoreFailureUnexpectedCopyWith(
          _FirestoreFailureUnexpected value,
          $Res Function(_FirestoreFailureUnexpected) then) =
      __$FirestoreFailureUnexpectedCopyWithImpl<$Res>;
}

class __$FirestoreFailureUnexpectedCopyWithImpl<$Res>
    extends _$FirestoreFailureCopyWithImpl<$Res>
    implements _$FirestoreFailureUnexpectedCopyWith<$Res> {
  __$FirestoreFailureUnexpectedCopyWithImpl(_FirestoreFailureUnexpected _value,
      $Res Function(_FirestoreFailureUnexpected) _then)
      : super(_value, (v) => _then(v as _FirestoreFailureUnexpected));

  @override
  _FirestoreFailureUnexpected get _value =>
      super._value as _FirestoreFailureUnexpected;
}

@JsonSerializable()
class _$_FirestoreFailureUnexpected implements _FirestoreFailureUnexpected {
  _$_FirestoreFailureUnexpected();

  factory _$_FirestoreFailureUnexpected.fromJson(Map<String, dynamic> json) =>
      _$_$_FirestoreFailureUnexpectedFromJson(json);

  bool _didinsufficientPermissions = false;
  bool _insufficientPermissions;

  @override
  bool get insufficientPermissions {
    if (_didinsufficientPermissions == false) {
      _didinsufficientPermissions = true;
      _insufficientPermissions =
          this is _FirestoreFailureInsufficientPermissions;
    }
    return _insufficientPermissions;
  }

  bool _didunableToUpdate = false;
  bool _unableToUpdate;

  @override
  bool get unableToUpdate {
    if (_didunableToUpdate == false) {
      _didunableToUpdate = true;
      _unableToUpdate = this is _FirestoreFailureUnableToUpdate;
    }
    return _unableToUpdate;
  }

  bool _didunexpected = false;
  bool _unexpected;

  @override
  bool get unexpected {
    if (_didunexpected == false) {
      _didunexpected = true;
      _unexpected = this is _FirestoreFailureUnexpected;
    }
    return _unexpected;
  }

  @override
  String toString() {
    return 'FirestoreFailure.unexpected(insufficientPermissions: $insufficientPermissions, unableToUpdate: $unableToUpdate, unexpected: $unexpected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FirestoreFailureUnexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result insufficientPermissions(),
    @required Result unableToUpdate(),
    @required Result unexpected(),
  }) {
    assert(insufficientPermissions != null);
    assert(unableToUpdate != null);
    assert(unexpected != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result insufficientPermissions(),
    Result unableToUpdate(),
    Result unexpected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result insufficientPermissions(
            _FirestoreFailureInsufficientPermissions value),
    @required Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    @required Result unexpected(_FirestoreFailureUnexpected value),
  }) {
    assert(insufficientPermissions != null);
    assert(unableToUpdate != null);
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result insufficientPermissions(
        _FirestoreFailureInsufficientPermissions value),
    Result unableToUpdate(_FirestoreFailureUnableToUpdate value),
    Result unexpected(_FirestoreFailureUnexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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

abstract class _FirestoreFailureUnexpected implements FirestoreFailure {
  factory _FirestoreFailureUnexpected() = _$_FirestoreFailureUnexpected;

  factory _FirestoreFailureUnexpected.fromJson(Map<String, dynamic> json) =
      _$_FirestoreFailureUnexpected.fromJson;
}
