import 'package:freezed_annotation/freezed_annotation.dart';

part 'hairstyle.freezed.dart';
part 'hairstyle.g.dart';

@freezed
class HairstyleResponse with _$HairstyleResponse {
  const factory HairstyleResponse({
    required bool success,
    required String message,
    required HairstyleResult result,
  }) = _HairstyleResponse;

  factory HairstyleResponse.fromJson(Map<String, dynamic> json) =>
      _$HairstyleResponseFromJson(json);
}

@freezed
class HairstyleResult with _$HairstyleResult {
  const factory HairstyleResult({
    @JsonKey(name: 'total_count') required int? totalCount,
    @JsonKey(name: 'total_pages') required int? totalPages,
    required List<Hairstyle> data,
  }) = _HairstyleResult;

  factory HairstyleResult.fromJson(Map<String, dynamic> json) =>
      _$HairstyleResultFromJson(json);
}

@freezed
class Hairstyle with _$Hairstyle {
  const factory Hairstyle({
    required String id,
    required String name,
    required String description,
    required String image,
  }) = _Hairstyle;

  factory Hairstyle.fromJson(Map<String, dynamic> json) =>
      _$HairstyleFromJson(json);
}
