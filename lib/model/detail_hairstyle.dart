import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_hairstyle.freezed.dart';
part 'detail_hairstyle.g.dart';

@freezed
class DetailHairstyleResponse with _$DetailHairstyleResponse {
  const factory DetailHairstyleResponse({
    required bool success,
    required String message,
    required DetailHairstyle data,
  }) = _DetailHairstyleResponse;

  factory DetailHairstyleResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailHairstyleResponseFromJson(json);
}

@freezed
class DetailHairstyle with _$DetailHairstyle {
  const factory DetailHairstyle({
    required String id,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<HairstyleImage> images,
  }) = _DetailHairstyle;

  factory DetailHairstyle.fromJson(Map<String, dynamic> json) =>
      _$DetailHairstyleFromJson(json);
}

@freezed
class HairstyleImage with _$HairstyleImage {
  const factory HairstyleImage({
    required String id,
    required String image,
  }) = _HairstyleImage;

  factory HairstyleImage.fromJson(Map<String, dynamic> json) =>
      _$HairstyleImageFromJson(json);
}
