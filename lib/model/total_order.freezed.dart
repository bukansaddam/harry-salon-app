// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TotalOrderResponse _$TotalOrderResponseFromJson(Map<String, dynamic> json) {
  return _TotalOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$TotalOrderResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalOrderResponseCopyWith<TotalOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalOrderResponseCopyWith<$Res> {
  factory $TotalOrderResponseCopyWith(
          TotalOrderResponse value, $Res Function(TotalOrderResponse) then) =
      _$TotalOrderResponseCopyWithImpl<$Res, TotalOrderResponse>;
  @useResult
  $Res call({bool success, String message, int result});
}

/// @nodoc
class _$TotalOrderResponseCopyWithImpl<$Res, $Val extends TotalOrderResponse>
    implements $TotalOrderResponseCopyWith<$Res> {
  _$TotalOrderResponseCopyWithImpl(this._value, this._then);

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
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalOrderResponseImplCopyWith<$Res>
    implements $TotalOrderResponseCopyWith<$Res> {
  factory _$$TotalOrderResponseImplCopyWith(_$TotalOrderResponseImpl value,
          $Res Function(_$TotalOrderResponseImpl) then) =
      __$$TotalOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, int result});
}

/// @nodoc
class __$$TotalOrderResponseImplCopyWithImpl<$Res>
    extends _$TotalOrderResponseCopyWithImpl<$Res, _$TotalOrderResponseImpl>
    implements _$$TotalOrderResponseImplCopyWith<$Res> {
  __$$TotalOrderResponseImplCopyWithImpl(_$TotalOrderResponseImpl _value,
      $Res Function(_$TotalOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$TotalOrderResponseImpl(
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
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalOrderResponseImpl implements _TotalOrderResponse {
  const _$TotalOrderResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$TotalOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalOrderResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final int result;

  @override
  String toString() {
    return 'TotalOrderResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalOrderResponseImpl &&
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
  _$$TotalOrderResponseImplCopyWith<_$TotalOrderResponseImpl> get copyWith =>
      __$$TotalOrderResponseImplCopyWithImpl<_$TotalOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _TotalOrderResponse implements TotalOrderResponse {
  const factory _TotalOrderResponse(
      {required final bool success,
      required final String message,
      required final int result}) = _$TotalOrderResponseImpl;

  factory _TotalOrderResponse.fromJson(Map<String, dynamic> json) =
      _$TotalOrderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  int get result;
  @override
  @JsonKey(ignore: true)
  _$$TotalOrderResponseImplCopyWith<_$TotalOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
