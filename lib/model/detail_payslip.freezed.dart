// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_payslip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailPayslipResponse _$DetailPayslipResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailPayslipResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailPayslipResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailPayslip get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailPayslipResponseCopyWith<DetailPayslipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPayslipResponseCopyWith<$Res> {
  factory $DetailPayslipResponseCopyWith(DetailPayslipResponse value,
          $Res Function(DetailPayslipResponse) then) =
      _$DetailPayslipResponseCopyWithImpl<$Res, DetailPayslipResponse>;
  @useResult
  $Res call({bool success, String message, DetailPayslip data});

  $DetailPayslipCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailPayslipResponseCopyWithImpl<$Res,
        $Val extends DetailPayslipResponse>
    implements $DetailPayslipResponseCopyWith<$Res> {
  _$DetailPayslipResponseCopyWithImpl(this._value, this._then);

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
              as DetailPayslip,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailPayslipCopyWith<$Res> get data {
    return $DetailPayslipCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailPayslipResponseImplCopyWith<$Res>
    implements $DetailPayslipResponseCopyWith<$Res> {
  factory _$$DetailPayslipResponseImplCopyWith(
          _$DetailPayslipResponseImpl value,
          $Res Function(_$DetailPayslipResponseImpl) then) =
      __$$DetailPayslipResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailPayslip data});

  @override
  $DetailPayslipCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailPayslipResponseImplCopyWithImpl<$Res>
    extends _$DetailPayslipResponseCopyWithImpl<$Res,
        _$DetailPayslipResponseImpl>
    implements _$$DetailPayslipResponseImplCopyWith<$Res> {
  __$$DetailPayslipResponseImplCopyWithImpl(_$DetailPayslipResponseImpl _value,
      $Res Function(_$DetailPayslipResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DetailPayslipResponseImpl(
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
              as DetailPayslip,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailPayslipResponseImpl implements _DetailPayslipResponse {
  const _$DetailPayslipResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailPayslipResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailPayslipResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailPayslip data;

  @override
  String toString() {
    return 'DetailPayslipResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPayslipResponseImpl &&
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
  _$$DetailPayslipResponseImplCopyWith<_$DetailPayslipResponseImpl>
      get copyWith => __$$DetailPayslipResponseImplCopyWithImpl<
          _$DetailPayslipResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailPayslipResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailPayslipResponse implements DetailPayslipResponse {
  const factory _DetailPayslipResponse(
      {required final bool success,
      required final String message,
      required final DetailPayslip data}) = _$DetailPayslipResponseImpl;

  factory _DetailPayslipResponse.fromJson(Map<String, dynamic> json) =
      _$DetailPayslipResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailPayslip get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailPayslipResponseImplCopyWith<_$DetailPayslipResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailPayslip _$DetailPayslipFromJson(Map<String, dynamic> json) {
  return _DetailPayslip.fromJson(json);
}

/// @nodoc
mixin _$DetailPayslip {
  String get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  String get employeeId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<SubDetailPayslip> get earnings => throw _privateConstructorUsedError;
  List<SubDetailPayslip>? get deductions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailPayslipCopyWith<DetailPayslip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPayslipCopyWith<$Res> {
  factory $DetailPayslipCopyWith(
          DetailPayslip value, $Res Function(DetailPayslip) then) =
      _$DetailPayslipCopyWithImpl<$Res, DetailPayslip>;
  @useResult
  $Res call(
      {String id,
      String avatar,
      String employeeName,
      String name,
      String? attachment,
      int total,
      String employeeId,
      DateTime date,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      List<SubDetailPayslip> earnings,
      List<SubDetailPayslip>? deductions});
}

/// @nodoc
class _$DetailPayslipCopyWithImpl<$Res, $Val extends DetailPayslip>
    implements $DetailPayslipCopyWith<$Res> {
  _$DetailPayslipCopyWithImpl(this._value, this._then);

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
    Object? attachment = freezed,
    Object? total = null,
    Object? employeeId = null,
    Object? date = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? earnings = null,
    Object? deductions = freezed,
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
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      earnings: null == earnings
          ? _value.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as List<SubDetailPayslip>,
      deductions: freezed == deductions
          ? _value.deductions
          : deductions // ignore: cast_nullable_to_non_nullable
              as List<SubDetailPayslip>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailPayslipImplCopyWith<$Res>
    implements $DetailPayslipCopyWith<$Res> {
  factory _$$DetailPayslipImplCopyWith(
          _$DetailPayslipImpl value, $Res Function(_$DetailPayslipImpl) then) =
      __$$DetailPayslipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String avatar,
      String employeeName,
      String name,
      String? attachment,
      int total,
      String employeeId,
      DateTime date,
      String createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      List<SubDetailPayslip> earnings,
      List<SubDetailPayslip>? deductions});
}

/// @nodoc
class __$$DetailPayslipImplCopyWithImpl<$Res>
    extends _$DetailPayslipCopyWithImpl<$Res, _$DetailPayslipImpl>
    implements _$$DetailPayslipImplCopyWith<$Res> {
  __$$DetailPayslipImplCopyWithImpl(
      _$DetailPayslipImpl _value, $Res Function(_$DetailPayslipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? employeeName = null,
    Object? name = null,
    Object? attachment = freezed,
    Object? total = null,
    Object? employeeId = null,
    Object? date = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? earnings = null,
    Object? deductions = freezed,
  }) {
    return _then(_$DetailPayslipImpl(
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
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      earnings: null == earnings
          ? _value._earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as List<SubDetailPayslip>,
      deductions: freezed == deductions
          ? _value._deductions
          : deductions // ignore: cast_nullable_to_non_nullable
              as List<SubDetailPayslip>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailPayslipImpl implements _DetailPayslip {
  const _$DetailPayslipImpl(
      {required this.id,
      required this.avatar,
      required this.employeeName,
      required this.name,
      required this.attachment,
      required this.total,
      required this.employeeId,
      required this.date,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required final List<SubDetailPayslip> earnings,
      required final List<SubDetailPayslip>? deductions})
      : _earnings = earnings,
        _deductions = deductions;

  factory _$DetailPayslipImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailPayslipImplFromJson(json);

  @override
  final String id;
  @override
  final String avatar;
  @override
  final String employeeName;
  @override
  final String name;
  @override
  final String? attachment;
  @override
  final int total;
  @override
  final String employeeId;
  @override
  final DateTime date;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<SubDetailPayslip> _earnings;
  @override
  List<SubDetailPayslip> get earnings {
    if (_earnings is EqualUnmodifiableListView) return _earnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_earnings);
  }

  final List<SubDetailPayslip>? _deductions;
  @override
  List<SubDetailPayslip>? get deductions {
    final value = _deductions;
    if (value == null) return null;
    if (_deductions is EqualUnmodifiableListView) return _deductions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DetailPayslip(id: $id, avatar: $avatar, employeeName: $employeeName, name: $name, attachment: $attachment, total: $total, employeeId: $employeeId, date: $date, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, earnings: $earnings, deductions: $deductions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPayslipImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._earnings, _earnings) &&
            const DeepCollectionEquality()
                .equals(other._deductions, _deductions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      avatar,
      employeeName,
      name,
      attachment,
      total,
      employeeId,
      date,
      createdBy,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_earnings),
      const DeepCollectionEquality().hash(_deductions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailPayslipImplCopyWith<_$DetailPayslipImpl> get copyWith =>
      __$$DetailPayslipImplCopyWithImpl<_$DetailPayslipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailPayslipImplToJson(
      this,
    );
  }
}

abstract class _DetailPayslip implements DetailPayslip {
  const factory _DetailPayslip(
      {required final String id,
      required final String avatar,
      required final String employeeName,
      required final String name,
      required final String? attachment,
      required final int total,
      required final String employeeId,
      required final DateTime date,
      required final String createdBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<SubDetailPayslip> earnings,
      required final List<SubDetailPayslip>? deductions}) = _$DetailPayslipImpl;

  factory _DetailPayslip.fromJson(Map<String, dynamic> json) =
      _$DetailPayslipImpl.fromJson;

  @override
  String get id;
  @override
  String get avatar;
  @override
  String get employeeName;
  @override
  String get name;
  @override
  String? get attachment;
  @override
  int get total;
  @override
  String get employeeId;
  @override
  DateTime get date;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<SubDetailPayslip> get earnings;
  @override
  List<SubDetailPayslip>? get deductions;
  @override
  @JsonKey(ignore: true)
  _$$DetailPayslipImplCopyWith<_$DetailPayslipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubDetailPayslip _$SubDetailPayslipFromJson(Map<String, dynamic> json) {
  return _SubDetailPayslip.fromJson(json);
}

/// @nodoc
mixin _$SubDetailPayslip {
  String? get name => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubDetailPayslipCopyWith<SubDetailPayslip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubDetailPayslipCopyWith<$Res> {
  factory $SubDetailPayslipCopyWith(
          SubDetailPayslip value, $Res Function(SubDetailPayslip) then) =
      _$SubDetailPayslipCopyWithImpl<$Res, SubDetailPayslip>;
  @useResult
  $Res call({String? name, int? amount});
}

/// @nodoc
class _$SubDetailPayslipCopyWithImpl<$Res, $Val extends SubDetailPayslip>
    implements $SubDetailPayslipCopyWith<$Res> {
  _$SubDetailPayslipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubDetailPayslipImplCopyWith<$Res>
    implements $SubDetailPayslipCopyWith<$Res> {
  factory _$$SubDetailPayslipImplCopyWith(_$SubDetailPayslipImpl value,
          $Res Function(_$SubDetailPayslipImpl) then) =
      __$$SubDetailPayslipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? amount});
}

/// @nodoc
class __$$SubDetailPayslipImplCopyWithImpl<$Res>
    extends _$SubDetailPayslipCopyWithImpl<$Res, _$SubDetailPayslipImpl>
    implements _$$SubDetailPayslipImplCopyWith<$Res> {
  __$$SubDetailPayslipImplCopyWithImpl(_$SubDetailPayslipImpl _value,
      $Res Function(_$SubDetailPayslipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$SubDetailPayslipImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubDetailPayslipImpl implements _SubDetailPayslip {
  const _$SubDetailPayslipImpl({required this.name, required this.amount});

  factory _$SubDetailPayslipImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubDetailPayslipImplFromJson(json);

  @override
  final String? name;
  @override
  final int? amount;

  @override
  String toString() {
    return 'SubDetailPayslip(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubDetailPayslipImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubDetailPayslipImplCopyWith<_$SubDetailPayslipImpl> get copyWith =>
      __$$SubDetailPayslipImplCopyWithImpl<_$SubDetailPayslipImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubDetailPayslipImplToJson(
      this,
    );
  }
}

abstract class _SubDetailPayslip implements SubDetailPayslip {
  const factory _SubDetailPayslip(
      {required final String? name,
      required final int? amount}) = _$SubDetailPayslipImpl;

  factory _SubDetailPayslip.fromJson(Map<String, dynamic> json) =
      _$SubDetailPayslipImpl.fromJson;

  @override
  String? get name;
  @override
  int? get amount;
  @override
  @JsonKey(ignore: true)
  _$$SubDetailPayslipImplCopyWith<_$SubDetailPayslipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
