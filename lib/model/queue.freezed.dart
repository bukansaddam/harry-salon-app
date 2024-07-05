// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QueueResponse _$QueueResponseFromJson(Map<String, dynamic> json) {
  return _QueueResponse.fromJson(json);
}

/// @nodoc
mixin _$QueueResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Queue get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueueResponseCopyWith<QueueResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueResponseCopyWith<$Res> {
  factory $QueueResponseCopyWith(
          QueueResponse value, $Res Function(QueueResponse) then) =
      _$QueueResponseCopyWithImpl<$Res, QueueResponse>;
  @useResult
  $Res call({bool success, String message, Queue result});

  $QueueCopyWith<$Res> get result;
}

/// @nodoc
class _$QueueResponseCopyWithImpl<$Res, $Val extends QueueResponse>
    implements $QueueResponseCopyWith<$Res> {
  _$QueueResponseCopyWithImpl(this._value, this._then);

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
              as Queue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QueueCopyWith<$Res> get result {
    return $QueueCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QueueResponseImplCopyWith<$Res>
    implements $QueueResponseCopyWith<$Res> {
  factory _$$QueueResponseImplCopyWith(
          _$QueueResponseImpl value, $Res Function(_$QueueResponseImpl) then) =
      __$$QueueResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, Queue result});

  @override
  $QueueCopyWith<$Res> get result;
}

/// @nodoc
class __$$QueueResponseImplCopyWithImpl<$Res>
    extends _$QueueResponseCopyWithImpl<$Res, _$QueueResponseImpl>
    implements _$$QueueResponseImplCopyWith<$Res> {
  __$$QueueResponseImplCopyWithImpl(
      _$QueueResponseImpl _value, $Res Function(_$QueueResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$QueueResponseImpl(
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
              as Queue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueResponseImpl implements _QueueResponse {
  const _$QueueResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$QueueResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final Queue result;

  @override
  String toString() {
    return 'QueueResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueResponseImpl &&
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
  _$$QueueResponseImplCopyWith<_$QueueResponseImpl> get copyWith =>
      __$$QueueResponseImplCopyWithImpl<_$QueueResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueResponseImplToJson(
      this,
    );
  }
}

abstract class _QueueResponse implements QueueResponse {
  const factory _QueueResponse(
      {required final bool success,
      required final String message,
      required final Queue result}) = _$QueueResponseImpl;

  factory _QueueResponse.fromJson(Map<String, dynamic> json) =
      _$QueueResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Queue get result;
  @override
  @JsonKey(ignore: true)
  _$$QueueResponseImplCopyWith<_$QueueResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Queue _$QueueFromJson(Map<String, dynamic> json) {
  return _Queue.fromJson(json);
}

/// @nodoc
mixin _$Queue {
  int? get totalOrder => throw _privateConstructorUsedError;
  int? get totalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueueCopyWith<Queue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueCopyWith<$Res> {
  factory $QueueCopyWith(Queue value, $Res Function(Queue) then) =
      _$QueueCopyWithImpl<$Res, Queue>;
  @useResult
  $Res call({int? totalOrder, int? totalDuration});
}

/// @nodoc
class _$QueueCopyWithImpl<$Res, $Val extends Queue>
    implements $QueueCopyWith<$Res> {
  _$QueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrder = freezed,
    Object? totalDuration = freezed,
  }) {
    return _then(_value.copyWith(
      totalOrder: freezed == totalOrder
          ? _value.totalOrder
          : totalOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDuration: freezed == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueueImplCopyWith<$Res> implements $QueueCopyWith<$Res> {
  factory _$$QueueImplCopyWith(
          _$QueueImpl value, $Res Function(_$QueueImpl) then) =
      __$$QueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalOrder, int? totalDuration});
}

/// @nodoc
class __$$QueueImplCopyWithImpl<$Res>
    extends _$QueueCopyWithImpl<$Res, _$QueueImpl>
    implements _$$QueueImplCopyWith<$Res> {
  __$$QueueImplCopyWithImpl(
      _$QueueImpl _value, $Res Function(_$QueueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrder = freezed,
    Object? totalDuration = freezed,
  }) {
    return _then(_$QueueImpl(
      totalOrder: freezed == totalOrder
          ? _value.totalOrder
          : totalOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDuration: freezed == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueImpl implements _Queue {
  const _$QueueImpl({required this.totalOrder, required this.totalDuration});

  factory _$QueueImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueImplFromJson(json);

  @override
  final int? totalOrder;
  @override
  final int? totalDuration;

  @override
  String toString() {
    return 'Queue(totalOrder: $totalOrder, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueImpl &&
            (identical(other.totalOrder, totalOrder) ||
                other.totalOrder == totalOrder) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalOrder, totalDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueImplCopyWith<_$QueueImpl> get copyWith =>
      __$$QueueImplCopyWithImpl<_$QueueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueImplToJson(
      this,
    );
  }
}

abstract class _Queue implements Queue {
  const factory _Queue(
      {required final int? totalOrder,
      required final int? totalDuration}) = _$QueueImpl;

  factory _Queue.fromJson(Map<String, dynamic> json) = _$QueueImpl.fromJson;

  @override
  int? get totalOrder;
  @override
  int? get totalDuration;
  @override
  @JsonKey(ignore: true)
  _$$QueueImplCopyWith<_$QueueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
