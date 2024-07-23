import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_store.freezed.dart';
part 'detail_store.g.dart';

@freezed
class DetailStoreResponse with _$DetailStoreResponse {
  const factory DetailStoreResponse({
    required bool success,
    required String message,
    required DetailStore data,
  }) = _DetailStoreResponse;

  factory DetailStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailStoreResponseFromJson(json);
}

@freezed
class DetailStore with _$DetailStore {
  const factory DetailStore({
    required String id,
    required String name,
    required String description,
    required String location,
    required double longitude,
    required double latitude,
    required String openAt,
    required String closeAt,
    required bool isActive,
    required String ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<StoreImage> images,
  }) = _DetailStore;

  factory DetailStore.fromJson(Map<String, dynamic> json) =>
      _$DetailStoreFromJson(json);
}

@freezed
class StoreImage with _$StoreImage {
  const factory StoreImage({
    required String id,
    required String image,
  }) = _StoreImage;

  factory StoreImage.fromJson(Map<String, dynamic> json) =>
      _$StoreImageFromJson(json);
}
