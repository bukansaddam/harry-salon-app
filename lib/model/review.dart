import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    required bool success,
    required String message,
    required ReviewResult result,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}

@freezed
class ReviewResult with _$ReviewResult {
  const factory ReviewResult({
    required int? totalCount,
    required int? totalPages,
    required List<Review> data,
  }) = _ReviewResult;

  factory ReviewResult.fromJson(Map<String, dynamic> json) =>
      _$ReviewResultFromJson(json);
}

@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    required bool isMe,
    required String avatar,
    required String username,
    required int? rating,
    required String? comment,
    required DateTime date,
    required String storeId,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
