// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailEmployeeResponse _$DetailEmployeeResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailEmployeeResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailEmployeeResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailEmployee get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailEmployeeResponseCopyWith<DetailEmployeeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailEmployeeResponseCopyWith<$Res> {
  factory $DetailEmployeeResponseCopyWith(DetailEmployeeResponse value,
          $Res Function(DetailEmployeeResponse) then) =
      _$DetailEmployeeResponseCopyWithImpl<$Res, DetailEmployeeResponse>;
  @useResult
  $Res call({bool success, String message, DetailEmployee data});

  $DetailEmployeeCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailEmployeeResponseCopyWithImpl<$Res,
        $Val extends DetailEmployeeResponse>
    implements $DetailEmployeeResponseCopyWith<$Res> {
  _$DetailEmployeeResponseCopyWithImpl(this._value, this._then);

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
              as DetailEmployee,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailEmployeeCopyWith<$Res> get data {
    return $DetailEmployeeCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailEmployeeResponseImplCopyWith<$Res>
    implements $DetailEmployeeResponseCopyWith<$Res> {
  factory _$$DetailEmployeeResponseImplCopyWith(
          _$DetailEmployeeResponseImpl value,
          $Res Function(_$DetailEmployeeResponseImpl) then) =
      __$$DetailEmployeeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailEmployee data});

  @override
  $DetailEmployeeCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailEmployeeResponseImplCopyWithImpl<$Res>
    extends _$DetailEmployeeResponseCopyWithImpl<$Res,
        _$DetailEmployeeResponseImpl>
    implements _$$DetailEmployeeResponseImplCopyWith<$Res> {
  __$$DetailEmployeeResponseImplCopyWithImpl(
      _$DetailEmployeeResponseImpl _value,
      $Res Function(_$DetailEmployeeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DetailEmployeeResponseImpl(
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
              as DetailEmployee,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailEmployeeResponseImpl implements _DetailEmployeeResponse {
  const _$DetailEmployeeResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailEmployeeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailEmployeeResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailEmployee data;

  @override
  String toString() {
    return 'DetailEmployeeResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailEmployeeResponseImpl &&
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
  _$$DetailEmployeeResponseImplCopyWith<_$DetailEmployeeResponseImpl>
      get copyWith => __$$DetailEmployeeResponseImplCopyWithImpl<
          _$DetailEmployeeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailEmployeeResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailEmployeeResponse implements DetailEmployeeResponse {
  const factory _DetailEmployeeResponse(
      {required final bool success,
      required final String message,
      required final DetailEmployee data}) = _$DetailEmployeeResponseImpl;

  factory _DetailEmployeeResponse.fromJson(Map<String, dynamic> json) =
      _$DetailEmployeeResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailEmployee get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailEmployeeResponseImplCopyWith<_$DetailEmployeeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailEmployee _$DetailEmployeeFromJson(Map<String, dynamic> json) {
  return _DetailEmployee.fromJson(json);
}

/// @nodoc
mixin _$DetailEmployee {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  dynamic get storeId => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get storeLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailEmployeeCopyWith<DetailEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailEmployeeCopyWith<$Res> {
  factory $DetailEmployeeCopyWith(
          DetailEmployee value, $Res Function(DetailEmployee) then) =
      _$DetailEmployeeCopyWithImpl<$Res, DetailEmployee>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String password,
      int phone,
      String address,
      String avatar,
      dynamic storeId,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      String? storeLocation});
}

/// @nodoc
class _$DetailEmployeeCopyWithImpl<$Res, $Val extends DetailEmployee>
    implements $DetailEmployeeCopyWith<$Res> {
  _$DetailEmployeeCopyWithImpl(this._value, this._then);

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
    Object? phone = null,
    Object? address = null,
    Object? avatar = null,
    Object? storeId = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? storeLocation = freezed,
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
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      storeLocation: freezed == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailEmployeeImplCopyWith<$Res>
    implements $DetailEmployeeCopyWith<$Res> {
  factory _$$DetailEmployeeImplCopyWith(_$DetailEmployeeImpl value,
          $Res Function(_$DetailEmployeeImpl) then) =
      __$$DetailEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String password,
      int phone,
      String address,
      String avatar,
      dynamic storeId,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      String? storeLocation});
}

/// @nodoc
class __$$DetailEmployeeImplCopyWithImpl<$Res>
    extends _$DetailEmployeeCopyWithImpl<$Res, _$DetailEmployeeImpl>
    implements _$$DetailEmployeeImplCopyWith<$Res> {
  __$$DetailEmployeeImplCopyWithImpl(
      _$DetailEmployeeImpl _value, $Res Function(_$DetailEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? address = null,
    Object? avatar = null,
    Object? storeId = freezed,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? storeLocation = freezed,
  }) {
    return _then(_$DetailEmployeeImpl(
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
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      storeLocation: freezed == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailEmployeeImpl implements _DetailEmployee {
  const _$DetailEmployeeImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.address,
      required this.avatar,
      required this.storeId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required this.storeLocation});

  factory _$DetailEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailEmployeeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final int phone;
  @override
  final String address;
  @override
  final String avatar;
  @override
  final dynamic storeId;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? storeLocation;

  @override
  String toString() {
    return 'DetailEmployee(id: $id, name: $name, email: $email, password: $password, phone: $phone, address: $address, avatar: $avatar, storeId: $storeId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, storeLocation: $storeLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.storeLocation, storeLocation) ||
                other.storeLocation == storeLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      password,
      phone,
      address,
      avatar,
      const DeepCollectionEquality().hash(storeId),
      createdBy,
      createdAt,
      updatedAt,
      storeLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailEmployeeImplCopyWith<_$DetailEmployeeImpl> get copyWith =>
      __$$DetailEmployeeImplCopyWithImpl<_$DetailEmployeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailEmployeeImplToJson(
      this,
    );
  }
}

abstract class _DetailEmployee implements DetailEmployee {
  const factory _DetailEmployee(
      {required final String id,
      required final String name,
      required final String email,
      required final String password,
      required final int phone,
      required final String address,
      required final String avatar,
      required final dynamic storeId,
      required final String createdBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String? storeLocation}) = _$DetailEmployeeImpl;

  factory _DetailEmployee.fromJson(Map<String, dynamic> json) =
      _$DetailEmployeeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  int get phone;
  @override
  String get address;
  @override
  String get avatar;
  @override
  dynamic get storeId;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get storeLocation;
  @override
  @JsonKey(ignore: true)
  _$$DetailEmployeeImplCopyWith<_$DetailEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
