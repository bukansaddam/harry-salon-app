import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class ServiceResponse with _$ServiceResponse {
  const factory ServiceResponse({
    required bool success,
    required String message,
    required ServiceResult result,
  }) = _ServiceResponse;

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);
}

@freezed
class ServiceResult with _$ServiceResult {
  const factory ServiceResult({
    required int? totalCount,
    required int? totalPages,
    required List<Service> data,
  }) = _ServiceResult;

  factory ServiceResult.fromJson(Map<String, dynamic> json) =>
      _$ServiceResultFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String image,
    required String name,
    required int? price,
    required int duration,
    required String storeId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
