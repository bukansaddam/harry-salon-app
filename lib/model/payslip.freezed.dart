// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payslip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayslipResponse _$PayslipResponseFromJson(Map<String, dynamic> json) {
  return _PayslipResponse.fromJson(json);
}

/// @nodoc
mixin _$PayslipResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PayslipResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayslipResponseCopyWith<PayslipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayslipResponseCopyWith<$Res> {
  factory $PayslipResponseCopyWith(
          PayslipResponse value, $Res Function(PayslipResponse) then) =
      _$PayslipResponseCopyWithImpl<$Res, PayslipResponse>;
  @useResult
  $Res call({bool success, String message, PayslipResult result});

  $PayslipResultCopyWith<$Res> get result;
}

/// @nodoc
class _$PayslipResponseCopyWithImpl<$Res, $Val extends PayslipResponse>
    implements $PayslipResponseCopyWith<$Res> {
  _$PayslipResponseCopyWithImpl(this._value, this._then);

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
              as PayslipResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PayslipResultCopyWith<$Res> get result {
    return $PayslipResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PayslipResponseImplCopyWith<$Res>
    implements $PayslipResponseCopyWith<$Res> {
  factory _$$PayslipResponseImplCopyWith(_$PayslipResponseImpl value,
          $Res Function(_$PayslipResponseImpl) then) =
      __$$PayslipResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, PayslipResult result});

  @override
  $PayslipResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$PayslipResponseImplCopyWithImpl<$Res>
    extends _$PayslipResponseCopyWithImpl<$Res, _$PayslipResponseImpl>
    implements _$$PayslipResponseImplCopyWith<$Res> {
  __$$PayslipResponseImplCopyWithImpl(
      _$PayslipResponseImpl _value, $Res Function(_$PayslipResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$PayslipResponseImpl(
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
              as PayslipResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayslipResponseImpl implements _PayslipResponse {
  const _$PayslipResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$PayslipResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayslipResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final PayslipResult result;

  @override
  String toString() {
    return 'PayslipResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayslipResponseImpl &&
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
  _$$PayslipResponseImplCopyWith<_$PayslipResponseImpl> get copyWith =>
      __$$PayslipResponseImplCopyWithImpl<_$PayslipResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayslipResponseImplToJson(
      this,
    );
  }
}

abstract class _PayslipResponse implements PayslipResponse {
  const factory _PayslipResponse(
      {required final bool success,
      required final String message,
      required final PayslipResult result}) = _$PayslipResponseImpl;

  factory _PayslipResponse.fromJson(Map<String, dynamic> json) =
      _$PayslipResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PayslipResult get result;
  @override
  @JsonKey(ignore: true)
  _$$PayslipResponseImplCopyWith<_$PayslipResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PayslipResult _$PayslipResultFromJson(Map<String, dynamic> json) {
  return _PayslipResult.fromJson(json);
}

/// @nodoc
mixin _$PayslipResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Payslip> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayslipResultCopyWith<PayslipResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayslipResultCopyWith<$Res> {
  factory $PayslipResultCopyWith(
          PayslipResult value, $Res Function(PayslipResult) then) =
      _$PayslipResultCopyWithImpl<$Res, PayslipResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Payslip> data});
}

/// @nodoc
class _$PayslipResultCopyWithImpl<$Res, $Val extends PayslipResult>
    implements $PayslipResultCopyWith<$Res> {
  _$PayslipResultCopyWithImpl(this._value, this._then);

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
              as List<Payslip>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayslipResultImplCopyWith<$Res>
    implements $PayslipResultCopyWith<$Res> {
  factory _$$PayslipResultImplCopyWith(
          _$PayslipResultImpl value, $Res Function(_$PayslipResultImpl) then) =
      __$$PayslipResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Payslip> data});
}

/// @nodoc
class __$$PayslipResultImplCopyWithImpl<$Res>
    extends _$PayslipResultCopyWithImpl<$Res, _$PayslipResultImpl>
    implements _$$PayslipResultImplCopyWith<$Res> {
  __$$PayslipResultImplCopyWithImpl(
      _$PayslipResultImpl _value, $Res Function(_$PayslipResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$PayslipResultImpl(
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
              as List<Payslip>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayslipResultImpl implements _PayslipResult {
  const _$PayslipResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Payslip> data})
      : _data = data;

  factory _$PayslipResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayslipResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Payslip> _data;
  @override
  List<Payslip> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PayslipResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayslipResultImpl &&
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
  _$$PayslipResultImplCopyWith<_$PayslipResultImpl> get copyWith =>
      __$$PayslipResultImplCopyWithImpl<_$PayslipResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayslipResultImplToJson(
      this,
    );
  }
}

abstract class _PayslipResult implements PayslipResult {
  const factory _PayslipResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Payslip> data}) = _$PayslipResultImpl;

  factory _PayslipResult.fromJson(Map<String, dynamic> json) =
      _$PayslipResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Payslip> get data;
  @override
  @JsonKey(ignore: true)
  _$$PayslipResultImplCopyWith<_$PayslipResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payslip _$PayslipFromJson(Map<String, dynamic> json) {
  return _Payslip.fromJson(json);
}

/// @nodoc
mixin _$Payslip {
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayslipCopyWith<Payslip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayslipCopyWith<$Res> {
  factory $PayslipCopyWith(Payslip value, $Res Function(Payslip) then) =
      _$PayslipCopyWithImpl<$Res, Payslip>;
  @useResult
  $Res call(
      {String id,
      String avatar,
      String employeeName,
      String name,
      int? total,
      DateTime createdAt});
}

/// @nodoc
class _$PayslipCopyWithImpl<$Res, $Val extends Payslip>
    implements $PayslipCopyWith<$Res> {
  _$PayslipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? employeeName = null,
    Object? name = null,
    Object? total = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayslipImplCopyWith<$Res> implements $PayslipCopyWith<$Res> {
  factory _$$PayslipImplCopyWith(
          _$PayslipImpl value, $Res Function(_$PayslipImpl) then) =
      __$$PayslipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String avatar,
      String employeeName,
      String name,
      int? total,
      DateTime createdAt});
}

/// @nodoc
class __$$PayslipImplCopyWithImpl<$Res>
    extends _$PayslipCopyWithImpl<$Res, _$PayslipImpl>
    implements _$$PayslipImplCopyWith<$Res> {
  __$$PayslipImplCopyWithImpl(
      _$PayslipImpl _value, $Res Function(_$PayslipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? employeeName = null,
    Object? name = null,
    Object? total = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$PayslipImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayslipImpl implements _Payslip {
  const _$PayslipImpl(
      {required this.id,
      required this.avatar,
      required this.employeeName,
      required this.name,
      required this.total,
      required this.createdAt});

  factory _$PayslipImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayslipImplFromJson(json);

  @override
  final String id;
  @override
  final String avatar;
  @override
  final String employeeName;
  @override
  final String name;
  @override
  final int? total;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Payslip(id: $id, avatar: $avatar, employeeName: $employeeName, name: $name, total: $total, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayslipImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, avatar, employeeName, name, total, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayslipImplCopyWith<_$PayslipImpl> get copyWith =>
      __$$PayslipImplCopyWithImpl<_$PayslipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayslipImplToJson(
      this,
    );
  }
}

abstract class _Payslip implements Payslip {
  const factory _Payslip(
      {required final String id,
      required final String avatar,
      required final String employeeName,
      required final String name,
      required final int? total,
      required final DateTime createdAt}) = _$PayslipImpl;

  factory _Payslip.fromJson(Map<String, dynamic> json) = _$PayslipImpl.fromJson;

  @override
  String get id;
  @override
  String get avatar;
  @override
  String get employeeName;
  @override
  String get name;
  @override
  int? get total;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PayslipImplCopyWith<_$PayslipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
