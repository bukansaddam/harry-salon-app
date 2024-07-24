// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailUserResponse _$DetailUserResponseFromJson(Map<String, dynamic> json) {
  return _DetailUserResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailUserResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailUser get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailUserResponseCopyWith<DetailUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailUserResponseCopyWith<$Res> {
  factory $DetailUserResponseCopyWith(
          DetailUserResponse value, $Res Function(DetailUserResponse) then) =
      _$DetailUserResponseCopyWithImpl<$Res, DetailUserResponse>;
  @useResult
  $Res call({bool success, String message, DetailUser data});

  $DetailUserCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailUserResponseCopyWithImpl<$Res, $Val extends DetailUserResponse>
    implements $DetailUserResponseCopyWith<$Res> {
  _$DetailUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailUserCopyWith<$Res> get data {
    return $DetailUserCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailUserResponseImplCopyWith<$Res>
    implements $DetailUserResponseCopyWith<$Res> {
  factory _$$DetailUserResponseImplCopyWith(_$DetailUserResponseImpl value,
          $Res Function(_$DetailUserResponseImpl) then) =
      __$$DetailUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailUser data});

  @override
  $DetailUserCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailUserResponseImplCopyWithImpl<$Res>
    extends _$DetailUserResponseCopyWithImpl<$Res, _$DetailUserResponseImpl>
    implements _$$DetailUserResponseImplCopyWith<$Res> {
  __$$DetailUserResponseImplCopyWithImpl(_$DetailUserResponseImpl _value,
      $Res Function(_$DetailUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DetailUserResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailUserResponseImpl implements _DetailUserResponse {
  const _$DetailUserResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailUserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailUser data;

  @override
  String toString() {
    return 'DetailUserResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailUserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailUserResponseImplCopyWith<_$DetailUserResponseImpl> get copyWith =>
      __$$DetailUserResponseImplCopyWithImpl<_$DetailUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailUserResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailUserResponse implements DetailUserResponse {
  const factory _DetailUserResponse(
      {required final bool success,
      required final String message,
      required final DetailUser data}) = _$DetailUserResponseImpl;

  factory _DetailUserResponse.fromJson(Map<String, dynamic> json) =
      _$DetailUserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailUser get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailUserResponseImplCopyWith<_$DetailUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailUser _$DetailUserFromJson(Map<String, dynamic> json) {
  return _DetailUser.fromJson(json);
}

/// @nodoc
mixin _$DetailUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  int? get phone => throw _privateConstructorUsedError;
  String? get storeLocation => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailUserCopyWith<DetailUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailUserCopyWith<$Res> {
  factory $DetailUserCopyWith(
          DetailUser value, $Res Function(DetailUser) then) =
      _$DetailUserCopyWithImpl<$Res, DetailUser>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String password,
      int? phone,
      String? storeLocation,
      String address,
      String avatar,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DetailUserCopyWithImpl<$Res, $Val extends DetailUser>
    implements $DetailUserCopyWith<$Res> {
  _$DetailUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phone = freezed,
    Object? storeLocation = freezed,
    Object? address = null,
    Object? avatar = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int?,
      storeLocation: freezed == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailUserImplCopyWith<$Res>
    implements $DetailUserCopyWith<$Res> {
  factory _$$DetailUserImplCopyWith(
          _$DetailUserImpl value, $Res Function(_$DetailUserImpl) then) =
      __$$DetailUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String password,
      int? phone,
      String? storeLocation,
      String address,
      String avatar,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DetailUserImplCopyWithImpl<$Res>
    extends _$DetailUserCopyWithImpl<$Res, _$DetailUserImpl>
    implements _$$DetailUserImplCopyWith<$Res> {
  __$$DetailUserImplCopyWithImpl(
      _$DetailUserImpl _value, $Res Function(_$DetailUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phone = freezed,
    Object? storeLocation = freezed,
    Object? address = null,
    Object? avatar = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DetailUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int?,
      storeLocation: freezed == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailUserImpl implements _DetailUser {
  const _$DetailUserImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.storeLocation,
      required this.address,
      required this.avatar,
      required this.createdAt,
      required this.updatedAt});

  factory _$DetailUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final int? phone;
  @override
  final String? storeLocation;
  @override
  final String address;
  @override
  final String avatar;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DetailUser(id: $id, name: $name, email: $email, password: $password, phone: $phone, storeLocation: $storeLocation, address: $address, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.storeLocation, storeLocation) ||
                other.storeLocation == storeLocation) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, password, phone,
      storeLocation, address, avatar, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailUserImplCopyWith<_$DetailUserImpl> get copyWith =>
      __$$DetailUserImplCopyWithImpl<_$DetailUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailUserImplToJson(
      this,
    );
  }
}

abstract class _DetailUser implements DetailUser {
  const factory _DetailUser(
      {required final String id,
      required final String name,
      required final String email,
      required final String password,
      required final int? phone,
      required final String? storeLocation,
      required final String address,
      required final String avatar,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DetailUserImpl;

  factory _DetailUser.fromJson(Map<String, dynamic> json) =
      _$DetailUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  int? get phone;
  @override
  String? get storeLocation;
  @override
  String get address;
  @override
  String get avatar;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DetailUserImplCopyWith<_$DetailUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
