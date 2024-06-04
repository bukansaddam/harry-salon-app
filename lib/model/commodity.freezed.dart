// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commodity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommodityResponse _$CommodityResponseFromJson(Map<String, dynamic> json) {
  return _CommodityResponse.fromJson(json);
}

/// @nodoc
mixin _$CommodityResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CommodityResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommodityResponseCopyWith<CommodityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommodityResponseCopyWith<$Res> {
  factory $CommodityResponseCopyWith(
          CommodityResponse value, $Res Function(CommodityResponse) then) =
      _$CommodityResponseCopyWithImpl<$Res, CommodityResponse>;
  @useResult
  $Res call({bool success, String message, CommodityResult result});

  $CommodityResultCopyWith<$Res> get result;
}

/// @nodoc
class _$CommodityResponseCopyWithImpl<$Res, $Val extends CommodityResponse>
    implements $CommodityResponseCopyWith<$Res> {
  _$CommodityResponseCopyWithImpl(this._value, this._then);

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
              as CommodityResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommodityResultCopyWith<$Res> get result {
    return $CommodityResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommodityResponseImplCopyWith<$Res>
    implements $CommodityResponseCopyWith<$Res> {
  factory _$$CommodityResponseImplCopyWith(_$CommodityResponseImpl value,
          $Res Function(_$CommodityResponseImpl) then) =
      __$$CommodityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, CommodityResult result});

  @override
  $CommodityResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$CommodityResponseImplCopyWithImpl<$Res>
    extends _$CommodityResponseCopyWithImpl<$Res, _$CommodityResponseImpl>
    implements _$$CommodityResponseImplCopyWith<$Res> {
  __$$CommodityResponseImplCopyWithImpl(_$CommodityResponseImpl _value,
      $Res Function(_$CommodityResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$CommodityResponseImpl(
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
              as CommodityResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommodityResponseImpl implements _CommodityResponse {
  const _$CommodityResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$CommodityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommodityResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final CommodityResult result;

  @override
  String toString() {
    return 'CommodityResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommodityResponseImpl &&
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
  _$$CommodityResponseImplCopyWith<_$CommodityResponseImpl> get copyWith =>
      __$$CommodityResponseImplCopyWithImpl<_$CommodityResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommodityResponseImplToJson(
      this,
    );
  }
}

abstract class _CommodityResponse implements CommodityResponse {
  const factory _CommodityResponse(
      {required final bool success,
      required final String message,
      required final CommodityResult result}) = _$CommodityResponseImpl;

  factory _CommodityResponse.fromJson(Map<String, dynamic> json) =
      _$CommodityResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  CommodityResult get result;
  @override
  @JsonKey(ignore: true)
  _$$CommodityResponseImplCopyWith<_$CommodityResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommodityResult _$CommodityResultFromJson(Map<String, dynamic> json) {
  return _CommodityResult.fromJson(json);
}

/// @nodoc
mixin _$CommodityResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Commodity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommodityResultCopyWith<CommodityResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommodityResultCopyWith<$Res> {
  factory $CommodityResultCopyWith(
          CommodityResult value, $Res Function(CommodityResult) then) =
      _$CommodityResultCopyWithImpl<$Res, CommodityResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Commodity> data});
}

/// @nodoc
class _$CommodityResultCopyWithImpl<$Res, $Val extends CommodityResult>
    implements $CommodityResultCopyWith<$Res> {
  _$CommodityResultCopyWithImpl(this._value, this._then);

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
              as List<Commodity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommodityResultImplCopyWith<$Res>
    implements $CommodityResultCopyWith<$Res> {
  factory _$$CommodityResultImplCopyWith(_$CommodityResultImpl value,
          $Res Function(_$CommodityResultImpl) then) =
      __$$CommodityResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Commodity> data});
}

/// @nodoc
class __$$CommodityResultImplCopyWithImpl<$Res>
    extends _$CommodityResultCopyWithImpl<$Res, _$CommodityResultImpl>
    implements _$$CommodityResultImplCopyWith<$Res> {
  __$$CommodityResultImplCopyWithImpl(
      _$CommodityResultImpl _value, $Res Function(_$CommodityResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$CommodityResultImpl(
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
              as List<Commodity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommodityResultImpl implements _CommodityResult {
  const _$CommodityResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Commodity> data})
      : _data = data;

  factory _$CommodityResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommodityResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Commodity> _data;
  @override
  List<Commodity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CommodityResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommodityResultImpl &&
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
  _$$CommodityResultImplCopyWith<_$CommodityResultImpl> get copyWith =>
      __$$CommodityResultImplCopyWithImpl<_$CommodityResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommodityResultImplToJson(
      this,
    );
  }
}

abstract class _CommodityResult implements CommodityResult {
  const factory _CommodityResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Commodity> data}) = _$CommodityResultImpl;

  factory _CommodityResult.fromJson(Map<String, dynamic> json) =
      _$CommodityResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Commodity> get data;
  @override
  @JsonKey(ignore: true)
  _$$CommodityResultImplCopyWith<_$CommodityResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Commodity _$CommodityFromJson(Map<String, dynamic> json) {
  return _Commodity.fromJson(json);
}

/// @nodoc
mixin _$Commodity {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommodityCopyWith<Commodity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommodityCopyWith<$Res> {
  factory $CommodityCopyWith(Commodity value, $Res Function(Commodity) then) =
      _$CommodityCopyWithImpl<$Res, Commodity>;
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
class _$CommodityCopyWithImpl<$Res, $Val extends Commodity>
    implements $CommodityCopyWith<$Res> {
  _$CommodityCopyWithImpl(this._value, this._then);

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
abstract class _$$CommodityImplCopyWith<$Res>
    implements $CommodityCopyWith<$Res> {
  factory _$$CommodityImplCopyWith(
          _$CommodityImpl value, $Res Function(_$CommodityImpl) then) =
      __$$CommodityImplCopyWithImpl<$Res>;
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
class __$$CommodityImplCopyWithImpl<$Res>
    extends _$CommodityCopyWithImpl<$Res, _$CommodityImpl>
    implements _$$CommodityImplCopyWith<$Res> {
  __$$CommodityImplCopyWithImpl(
      _$CommodityImpl _value, $Res Function(_$CommodityImpl) _then)
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
    return _then(_$CommodityImpl(
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
class _$CommodityImpl implements _Commodity {
  const _$CommodityImpl(
      {required this.id,
      required this.image,
      required this.name,
      required this.stock,
      required this.storeId,
      required this.createdAt,
      required this.updatedAt});

  factory _$CommodityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommodityImplFromJson(json);

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
    return 'Commodity(id: $id, image: $image, name: $name, stock: $stock, storeId: $storeId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommodityImpl &&
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
  _$$CommodityImplCopyWith<_$CommodityImpl> get copyWith =>
      __$$CommodityImplCopyWithImpl<_$CommodityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommodityImplToJson(
      this,
    );
  }
}

abstract class _Commodity implements Commodity {
  const factory _Commodity(
      {required final String id,
      required final String image,
      required final String name,
      required final int? stock,
      required final String storeId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CommodityImpl;

  factory _Commodity.fromJson(Map<String, dynamic> json) =
      _$CommodityImpl.fromJson;

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
  _$$CommodityImplCopyWith<_$CommodityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
