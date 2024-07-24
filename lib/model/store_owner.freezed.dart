// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreOwnerResponse _$StoreOwnerResponseFromJson(Map<String, dynamic> json) {
  return _StoreOwnerResponse.fromJson(json);
}

/// @nodoc
mixin _$StoreOwnerResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  StoreOwnerResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreOwnerResponseCopyWith<StoreOwnerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreOwnerResponseCopyWith<$Res> {
  factory $StoreOwnerResponseCopyWith(
          StoreOwnerResponse value, $Res Function(StoreOwnerResponse) then) =
      _$StoreOwnerResponseCopyWithImpl<$Res, StoreOwnerResponse>;
  @useResult
  $Res call({bool success, String message, StoreOwnerResult result});

  $StoreOwnerResultCopyWith<$Res> get result;
}

/// @nodoc
class _$StoreOwnerResponseCopyWithImpl<$Res, $Val extends StoreOwnerResponse>
    implements $StoreOwnerResponseCopyWith<$Res> {
  _$StoreOwnerResponseCopyWithImpl(this._value, this._then);

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
              as StoreOwnerResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreOwnerResultCopyWith<$Res> get result {
    return $StoreOwnerResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreOwnerResponseImplCopyWith<$Res>
    implements $StoreOwnerResponseCopyWith<$Res> {
  factory _$$StoreOwnerResponseImplCopyWith(_$StoreOwnerResponseImpl value,
          $Res Function(_$StoreOwnerResponseImpl) then) =
      __$$StoreOwnerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, StoreOwnerResult result});

  @override
  $StoreOwnerResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$StoreOwnerResponseImplCopyWithImpl<$Res>
    extends _$StoreOwnerResponseCopyWithImpl<$Res, _$StoreOwnerResponseImpl>
    implements _$$StoreOwnerResponseImplCopyWith<$Res> {
  __$$StoreOwnerResponseImplCopyWithImpl(_$StoreOwnerResponseImpl _value,
      $Res Function(_$StoreOwnerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$StoreOwnerResponseImpl(
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
              as StoreOwnerResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreOwnerResponseImpl implements _StoreOwnerResponse {
  const _$StoreOwnerResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$StoreOwnerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreOwnerResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final StoreOwnerResult result;

  @override
  String toString() {
    return 'StoreOwnerResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreOwnerResponseImpl &&
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
  _$$StoreOwnerResponseImplCopyWith<_$StoreOwnerResponseImpl> get copyWith =>
      __$$StoreOwnerResponseImplCopyWithImpl<_$StoreOwnerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreOwnerResponseImplToJson(
      this,
    );
  }
}

abstract class _StoreOwnerResponse implements StoreOwnerResponse {
  const factory _StoreOwnerResponse(
      {required final bool success,
      required final String message,
      required final StoreOwnerResult result}) = _$StoreOwnerResponseImpl;

  factory _StoreOwnerResponse.fromJson(Map<String, dynamic> json) =
      _$StoreOwnerResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  StoreOwnerResult get result;
  @override
  @JsonKey(ignore: true)
  _$$StoreOwnerResponseImplCopyWith<_$StoreOwnerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreOwnerResult _$StoreOwnerResultFromJson(Map<String, dynamic> json) {
  return _StoreOwnerResult.fromJson(json);
}

/// @nodoc
mixin _$StoreOwnerResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<StoreOwner> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreOwnerResultCopyWith<StoreOwnerResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreOwnerResultCopyWith<$Res> {
  factory $StoreOwnerResultCopyWith(
          StoreOwnerResult value, $Res Function(StoreOwnerResult) then) =
      _$StoreOwnerResultCopyWithImpl<$Res, StoreOwnerResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<StoreOwner> data});
}

/// @nodoc
class _$StoreOwnerResultCopyWithImpl<$Res, $Val extends StoreOwnerResult>
    implements $StoreOwnerResultCopyWith<$Res> {
  _$StoreOwnerResultCopyWithImpl(this._value, this._then);

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
              as List<StoreOwner>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreOwnerResultImplCopyWith<$Res>
    implements $StoreOwnerResultCopyWith<$Res> {
  factory _$$StoreOwnerResultImplCopyWith(_$StoreOwnerResultImpl value,
          $Res Function(_$StoreOwnerResultImpl) then) =
      __$$StoreOwnerResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<StoreOwner> data});
}

/// @nodoc
class __$$StoreOwnerResultImplCopyWithImpl<$Res>
    extends _$StoreOwnerResultCopyWithImpl<$Res, _$StoreOwnerResultImpl>
    implements _$$StoreOwnerResultImplCopyWith<$Res> {
  __$$StoreOwnerResultImplCopyWithImpl(_$StoreOwnerResultImpl _value,
      $Res Function(_$StoreOwnerResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$StoreOwnerResultImpl(
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
              as List<StoreOwner>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreOwnerResultImpl implements _StoreOwnerResult {
  const _$StoreOwnerResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<StoreOwner> data})
      : _data = data;

  factory _$StoreOwnerResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreOwnerResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<StoreOwner> _data;
  @override
  List<StoreOwner> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StoreOwnerResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreOwnerResultImpl &&
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
  _$$StoreOwnerResultImplCopyWith<_$StoreOwnerResultImpl> get copyWith =>
      __$$StoreOwnerResultImplCopyWithImpl<_$StoreOwnerResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreOwnerResultImplToJson(
      this,
    );
  }
}

abstract class _StoreOwnerResult implements StoreOwnerResult {
  const factory _StoreOwnerResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<StoreOwner> data}) = _$StoreOwnerResultImpl;

  factory _StoreOwnerResult.fromJson(Map<String, dynamic> json) =
      _$StoreOwnerResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<StoreOwner> get data;
  @override
  @JsonKey(ignore: true)
  _$$StoreOwnerResultImplCopyWith<_$StoreOwnerResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreOwner _$StoreOwnerFromJson(Map<String, dynamic> json) {
  return _StoreOwner.fromJson(json);
}

/// @nodoc
mixin _$StoreOwner {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int? get totalEmployees => throw _privateConstructorUsedError;
  String get totalRevenue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreOwnerCopyWith<StoreOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreOwnerCopyWith<$Res> {
  factory $StoreOwnerCopyWith(
          StoreOwner value, $Res Function(StoreOwner) then) =
      _$StoreOwnerCopyWithImpl<$Res, StoreOwner>;
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      bool isActive,
      int? totalEmployees,
      String totalRevenue});
}

/// @nodoc
class _$StoreOwnerCopyWithImpl<$Res, $Val extends StoreOwner>
    implements $StoreOwnerCopyWith<$Res> {
  _$StoreOwnerCopyWithImpl(this._value, this._then);

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
    Object? isActive = null,
    Object? totalEmployees = freezed,
    Object? totalRevenue = null,
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
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      totalEmployees: freezed == totalEmployees
          ? _value.totalEmployees
          : totalEmployees // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreOwnerImplCopyWith<$Res>
    implements $StoreOwnerCopyWith<$Res> {
  factory _$$StoreOwnerImplCopyWith(
          _$StoreOwnerImpl value, $Res Function(_$StoreOwnerImpl) then) =
      __$$StoreOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      bool isActive,
      int? totalEmployees,
      String totalRevenue});
}

/// @nodoc
class __$$StoreOwnerImplCopyWithImpl<$Res>
    extends _$StoreOwnerCopyWithImpl<$Res, _$StoreOwnerImpl>
    implements _$$StoreOwnerImplCopyWith<$Res> {
  __$$StoreOwnerImplCopyWithImpl(
      _$StoreOwnerImpl _value, $Res Function(_$StoreOwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? isActive = null,
    Object? totalEmployees = freezed,
    Object? totalRevenue = null,
  }) {
    return _then(_$StoreOwnerImpl(
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
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      totalEmployees: freezed == totalEmployees
          ? _value.totalEmployees
          : totalEmployees // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreOwnerImpl implements _StoreOwner {
  const _$StoreOwnerImpl(
      {required this.id,
      required this.name,
      required this.location,
      required this.isActive,
      required this.totalEmployees,
      required this.totalRevenue});

  factory _$StoreOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreOwnerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  @override
  final bool isActive;
  @override
  final int? totalEmployees;
  @override
  final String totalRevenue;

  @override
  String toString() {
    return 'StoreOwner(id: $id, name: $name, location: $location, isActive: $isActive, totalEmployees: $totalEmployees, totalRevenue: $totalRevenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreOwnerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.totalEmployees, totalEmployees) ||
                other.totalEmployees == totalEmployees) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, location, isActive, totalEmployees, totalRevenue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreOwnerImplCopyWith<_$StoreOwnerImpl> get copyWith =>
      __$$StoreOwnerImplCopyWithImpl<_$StoreOwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreOwnerImplToJson(
      this,
    );
  }
}

abstract class _StoreOwner implements StoreOwner {
  const factory _StoreOwner(
      {required final String id,
      required final String name,
      required final String location,
      required final bool isActive,
      required final int? totalEmployees,
      required final String totalRevenue}) = _$StoreOwnerImpl;

  factory _StoreOwner.fromJson(Map<String, dynamic> json) =
      _$StoreOwnerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  bool get isActive;
  @override
  int? get totalEmployees;
  @override
  String get totalRevenue;
  @override
  @JsonKey(ignore: true)
  _$$StoreOwnerImplCopyWith<_$StoreOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
