// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_commodity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCommodityResponse _$DetailCommodityResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailCommodityResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailCommodityResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailCommodity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCommodityResponseCopyWith<DetailCommodityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCommodityResponseCopyWith<$Res> {
  factory $DetailCommodityResponseCopyWith(DetailCommodityResponse value,
          $Res Function(DetailCommodityResponse) then) =
      _$DetailCommodityResponseCopyWithImpl<$Res, DetailCommodityResponse>;
  @useResult
  $Res call({bool success, String message, DetailCommodity data});

  $DetailCommodityCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailCommodityResponseCopyWithImpl<$Res,
        $Val extends DetailCommodityResponse>
    implements $DetailCommodityResponseCopyWith<$Res> {
  _$DetailCommodityResponseCopyWithImpl(this._value, this._then);

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
              as DetailCommodity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCommodityCopyWith<$Res> get data {
    return $DetailCommodityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCommodityResponseImplCopyWith<$Res>
    implements $DetailCommodityResponseCopyWith<$Res> {
  factory _$$DetailCommodityResponseImplCopyWith(
          _$DetailCommodityResponseImpl value,
          $Res Function(_$DetailCommodityResponseImpl) then) =
      __$$DetailCommodityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailCommodity data});

  @override
  $DetailCommodityCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailCommodityResponseImplCopyWithImpl<$Res>
    extends _$DetailCommodityResponseCopyWithImpl<$Res,
        _$DetailCommodityResponseImpl>
    implements _$$DetailCommodityResponseImplCopyWith<$Res> {
  __$$DetailCommodityResponseImplCopyWithImpl(
      _$DetailCommodityResponseImpl _value,
      $Res Function(_$DetailCommodityResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DetailCommodityResponseImpl(
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
              as DetailCommodity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCommodityResponseImpl implements _DetailCommodityResponse {
  const _$DetailCommodityResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailCommodityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCommodityResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailCommodity data;

  @override
  String toString() {
    return 'DetailCommodityResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCommodityResponseImpl &&
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
  _$$DetailCommodityResponseImplCopyWith<_$DetailCommodityResponseImpl>
      get copyWith => __$$DetailCommodityResponseImplCopyWithImpl<
          _$DetailCommodityResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCommodityResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailCommodityResponse implements DetailCommodityResponse {
  const factory _DetailCommodityResponse(
      {required final bool success,
      required final String message,
      required final DetailCommodity data}) = _$DetailCommodityResponseImpl;

  factory _DetailCommodityResponse.fromJson(Map<String, dynamic> json) =
      _$DetailCommodityResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailCommodity get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailCommodityResponseImplCopyWith<_$DetailCommodityResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailCommodity _$DetailCommodityFromJson(Map<String, dynamic> json) {
  return _DetailCommodity.fromJson(json);
}

/// @nodoc
mixin _$DetailCommodity {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCommodityCopyWith<DetailCommodity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCommodityCopyWith<$Res> {
  factory $DetailCommodityCopyWith(
          DetailCommodity value, $Res Function(DetailCommodity) then) =
      _$DetailCommodityCopyWithImpl<$Res, DetailCommodity>;
  @useResult
  $Res call(
      {String id,
      String image,
      String name,
      int? stock,
      String storeId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DetailCommodityCopyWithImpl<$Res, $Val extends DetailCommodity>
    implements $DetailCommodityCopyWith<$Res> {
  _$DetailCommodityCopyWithImpl(this._value, this._then);

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
    Object? stock = freezed,
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
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$DetailCommodityImplCopyWith<$Res>
    implements $DetailCommodityCopyWith<$Res> {
  factory _$$DetailCommodityImplCopyWith(_$DetailCommodityImpl value,
          $Res Function(_$DetailCommodityImpl) then) =
      __$$DetailCommodityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String image,
      String name,
      int? stock,
      String storeId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DetailCommodityImplCopyWithImpl<$Res>
    extends _$DetailCommodityCopyWithImpl<$Res, _$DetailCommodityImpl>
    implements _$$DetailCommodityImplCopyWith<$Res> {
  __$$DetailCommodityImplCopyWithImpl(
      _$DetailCommodityImpl _value, $Res Function(_$DetailCommodityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = null,
    Object? stock = freezed,
    Object? storeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DetailCommodityImpl(
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
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$DetailCommodityImpl implements _DetailCommodity {
  const _$DetailCommodityImpl(
      {required this.id,
      required this.image,
      required this.name,
      required this.stock,
      required this.storeId,
      required this.createdAt,
      required this.updatedAt});

  factory _$DetailCommodityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCommodityImplFromJson(json);

  @override
  final String id;
  @override
  final String image;
  @override
  final String name;
  @override
  final int? stock;
  @override
  final String storeId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DetailCommodity(id: $id, image: $image, name: $name, stock: $stock, storeId: $storeId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCommodityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, image, name, stock, storeId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCommodityImplCopyWith<_$DetailCommodityImpl> get copyWith =>
      __$$DetailCommodityImplCopyWithImpl<_$DetailCommodityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCommodityImplToJson(
      this,
    );
  }
}

abstract class _DetailCommodity implements DetailCommodity {
  const factory _DetailCommodity(
      {required final String id,
      required final String image,
      required final String name,
      required final int? stock,
      required final String storeId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DetailCommodityImpl;

  factory _DetailCommodity.fromJson(Map<String, dynamic> json) =
      _$DetailCommodityImpl.fromJson;

  @override
  String get id;
  @override
  String get image;
  @override
  String get name;
  @override
  int? get stock;
  @override
  String get storeId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DetailCommodityImplCopyWith<_$DetailCommodityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
