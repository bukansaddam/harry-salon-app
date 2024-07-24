// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) {
  return _StoreResponse.fromJson(json);
}

/// @nodoc
mixin _$StoreResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  StoreResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreResponseCopyWith<StoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreResponseCopyWith<$Res> {
  factory $StoreResponseCopyWith(
          StoreResponse value, $Res Function(StoreResponse) then) =
      _$StoreResponseCopyWithImpl<$Res, StoreResponse>;
  @useResult
  $Res call({bool success, String message, StoreResult result});

  $StoreResultCopyWith<$Res> get result;
}

/// @nodoc
class _$StoreResponseCopyWithImpl<$Res, $Val extends StoreResponse>
    implements $StoreResponseCopyWith<$Res> {
  _$StoreResponseCopyWithImpl(this._value, this._then);

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
              as StoreResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreResultCopyWith<$Res> get result {
    return $StoreResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreResponseImplCopyWith<$Res>
    implements $StoreResponseCopyWith<$Res> {
  factory _$$StoreResponseImplCopyWith(
          _$StoreResponseImpl value, $Res Function(_$StoreResponseImpl) then) =
      __$$StoreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, StoreResult result});

  @override
  $StoreResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$StoreResponseImplCopyWithImpl<$Res>
    extends _$StoreResponseCopyWithImpl<$Res, _$StoreResponseImpl>
    implements _$$StoreResponseImplCopyWith<$Res> {
  __$$StoreResponseImplCopyWithImpl(
      _$StoreResponseImpl _value, $Res Function(_$StoreResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$StoreResponseImpl(
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
              as StoreResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreResponseImpl implements _StoreResponse {
  const _$StoreResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$StoreResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final StoreResult result;

  @override
  String toString() {
    return 'StoreResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreResponseImpl &&
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
  _$$StoreResponseImplCopyWith<_$StoreResponseImpl> get copyWith =>
      __$$StoreResponseImplCopyWithImpl<_$StoreResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreResponseImplToJson(
      this,
    );
  }
}

abstract class _StoreResponse implements StoreResponse {
  const factory _StoreResponse(
      {required final bool success,
      required final String message,
      required final StoreResult result}) = _$StoreResponseImpl;

  factory _StoreResponse.fromJson(Map<String, dynamic> json) =
      _$StoreResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  StoreResult get result;
  @override
  @JsonKey(ignore: true)
  _$$StoreResponseImplCopyWith<_$StoreResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreResult _$StoreResultFromJson(Map<String, dynamic> json) {
  return _StoreResult.fromJson(json);
}

/// @nodoc
mixin _$StoreResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Store> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreResultCopyWith<StoreResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreResultCopyWith<$Res> {
  factory $StoreResultCopyWith(
          StoreResult value, $Res Function(StoreResult) then) =
      _$StoreResultCopyWithImpl<$Res, StoreResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Store> data});
}

/// @nodoc
class _$StoreResultCopyWithImpl<$Res, $Val extends StoreResult>
    implements $StoreResultCopyWith<$Res> {
  _$StoreResultCopyWithImpl(this._value, this._then);

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
              as List<Store>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreResultImplCopyWith<$Res>
    implements $StoreResultCopyWith<$Res> {
  factory _$$StoreResultImplCopyWith(
          _$StoreResultImpl value, $Res Function(_$StoreResultImpl) then) =
      __$$StoreResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Store> data});
}

/// @nodoc
class __$$StoreResultImplCopyWithImpl<$Res>
    extends _$StoreResultCopyWithImpl<$Res, _$StoreResultImpl>
    implements _$$StoreResultImplCopyWith<$Res> {
  __$$StoreResultImplCopyWithImpl(
      _$StoreResultImpl _value, $Res Function(_$StoreResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$StoreResultImpl(
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
              as List<Store>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreResultImpl implements _StoreResult {
  const _$StoreResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Store> data})
      : _data = data;

  factory _$StoreResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Store> _data;
  @override
  List<Store> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StoreResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreResultImpl &&
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
  _$$StoreResultImplCopyWith<_$StoreResultImpl> get copyWith =>
      __$$StoreResultImplCopyWithImpl<_$StoreResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreResultImplToJson(
      this,
    );
  }
}

abstract class _StoreResult implements StoreResult {
  const factory _StoreResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Store> data}) = _$StoreResultImpl;

  factory _StoreResult.fromJson(Map<String, dynamic> json) =
      _$StoreResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Store> get data;
  @override
  @JsonKey(ignore: true)
  _$$StoreResultImplCopyWith<_$StoreResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int? get totalEmployees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      double latitude,
      double longitude,
      bool isActive,
      int? totalEmployees});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isActive = null,
    Object? totalEmployees = freezed,
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      totalEmployees: freezed == totalEmployees
          ? _value.totalEmployees
          : totalEmployees // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      double latitude,
      double longitude,
      bool isActive,
      int? totalEmployees});
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isActive = null,
    Object? totalEmployees = freezed,
  }) {
    return _then(_$StoreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      totalEmployees: freezed == totalEmployees
          ? _value.totalEmployees
          : totalEmployees // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl implements _Store {
  const _$StoreImpl(
      {required this.id,
      required this.name,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.isActive,
      required this.totalEmployees});

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final bool isActive;
  @override
  final int? totalEmployees;

  @override
  String toString() {
    return 'Store(id: $id, name: $name, location: $location, latitude: $latitude, longitude: $longitude, isActive: $isActive, totalEmployees: $totalEmployees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.totalEmployees, totalEmployees) ||
                other.totalEmployees == totalEmployees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location, latitude,
      longitude, isActive, totalEmployees);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store implements Store {
  const factory _Store(
      {required final String id,
      required final String name,
      required final String location,
      required final double latitude,
      required final double longitude,
      required final bool isActive,
      required final int? totalEmployees}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  bool get isActive;
  @override
  int? get totalEmployees;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
