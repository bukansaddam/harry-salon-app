import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class StoreResponse with _$StoreResponse {
  const factory StoreResponse({
    required bool success,
    required String message,
    required StoreResult result,
  }) = _StoreResponse;

  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);
}

@freezed
class StoreResult with _$StoreResult {
  const factory StoreResult({
    @JsonKey(name: 'total_count') required int? totalCount,
    @JsonKey(name: 'total_pages') required int? totalPages,
    required List<Store> data,
  }) = _StoreResult;

  factory StoreResult.fromJson(Map<String, dynamic> json) =>
      _$StoreResultFromJson(json);
}

@freezed
class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required String location,
    required bool isActive,
    required int? totalEmployees,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
