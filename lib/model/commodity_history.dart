import 'package:freezed_annotation/freezed_annotation.dart';

part 'commodity_history.freezed.dart';
part 'commodity_history.g.dart';

@freezed
class CommodityHistoryResponse with _$CommodityHistoryResponse {
  const factory CommodityHistoryResponse({
    required bool success,
    required String message,
    required CommodityHistoryResult data,
  }) = _CommodityHistoryResponse;

  factory CommodityHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CommodityHistoryResponseFromJson(json);
}

@freezed
class CommodityHistoryResult with _$CommodityHistoryResult {
  const factory CommodityHistoryResult({
    required int totalCount,
    required int totalPages,
    required List<CommodityHistory> data,
  }) = _CommodityHistoryResult;

  factory CommodityHistoryResult.fromJson(Map<String, dynamic> json) =>
      _$CommodityHistoryResultFromJson(json);
}

@freezed
class CommodityHistory with _$CommodityHistory {
  const factory CommodityHistory({
    required String id,
    required String commodityId,
    required String description,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CommodityHistory;

  factory CommodityHistory.fromJson(Map<String, dynamic> json) =>
      _$CommodityHistoryFromJson(json);
}
