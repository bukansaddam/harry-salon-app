import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history.freezed.dart';
part 'order_history.g.dart';

@freezed
class OrderHistoryResponse with _$OrderHistoryResponse {
  const factory OrderHistoryResponse({
    required bool success,
    required String message,
    required OrderHistoryResult result,
  }) = _OrderHistoryResponse;

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryResponseFromJson(json);
}

@freezed
class OrderHistoryResult with _$OrderHistoryResult {
  const factory OrderHistoryResult({
    required int? totalCount,
    required int? totalPages,
    required List<Graph>? graph,
    required List<OrderHistory> data,
  }) = _OrderHistoryResult;

  factory OrderHistoryResult.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryResultFromJson(json);
}

@freezed
class OrderHistory with _$OrderHistory {
  const factory OrderHistory({
    required String id,
    required String orderId,
    required String storeId,
    required String serviceName,
    required int servicePrice,
    required DateTime orderDate,
    required String orderDescription,
    required String status,
  }) = _OrderHistory;

  factory OrderHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryFromJson(json);
}

@freezed
class Graph with _$Graph {
  const factory Graph({
    required String date,
    required int count,
  }) = _Graph;

  factory Graph.fromJson(Map<String, dynamic> json) => _$GraphFromJson(json);
}
