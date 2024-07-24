import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_owner.freezed.dart';
part 'store_owner.g.dart';

@freezed
class StoreOwnerResponse with _$StoreOwnerResponse {
  const factory StoreOwnerResponse({
    required bool success,
    required String message,
    required StoreOwnerResult result,
  }) = _StoreOwnerResponse;

  factory StoreOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreOwnerResponseFromJson(json);
}

@freezed
class StoreOwnerResult with _$StoreOwnerResult {
  const factory StoreOwnerResult({
    required int? totalCount,
    required int? totalPages,
    required List<StoreOwner> data,
  }) = _StoreOwnerResult;

  factory StoreOwnerResult.fromJson(Map<String, dynamic> json) =>
      _$StoreOwnerResultFromJson(json);
}

@freezed
class StoreOwner with _$StoreOwner {
  const factory StoreOwner({
    required String id,
    required String name,
    required String location,
    required bool isActive,
    required int? totalEmployees,
    required String totalRevenue,
  }) = _StoreOwner;

  factory StoreOwner.fromJson(Map<String, dynamic> json) =>
      _$StoreOwnerFromJson(json);
}
