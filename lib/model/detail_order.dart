import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_order.freezed.dart';
part 'detail_order.g.dart';

@freezed
class DetailOrderResponse with _$DetailOrderResponse {
  const factory DetailOrderResponse({
    required bool success,
    required String message,
    required DetailOrder data,
  }) = _DetailOrderResponse;

  factory DetailOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailOrderResponseFromJson(json);
}

@freezed
class DetailOrder with _$DetailOrder {
  const factory DetailOrder({
    required String id,
    required int orderNumber,
    required DateTime endTime,
    required String description,
    required bool isOnLocation,
    required bool isAccepted,
    required String status,
    required String storeName,
    required String storeLocation,
    required String serviceImage,
    required String serviceName,
    required int servicePrice,
    required String? employeeAvatar,
    required String? employeeName,
    required Reference? reference,
  }) = _DetailOrder;

  factory DetailOrder.fromJson(Map<String, dynamic> json) =>
      _$DetailOrderFromJson(json);
}

@freezed
class Reference with _$Reference {
  const factory Reference({
    required String id,
    required String name,
    required String description,
    required String image,
  }) = _Reference;

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);
}
