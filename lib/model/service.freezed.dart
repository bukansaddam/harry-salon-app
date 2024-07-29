// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) {
  return _ServiceResponse.fromJson(json);
}

/// @nodoc
mixin _$ServiceResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ServiceResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceResponseCopyWith<ServiceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceResponseCopyWith<$Res> {
  factory $ServiceResponseCopyWith(
          ServiceResponse value, $Res Function(ServiceResponse) then) =
      _$ServiceResponseCopyWithImpl<$Res, ServiceResponse>;
  @useResult
  $Res call({bool success, String message, ServiceResult result});

  $ServiceResultCopyWith<$Res> get result;
}

/// @nodoc
class _$ServiceResponseCopyWithImpl<$Res, $Val extends ServiceResponse>
    implements $ServiceResponseCopyWith<$Res> {
  _$ServiceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
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
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ServiceResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceResultCopyWith<$Res> get result {
    return $ServiceResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceResponseImplCopyWith<$Res>
    implements $ServiceResponseCopyWith<$Res> {
  factory _$$ServiceResponseImplCopyWith(_$ServiceResponseImpl value,
          $Res Function(_$ServiceResponseImpl) then) =
      __$$ServiceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ServiceResult result});

  @override
  $ServiceResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$ServiceResponseImplCopyWithImpl<$Res>
    extends _$ServiceResponseCopyWithImpl<$Res, _$ServiceResponseImpl>
    implements _$$ServiceResponseImplCopyWith<$Res> {
  __$$ServiceResponseImplCopyWithImpl(
      _$ServiceResponseImpl _value, $Res Function(_$ServiceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$ServiceResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ServiceResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceResponseImpl implements _ServiceResponse {
  const _$ServiceResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$ServiceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final ServiceResult result;

  @override
  String toString() {
    return 'ServiceResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResponseImplCopyWith<_$ServiceResponseImpl> get copyWith =>
      __$$ServiceResponseImplCopyWithImpl<_$ServiceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceResponseImplToJson(
      this,
    );
  }
}

abstract class _ServiceResponse implements ServiceResponse {
  const factory _ServiceResponse(
      {required final bool success,
      required final String message,
      required final ServiceResult result}) = _$ServiceResponseImpl;

  factory _ServiceResponse.fromJson(Map<String, dynamic> json) =
      _$ServiceResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ServiceResult get result;
  @override
  @JsonKey(ignore: true)
  _$$ServiceResponseImplCopyWith<_$ServiceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceResult _$ServiceResultFromJson(Map<String, dynamic> json) {
  return _ServiceResult.fromJson(json);
}

/// @nodoc
mixin _$ServiceResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Service> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceResultCopyWith<ServiceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceResultCopyWith<$Res> {
  factory $ServiceResultCopyWith(
          ServiceResult value, $Res Function(ServiceResult) then) =
      _$ServiceResultCopyWithImpl<$Res, ServiceResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Service> data});
}

/// @nodoc
class _$ServiceResultCopyWithImpl<$Res, $Val extends ServiceResult>
    implements $ServiceResultCopyWith<$Res> {
  _$ServiceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceResultImplCopyWith<$Res>
    implements $ServiceResultCopyWith<$Res> {
  factory _$$ServiceResultImplCopyWith(
          _$ServiceResultImpl value, $Res Function(_$ServiceResultImpl) then) =
      __$$ServiceResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Service> data});
}

/// @nodoc
class __$$ServiceResultImplCopyWithImpl<$Res>
    extends _$ServiceResultCopyWithImpl<$Res, _$ServiceResultImpl>
    implements _$$ServiceResultImplCopyWith<$Res> {
  __$$ServiceResultImplCopyWithImpl(
      _$ServiceResultImpl _value, $Res Function(_$ServiceResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$ServiceResultImpl(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceResultImpl implements _ServiceResult {
  const _$ServiceResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Service> data})
      : _data = data;

  factory _$ServiceResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Service> _data;
  @override
  List<Service> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ServiceResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResultImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPages,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResultImplCopyWith<_$ServiceResultImpl> get copyWith =>
      __$$ServiceResultImplCopyWithImpl<_$ServiceResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceResultImplToJson(
      this,
    );
  }
}

abstract class _ServiceResult implements ServiceResult {
  const factory _ServiceResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Service> data}) = _$ServiceResultImpl;

  factory _ServiceResult.fromJson(Map<String, dynamic> json) =
      _$ServiceResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Service> get data;
  @override
  @JsonKey(ignore: true)
  _$$ServiceResultImplCopyWith<_$ServiceResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {String id,
      String image,
      String name,
      int? price,
      int duration,
      String storeId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = null,
    Object? price = freezed,
    Object? duration = null,
    Object? storeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String image,
      String name,
      int? price,
      int duration,
      String storeId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = null,
    Object? price = freezed,
    Object? duration = null,
    Object? storeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ServiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
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
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.duration,
      required this.storeId,
      required this.createdAt,
      required this.updatedAt});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String id;
  @override
  final String image;
  @override
  final String name;
  @override
  final int? price;
  @override
  final int duration;
  @override
  final String storeId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Service(id: $id, image: $image, name: $name, price: $price, duration: $duration, storeId: $storeId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, name, price, duration,
      storeId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {required final String id,
      required final String image,
      required final String name,
      required final int? price,
      required final int duration,
      required final String storeId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String get id;
  @override
  String get image;
  @override
  String get name;
  @override
  int? get price;
  @override
  int get duration;
  @override
  String get storeId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
