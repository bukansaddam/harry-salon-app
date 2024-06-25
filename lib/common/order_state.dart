import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _OrderStateInitial;
  const factory OrderState.pending() = _OrderStatePending;
  const factory OrderState.waiting() = _OrderStateWaiting;
  const factory OrderState.onProcress() = _OrderStateOnProcress;
  const factory OrderState.done() = _OrderStateDone;
  const factory OrderState.canceled() = _OrderStateCanceled;
  const factory OrderState.error({required String message}) = _OrderStateError;
}
