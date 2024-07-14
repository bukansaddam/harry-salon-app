import 'package:freezed_annotation/freezed_annotation.dart';

part 'commodity.freezed.dart';
part 'commodity.g.dart';

@freezed
class CommodityResponse with _$CommodityResponse {
  const factory CommodityResponse({
    required bool success,
    required String message,
    required CommodityResult result,
  }) = _CommodityResponse;

  factory CommodityResponse.fromJson(Map<String, dynamic> json) =>
      _$CommodityResponseFromJson(json);
}

@freezed
class CommodityResult with _$CommodityResult {
  const factory CommodityResult({
    required int? totalCount,
    required int? totalPages,
    required List<Commodity> data,
  }) = _CommodityResult;

  factory CommodityResult.fromJson(Map<String, dynamic> json) =>
      _$CommodityResultFromJson(json);
}

@freezed
class Commodity with _$Commodity {
  const factory Commodity({
    required String id,
    required String image,
    required String name,
    required int? stock,
    required String category,
    required String storeId,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Commodity;

  factory Commodity.fromJson(Map<String, dynamic> json) =>
      _$CommodityFromJson(json);
}
