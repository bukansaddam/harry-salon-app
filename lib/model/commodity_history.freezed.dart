// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commodity_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommodityHistoryResponse _$CommodityHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _CommodityHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$CommodityHistoryResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CommodityHistoryResult get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommodityHistoryResponseCopyWith<CommodityHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommodityHistoryResponseCopyWith<$Res> {
  factory $CommodityHistoryResponseCopyWith(CommodityHistoryResponse value,
          $Res Function(CommodityHistoryResponse) then) =
      _$CommodityHistoryResponseCopyWithImpl<$Res, CommodityHistoryResponse>;
  @useResult
  $Res call({bool success, String message, CommodityHistoryResult data});

  $CommodityHistoryResultCopyWith<$Res> get data;
}

/// @nodoc
class _$CommodityHistoryResponseCopyWithImpl<$Res,
        $Val extends CommodityHistoryResponse>
    implements $CommodityHistoryResponseCopyWith<$Res> {
  _$CommodityHistoryResponseCopyWithImpl(this._value, this._then);

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
              as CommodityHistoryResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommodityHistoryResultCopyWith<$Res> get data {
    return $CommodityHistoryResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommodityHistoryResponseImplCopyWith<$Res>
    implements $CommodityHistoryResponseCopyWith<$Res> {
  factory _$$CommodityHistoryResponseImplCopyWith(
          _$CommodityHistoryResponseImpl value,
          $Res Function(_$CommodityHistoryResponseImpl) then) =
      __$$CommodityHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, CommodityHistoryResult data});

  @override
  $CommodityHistoryResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$CommodityHistoryResponseImplCopyWithImpl<$Res>
    extends _$CommodityHistoryResponseCopyWithImpl<$Res,
        _$CommodityHistoryResponseImpl>
    implements _$$CommodityHistoryResponseImplCopyWith<$Res> {
  __$$CommodityHistoryResponseImplCopyWithImpl(
      _$CommodityHistoryResponseImpl _value,
      $Res Function(_$CommodityHistoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CommodityHistoryResponseImpl(
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
              as CommodityHistoryResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommodityHistoryResponseImpl implements _CommodityHistoryResponse {
  const _$CommodityHistoryResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$CommodityHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommodityHistoryResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final CommodityHistoryResult data;

  @override
  String toString() {
    return 'CommodityHistoryResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommodityHistoryResponseImpl &&
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
  _$$CommodityHistoryResponseImplCopyWith<_$CommodityHistoryResponseImpl>
      get copyWith => __$$CommodityHistoryResponseImplCopyWithImpl<
          _$CommodityHistoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommodityHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _CommodityHistoryResponse implements CommodityHistoryResponse {
  const factory _CommodityHistoryResponse(
          {required final bool success,
          required final String message,
          required final CommodityHistoryResult data}) =
      _$CommodityHistoryResponseImpl;

  factory _CommodityHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$CommodityHistoryResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  CommodityHistoryResult get data;
  @override
  @JsonKey(ignore: true)
  _$$CommodityHistoryResponseImplCopyWith<_$CommodityHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommodityHistoryResult _$CommodityHistoryResultFromJson(
    Map<String, dynamic> json) {
  return _CommodityHistoryResult.fromJson(json);
}

/// @nodoc
mixin _$CommodityHistoryResult {
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<CommodityHistory> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommodityHistoryResultCopyWith<CommodityHistoryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommodityHistoryResultCopyWith<$Res> {
  factory $CommodityHistoryResultCopyWith(CommodityHistoryResult value,
          $Res Function(CommodityHistoryResult) then) =
      _$CommodityHistoryResultCopyWithImpl<$Res, CommodityHistoryResult>;
  @useResult
  $Res call({int totalCount, int totalPages, List<CommodityHistory> data});
}

/// @nodoc
class _$CommodityHistoryResultCopyWithImpl<$Res,
        $Val extends CommodityHistoryResult>
    implements $CommodityHistoryResultCopyWith<$Res> {
  _$CommodityHistoryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CommodityHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommodityHistoryResultImplCopyWith<$Res>
    implements $CommodityHistoryResultCopyWith<$Res> {
  factory _$$CommodityHistoryResultImplCopyWith(
          _$CommodityHistoryResultImpl value,
          $Res Function(_$CommodityHistoryResultImpl) then) =
      __$$CommodityHistoryResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, int totalPages, List<CommodityHistory> data});
}

/// @nodoc
class __$$CommodityHistoryResultImplCopyWithImpl<$Res>
    extends _$CommodityHistoryResultCopyWithImpl<$Res,
        _$CommodityHistoryResultImpl>
    implements _$$CommodityHistoryResultImplCopyWith<$Res> {
  __$$CommodityHistoryResultImplCopyWithImpl(
      _$CommodityHistoryResultImpl _value,
      $Res Function(_$CommodityHistoryResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_$CommodityHistoryResultImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CommodityHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommodityHistoryResultImpl implements _CommodityHistoryResult {
  const _$CommodityHistoryResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<CommodityHistory> data})
      : _data = data;

  factory _$CommodityHistoryResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommodityHistoryResultImplFromJson(json);

  @override
  final int totalCount;
  @override
  final int totalPages;
  final List<CommodityHistory> _data;
  @override
  List<CommodityHistory> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CommodityHistoryResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommodityHistoryResultImpl &&
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
  _$$CommodityHistoryResultImplCopyWith<_$CommodityHistoryResultImpl>
      get copyWith => __$$CommodityHistoryResultImplCopyWithImpl<
          _$CommodityHistoryResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommodityHistoryResultImplToJson(
      this,
    );
  }
}

abstract class _CommodityHistoryResult implements CommodityHistoryResult {
  const factory _CommodityHistoryResult(
          {required final int totalCount,
          required final int totalPages,
          required final List<CommodityHistory> data}) =
      _$CommodityHistoryResultImpl;

  factory _CommodityHistoryResult.fromJson(Map<String, dynamic> json) =
      _$CommodityHistoryResultImpl.fromJson;

  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  List<CommodityHistory> get data;
  @override
  @JsonKey(ignore: true)
  _$$CommodityHistoryResultImplCopyWith<_$CommodityHistoryResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommodityHistory _$CommodityHistoryFromJson(Map<String, dynamic> json) {
  return _CommodityHistory.fromJson(json);
}

/// @nodoc
mixin _$CommodityHistory {
  String get id => throw _privateConstructorUsedError;
  String get commodityId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommodityHistoryCopyWith<CommodityHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommodityHistoryCopyWith<$Res> {
  factory $CommodityHistoryCopyWith(
          CommodityHistory value, $Res Function(CommodityHistory) then) =
      _$CommodityHistoryCopyWithImpl<$Res, CommodityHistory>;
  @useResult
  $Res call(
      {String id,
      String commodityId,
      String description,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CommodityHistoryCopyWithImpl<$Res, $Val extends CommodityHistory>
    implements $CommodityHistoryCopyWith<$Res> {
  _$CommodityHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? commodityId = null,
    Object? description = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      commodityId: null == commodityId
          ? _value.commodityId
          : commodityId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommodityHistoryImplCopyWith<$Res>
    implements $CommodityHistoryCopyWith<$Res> {
  factory _$$CommodityHistoryImplCopyWith(_$CommodityHistoryImpl value,
          $Res Function(_$CommodityHistoryImpl) then) =
      __$$CommodityHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String commodityId,
      String description,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$CommodityHistoryImplCopyWithImpl<$Res>
    extends _$CommodityHistoryCopyWithImpl<$Res, _$CommodityHistoryImpl>
    implements _$$CommodityHistoryImplCopyWith<$Res> {
  __$$CommodityHistoryImplCopyWithImpl(_$CommodityHistoryImpl _value,
      $Res Function(_$CommodityHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? commodityId = null,
    Object? description = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommodityHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      commodityId: null == commodityId
          ? _value.commodityId
          : commodityId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommodityHistoryImpl implements _CommodityHistory {
  const _$CommodityHistoryImpl(
      {required this.id,
      required this.commodityId,
      required this.description,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt});

  factory _$CommodityHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommodityHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String commodityId;
  @override
  final String description;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CommodityHistory(id: $id, commodityId: $commodityId, description: $description, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommodityHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.commodityId, commodityId) ||
                other.commodityId == commodityId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, commodityId, description,
      createdBy, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommodityHistoryImplCopyWith<_$CommodityHistoryImpl> get copyWith =>
      __$$CommodityHistoryImplCopyWithImpl<_$CommodityHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommodityHistoryImplToJson(
      this,
    );
  }
}

abstract class _CommodityHistory implements CommodityHistory {
  const factory _CommodityHistory(
      {required final String id,
      required final String commodityId,
      required final String description,
      required final String createdBy,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CommodityHistoryImpl;

  factory _CommodityHistory.fromJson(Map<String, dynamic> json) =
      _$CommodityHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get commodityId;
  @override
  String get description;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommodityHistoryImplCopyWith<_$CommodityHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
