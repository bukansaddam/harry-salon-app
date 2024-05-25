// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeResponse _$EmployeeResponseFromJson(Map<String, dynamic> json) {
  return _EmployeeResponse.fromJson(json);
}

/// @nodoc
mixin _$EmployeeResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  EmployeeResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeResponseCopyWith<EmployeeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeResponseCopyWith<$Res> {
  factory $EmployeeResponseCopyWith(
          EmployeeResponse value, $Res Function(EmployeeResponse) then) =
      _$EmployeeResponseCopyWithImpl<$Res, EmployeeResponse>;
  @useResult
  $Res call({bool success, String message, EmployeeResult result});

  $EmployeeResultCopyWith<$Res> get result;
}

/// @nodoc
class _$EmployeeResponseCopyWithImpl<$Res, $Val extends EmployeeResponse>
    implements $EmployeeResponseCopyWith<$Res> {
  _$EmployeeResponseCopyWithImpl(this._value, this._then);

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
              as EmployeeResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeeResultCopyWith<$Res> get result {
    return $EmployeeResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmployeeResponseImplCopyWith<$Res>
    implements $EmployeeResponseCopyWith<$Res> {
  factory _$$EmployeeResponseImplCopyWith(_$EmployeeResponseImpl value,
          $Res Function(_$EmployeeResponseImpl) then) =
      __$$EmployeeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, EmployeeResult result});

  @override
  $EmployeeResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$EmployeeResponseImplCopyWithImpl<$Res>
    extends _$EmployeeResponseCopyWithImpl<$Res, _$EmployeeResponseImpl>
    implements _$$EmployeeResponseImplCopyWith<$Res> {
  __$$EmployeeResponseImplCopyWithImpl(_$EmployeeResponseImpl _value,
      $Res Function(_$EmployeeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$EmployeeResponseImpl(
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
              as EmployeeResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeResponseImpl implements _EmployeeResponse {
  const _$EmployeeResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$EmployeeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final EmployeeResult result;

  @override
  String toString() {
    return 'EmployeeResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeResponseImpl &&
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
  _$$EmployeeResponseImplCopyWith<_$EmployeeResponseImpl> get copyWith =>
      __$$EmployeeResponseImplCopyWithImpl<_$EmployeeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeResponseImplToJson(
      this,
    );
  }
}

abstract class _EmployeeResponse implements EmployeeResponse {
  const factory _EmployeeResponse(
      {required final bool success,
      required final String message,
      required final EmployeeResult result}) = _$EmployeeResponseImpl;

  factory _EmployeeResponse.fromJson(Map<String, dynamic> json) =
      _$EmployeeResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  EmployeeResult get result;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeResponseImplCopyWith<_$EmployeeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmployeeResult _$EmployeeResultFromJson(Map<String, dynamic> json) {
  return _EmployeeResult.fromJson(json);
}

/// @nodoc
mixin _$EmployeeResult {
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  List<Employee> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeResultCopyWith<EmployeeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeResultCopyWith<$Res> {
  factory $EmployeeResultCopyWith(
          EmployeeResult value, $Res Function(EmployeeResult) then) =
      _$EmployeeResultCopyWithImpl<$Res, EmployeeResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'total_pages') int? totalPages,
      List<Employee> data});
}

/// @nodoc
class _$EmployeeResultCopyWithImpl<$Res, $Val extends EmployeeResult>
    implements $EmployeeResultCopyWith<$Res> {
  _$EmployeeResultCopyWithImpl(this._value, this._then);

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
              as List<Employee>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeResultImplCopyWith<$Res>
    implements $EmployeeResultCopyWith<$Res> {
  factory _$$EmployeeResultImplCopyWith(_$EmployeeResultImpl value,
          $Res Function(_$EmployeeResultImpl) then) =
      __$$EmployeeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'total_pages') int? totalPages,
      List<Employee> data});
}

/// @nodoc
class __$$EmployeeResultImplCopyWithImpl<$Res>
    extends _$EmployeeResultCopyWithImpl<$Res, _$EmployeeResultImpl>
    implements _$$EmployeeResultImplCopyWith<$Res> {
  __$$EmployeeResultImplCopyWithImpl(
      _$EmployeeResultImpl _value, $Res Function(_$EmployeeResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$EmployeeResultImpl(
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
              as List<Employee>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeResultImpl implements _EmployeeResult {
  const _$EmployeeResultImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'total_pages') required this.totalPages,
      required final List<Employee> data})
      : _data = data;

  factory _$EmployeeResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeResultImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<Employee> _data;
  @override
  List<Employee> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'EmployeeResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeResultImpl &&
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
  _$$EmployeeResultImplCopyWith<_$EmployeeResultImpl> get copyWith =>
      __$$EmployeeResultImplCopyWithImpl<_$EmployeeResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeResultImplToJson(
      this,
    );
  }
}

abstract class _EmployeeResult implements EmployeeResult {
  const factory _EmployeeResult(
      {@JsonKey(name: 'total_count') required final int? totalCount,
      @JsonKey(name: 'total_pages') required final int? totalPages,
      required final List<Employee> data}) = _$EmployeeResultImpl;

  factory _EmployeeResult.fromJson(Map<String, dynamic> json) =
      _$EmployeeResultImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  List<Employee> get data;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeResultImplCopyWith<_$EmployeeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call({String id, String name, String avatar});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
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
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeImplCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$$EmployeeImplCopyWith(
          _$EmployeeImpl value, $Res Function(_$EmployeeImpl) then) =
      __$$EmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String avatar});
}

/// @nodoc
class __$$EmployeeImplCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$EmployeeImpl>
    implements _$$EmployeeImplCopyWith<$Res> {
  __$$EmployeeImplCopyWithImpl(
      _$EmployeeImpl _value, $Res Function(_$EmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_$EmployeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeImpl implements _Employee {
  const _$EmployeeImpl(
      {required this.id, required this.name, required this.avatar});

  factory _$EmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatar;

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      __$$EmployeeImplCopyWithImpl<_$EmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeImplToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {required final String id,
      required final String name,
      required final String avatar}) = _$EmployeeImpl;

  factory _Employee.fromJson(Map<String, dynamic> json) =
      _$EmployeeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
