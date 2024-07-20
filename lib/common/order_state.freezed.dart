// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderStateInitialImplCopyWith<$Res> {
  factory _$$OrderStateInitialImplCopyWith(_$OrderStateInitialImpl value,
          $Res Function(_$OrderStateInitialImpl) then) =
      __$$OrderStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateInitialImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateInitialImpl>
    implements _$$OrderStateInitialImplCopyWith<$Res> {
  __$$OrderStateInitialImplCopyWithImpl(_$OrderStateInitialImpl _value,
      $Res Function(_$OrderStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateInitialImpl implements _OrderStateInitial {
  const _$OrderStateInitialImpl();

  @override
  String toString() {
    return 'OrderState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _OrderStateInitial implements OrderState {
  const factory _OrderStateInitial() = _$OrderStateInitialImpl;
}

/// @nodoc
abstract class _$$OrderStateUnpaidImplCopyWith<$Res> {
  factory _$$OrderStateUnpaidImplCopyWith(_$OrderStateUnpaidImpl value,
          $Res Function(_$OrderStateUnpaidImpl) then) =
      __$$OrderStateUnpaidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateUnpaidImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateUnpaidImpl>
    implements _$$OrderStateUnpaidImplCopyWith<$Res> {
  __$$OrderStateUnpaidImplCopyWithImpl(_$OrderStateUnpaidImpl _value,
      $Res Function(_$OrderStateUnpaidImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateUnpaidImpl implements _OrderStateUnpaid {
  const _$OrderStateUnpaidImpl();

  @override
  String toString() {
    return 'OrderState.unpaid()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateUnpaidImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return unpaid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return unpaid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unpaid != null) {
      return unpaid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return unpaid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return unpaid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (unpaid != null) {
      return unpaid(this);
    }
    return orElse();
  }
}

abstract class _OrderStateUnpaid implements OrderState {
  const factory _OrderStateUnpaid() = _$OrderStateUnpaidImpl;
}

/// @nodoc
abstract class _$$OrderStatePendingImplCopyWith<$Res> {
  factory _$$OrderStatePendingImplCopyWith(_$OrderStatePendingImpl value,
          $Res Function(_$OrderStatePendingImpl) then) =
      __$$OrderStatePendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStatePendingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStatePendingImpl>
    implements _$$OrderStatePendingImplCopyWith<$Res> {
  __$$OrderStatePendingImplCopyWithImpl(_$OrderStatePendingImpl _value,
      $Res Function(_$OrderStatePendingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStatePendingImpl implements _OrderStatePending {
  const _$OrderStatePendingImpl();

  @override
  String toString() {
    return 'OrderState.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStatePendingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _OrderStatePending implements OrderState {
  const factory _OrderStatePending() = _$OrderStatePendingImpl;
}

/// @nodoc
abstract class _$$OrderStateWaitingImplCopyWith<$Res> {
  factory _$$OrderStateWaitingImplCopyWith(_$OrderStateWaitingImpl value,
          $Res Function(_$OrderStateWaitingImpl) then) =
      __$$OrderStateWaitingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateWaitingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateWaitingImpl>
    implements _$$OrderStateWaitingImplCopyWith<$Res> {
  __$$OrderStateWaitingImplCopyWithImpl(_$OrderStateWaitingImpl _value,
      $Res Function(_$OrderStateWaitingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateWaitingImpl implements _OrderStateWaiting {
  const _$OrderStateWaitingImpl();

  @override
  String toString() {
    return 'OrderState.waiting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateWaitingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class _OrderStateWaiting implements OrderState {
  const factory _OrderStateWaiting() = _$OrderStateWaitingImpl;
}

/// @nodoc
abstract class _$$OrderStateOnProcressImplCopyWith<$Res> {
  factory _$$OrderStateOnProcressImplCopyWith(_$OrderStateOnProcressImpl value,
          $Res Function(_$OrderStateOnProcressImpl) then) =
      __$$OrderStateOnProcressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateOnProcressImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateOnProcressImpl>
    implements _$$OrderStateOnProcressImplCopyWith<$Res> {
  __$$OrderStateOnProcressImplCopyWithImpl(_$OrderStateOnProcressImpl _value,
      $Res Function(_$OrderStateOnProcressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateOnProcressImpl implements _OrderStateOnProcress {
  const _$OrderStateOnProcressImpl();

  @override
  String toString() {
    return 'OrderState.onProcress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateOnProcressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return onProcress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return onProcress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (onProcress != null) {
      return onProcress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return onProcress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return onProcress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (onProcress != null) {
      return onProcress(this);
    }
    return orElse();
  }
}

abstract class _OrderStateOnProcress implements OrderState {
  const factory _OrderStateOnProcress() = _$OrderStateOnProcressImpl;
}

/// @nodoc
abstract class _$$OrderStateDoneImplCopyWith<$Res> {
  factory _$$OrderStateDoneImplCopyWith(_$OrderStateDoneImpl value,
          $Res Function(_$OrderStateDoneImpl) then) =
      __$$OrderStateDoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateDoneImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateDoneImpl>
    implements _$$OrderStateDoneImplCopyWith<$Res> {
  __$$OrderStateDoneImplCopyWithImpl(
      _$OrderStateDoneImpl _value, $Res Function(_$OrderStateDoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateDoneImpl implements _OrderStateDone {
  const _$OrderStateDoneImpl();

  @override
  String toString() {
    return 'OrderState.done()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateDoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _OrderStateDone implements OrderState {
  const factory _OrderStateDone() = _$OrderStateDoneImpl;
}

/// @nodoc
abstract class _$$OrderStateCanceledImplCopyWith<$Res> {
  factory _$$OrderStateCanceledImplCopyWith(_$OrderStateCanceledImpl value,
          $Res Function(_$OrderStateCanceledImpl) then) =
      __$$OrderStateCanceledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateCanceledImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateCanceledImpl>
    implements _$$OrderStateCanceledImplCopyWith<$Res> {
  __$$OrderStateCanceledImplCopyWithImpl(_$OrderStateCanceledImpl _value,
      $Res Function(_$OrderStateCanceledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateCanceledImpl implements _OrderStateCanceled {
  const _$OrderStateCanceledImpl();

  @override
  String toString() {
    return 'OrderState.canceled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateCanceledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return canceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return canceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return canceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return canceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled(this);
    }
    return orElse();
  }
}

abstract class _OrderStateCanceled implements OrderState {
  const factory _OrderStateCanceled() = _$OrderStateCanceledImpl;
}

/// @nodoc
abstract class _$$OrderStateErrorImplCopyWith<$Res> {
  factory _$$OrderStateErrorImplCopyWith(_$OrderStateErrorImpl value,
          $Res Function(_$OrderStateErrorImpl) then) =
      __$$OrderStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OrderStateErrorImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateErrorImpl>
    implements _$$OrderStateErrorImplCopyWith<$Res> {
  __$$OrderStateErrorImplCopyWithImpl(
      _$OrderStateErrorImpl _value, $Res Function(_$OrderStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OrderStateErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderStateErrorImpl implements _OrderStateError {
  const _$OrderStateErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'OrderState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateErrorImplCopyWith<_$OrderStateErrorImpl> get copyWith =>
      __$$OrderStateErrorImplCopyWithImpl<_$OrderStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unpaid,
    required TResult Function() pending,
    required TResult Function() waiting,
    required TResult Function() onProcress,
    required TResult Function() done,
    required TResult Function() canceled,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unpaid,
    TResult? Function()? pending,
    TResult? Function()? waiting,
    TResult? Function()? onProcress,
    TResult? Function()? done,
    TResult? Function()? canceled,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unpaid,
    TResult Function()? pending,
    TResult Function()? waiting,
    TResult Function()? onProcress,
    TResult Function()? done,
    TResult Function()? canceled,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OrderStateInitial value) initial,
    required TResult Function(_OrderStateUnpaid value) unpaid,
    required TResult Function(_OrderStatePending value) pending,
    required TResult Function(_OrderStateWaiting value) waiting,
    required TResult Function(_OrderStateOnProcress value) onProcress,
    required TResult Function(_OrderStateDone value) done,
    required TResult Function(_OrderStateCanceled value) canceled,
    required TResult Function(_OrderStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OrderStateInitial value)? initial,
    TResult? Function(_OrderStateUnpaid value)? unpaid,
    TResult? Function(_OrderStatePending value)? pending,
    TResult? Function(_OrderStateWaiting value)? waiting,
    TResult? Function(_OrderStateOnProcress value)? onProcress,
    TResult? Function(_OrderStateDone value)? done,
    TResult? Function(_OrderStateCanceled value)? canceled,
    TResult? Function(_OrderStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OrderStateInitial value)? initial,
    TResult Function(_OrderStateUnpaid value)? unpaid,
    TResult Function(_OrderStatePending value)? pending,
    TResult Function(_OrderStateWaiting value)? waiting,
    TResult Function(_OrderStateOnProcress value)? onProcress,
    TResult Function(_OrderStateDone value)? done,
    TResult Function(_OrderStateCanceled value)? canceled,
    TResult Function(_OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _OrderStateError implements OrderState {
  const factory _OrderStateError({required final String message}) =
      _$OrderStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$OrderStateErrorImplCopyWith<_$OrderStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
