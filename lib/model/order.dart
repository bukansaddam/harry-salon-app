import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    required bool success,
    required String message,
    required OrderResult result,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}

@freezed
class OrderResult with _$OrderResult {
  const factory OrderResult({
    required int? totalCount,
    required int? totalPages,
    required List<Order> data,
  }) = _OrderResult;

  factory OrderResult.fromJson(Map<String, dynamic> json) =>
      _$OrderResultFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    required int? orderNumber,
    required bool? isMe,
    required String id,
    required String description,
    required String userName,
    required String userAvatar,
    required String storeName,
    required String storeLocation,
    required String serviceName,
    required int servicePrice,
    required String status,
    required DateTime date,
    required Reference? reference,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class Reference with _$Reference {
  const factory Reference({
    required String id,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Reference;

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);
}
