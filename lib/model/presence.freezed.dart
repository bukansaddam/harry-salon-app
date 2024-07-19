// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PresenceResponse _$PresenceResponseFromJson(Map<String, dynamic> json) {
  return _PresenceResponse.fromJson(json);
}

/// @nodoc
mixin _$PresenceResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PresenceResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresenceResponseCopyWith<PresenceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceResponseCopyWith<$Res> {
  factory $PresenceResponseCopyWith(
          PresenceResponse value, $Res Function(PresenceResponse) then) =
      _$PresenceResponseCopyWithImpl<$Res, PresenceResponse>;
  @useResult
  $Res call({bool success, String message, PresenceResult result});

  $PresenceResultCopyWith<$Res> get result;
}

/// @nodoc
class _$PresenceResponseCopyWithImpl<$Res, $Val extends PresenceResponse>
    implements $PresenceResponseCopyWith<$Res> {
  _$PresenceResponseCopyWithImpl(this._value, this._then);

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
              as PresenceResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PresenceResultCopyWith<$Res> get result {
    return $PresenceResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PresenceResponseImplCopyWith<$Res>
    implements $PresenceResponseCopyWith<$Res> {
  factory _$$PresenceResponseImplCopyWith(_$PresenceResponseImpl value,
          $Res Function(_$PresenceResponseImpl) then) =
      __$$PresenceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, PresenceResult result});

  @override
  $PresenceResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$PresenceResponseImplCopyWithImpl<$Res>
    extends _$PresenceResponseCopyWithImpl<$Res, _$PresenceResponseImpl>
    implements _$$PresenceResponseImplCopyWith<$Res> {
  __$$PresenceResponseImplCopyWithImpl(_$PresenceResponseImpl _value,
      $Res Function(_$PresenceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$PresenceResponseImpl(
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
              as PresenceResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceResponseImpl implements _PresenceResponse {
  const _$PresenceResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$PresenceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final PresenceResult result;

  @override
  String toString() {
    return 'PresenceResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceResponseImpl &&
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
  _$$PresenceResponseImplCopyWith<_$PresenceResponseImpl> get copyWith =>
      __$$PresenceResponseImplCopyWithImpl<_$PresenceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceResponseImplToJson(
      this,
    );
  }
}

abstract class _PresenceResponse implements PresenceResponse {
  const factory _PresenceResponse(
      {required final bool success,
      required final String message,
      required final PresenceResult result}) = _$PresenceResponseImpl;

  factory _PresenceResponse.fromJson(Map<String, dynamic> json) =
      _$PresenceResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PresenceResult get result;
  @override
  @JsonKey(ignore: true)
  _$$PresenceResponseImplCopyWith<_$PresenceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PresenceResult _$PresenceResultFromJson(Map<String, dynamic> json) {
  return _PresenceResult.fromJson(json);
}

/// @nodoc
mixin _$PresenceResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Presence> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresenceResultCopyWith<PresenceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceResultCopyWith<$Res> {
  factory $PresenceResultCopyWith(
          PresenceResult value, $Res Function(PresenceResult) then) =
      _$PresenceResultCopyWithImpl<$Res, PresenceResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Presence> data});
}

/// @nodoc
class _$PresenceResultCopyWithImpl<$Res, $Val extends PresenceResult>
    implements $PresenceResultCopyWith<$Res> {
  _$PresenceResultCopyWithImpl(this._value, this._then);

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
              as List<Presence>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresenceResultImplCopyWith<$Res>
    implements $PresenceResultCopyWith<$Res> {
  factory _$$PresenceResultImplCopyWith(_$PresenceResultImpl value,
          $Res Function(_$PresenceResultImpl) then) =
      __$$PresenceResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Presence> data});
}

/// @nodoc
class __$$PresenceResultImplCopyWithImpl<$Res>
    extends _$PresenceResultCopyWithImpl<$Res, _$PresenceResultImpl>
    implements _$$PresenceResultImplCopyWith<$Res> {
  __$$PresenceResultImplCopyWithImpl(
      _$PresenceResultImpl _value, $Res Function(_$PresenceResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$PresenceResultImpl(
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
              as List<Presence>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceResultImpl implements _PresenceResult {
  const _$PresenceResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Presence> data})
      : _data = data;

  factory _$PresenceResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Presence> _data;
  @override
  List<Presence> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PresenceResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceResultImpl &&
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
  _$$PresenceResultImplCopyWith<_$PresenceResultImpl> get copyWith =>
      __$$PresenceResultImplCopyWithImpl<_$PresenceResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceResultImplToJson(
      this,
    );
  }
}

abstract class _PresenceResult implements PresenceResult {
  const factory _PresenceResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Presence> data}) = _$PresenceResultImpl;

  factory _PresenceResult.fromJson(Map<String, dynamic> json) =
      _$PresenceResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Presence> get data;
  @override
  @JsonKey(ignore: true)
  _$$PresenceResultImplCopyWith<_$PresenceResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get entryTime => throw _privateConstructorUsedError;
  DateTime? get exitTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresenceCopyWith<Presence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) then) =
      _$PresenceCopyWithImpl<$Res, Presence>;
  @useResult
  $Res call({String id, DateTime date, DateTime entryTime, DateTime? exitTime});
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res, $Val extends Presence>
    implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? entryTime = null,
    Object? exitTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exitTime: freezed == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresenceImplCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$$PresenceImplCopyWith(
          _$PresenceImpl value, $Res Function(_$PresenceImpl) then) =
      __$$PresenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime date, DateTime entryTime, DateTime? exitTime});
}

/// @nodoc
class __$$PresenceImplCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$PresenceImpl>
    implements _$$PresenceImplCopyWith<$Res> {
  __$$PresenceImplCopyWithImpl(
      _$PresenceImpl _value, $Res Function(_$PresenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? entryTime = null,
    Object? exitTime = freezed,
  }) {
    return _then(_$PresenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exitTime: freezed == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceImpl implements _Presence {
  const _$PresenceImpl(
      {required this.id,
      required this.date,
      required this.entryTime,
      required this.exitTime});

  factory _$PresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime entryTime;
  @override
  final DateTime? exitTime;

  @override
  String toString() {
    return 'Presence(id: $id, date: $date, entryTime: $entryTime, exitTime: $exitTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.exitTime, exitTime) ||
                other.exitTime == exitTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, entryTime, exitTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      __$$PresenceImplCopyWithImpl<_$PresenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceImplToJson(
      this,
    );
  }
}

abstract class _Presence implements Presence {
  const factory _Presence(
      {required final String id,
      required final DateTime date,
      required final DateTime entryTime,
      required final DateTime? exitTime}) = _$PresenceImpl;

  factory _Presence.fromJson(Map<String, dynamic> json) =
      _$PresenceImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get entryTime;
  @override
  DateTime? get exitTime;
  @override
  @JsonKey(ignore: true)
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
