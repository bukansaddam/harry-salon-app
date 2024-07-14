import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_commodity.freezed.dart';
part 'detail_commodity.g.dart';

@freezed
class DetailCommodityResponse with _$DetailCommodityResponse {
  const factory DetailCommodityResponse({
    required bool success,
    required String message,
    required DetailCommodity data,
  }) = _DetailCommodityResponse;

  factory DetailCommodityResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailCommodityResponseFromJson(json);
}

@freezed
class DetailCommodity with _$DetailCommodity {
  const factory DetailCommodity({
    required String id,
    required String image,
    required String name,
    required String category,
    required int? stock,
    required String storeId,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DetailCommodity;

  factory DetailCommodity.fromJson(Map<String, dynamic> json) =>
      _$DetailCommodityFromJson(json);
}
