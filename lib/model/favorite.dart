import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class FavoriteResponse with _$FavoriteResponse {
  const factory FavoriteResponse({
    required bool success,
    required String message,
    required FavoriteResult result,
  }) = _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);
}

@freezed
class FavoriteResult with _$FavoriteResult {
  const factory FavoriteResult({
    required int? totalCount,
    required int? totalPages,
    required List<Favorite> data,
  }) = _FavoriteResult;

  factory FavoriteResult.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResultFromJson(json);
}

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required String id,
    required String hairstyleId,
    required String name,
    required String description,
    required String images,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
