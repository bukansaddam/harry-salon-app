import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_order.freezed.dart';
part 'total_order.g.dart';

@freezed
class TotalOrderResponse with _$TotalOrderResponse {
  const factory TotalOrderResponse({
    required bool success,
    required String message,
    required int result,
  }) = _TotalOrderResponse;

  factory TotalOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalOrderResponseFromJson(json);
}
