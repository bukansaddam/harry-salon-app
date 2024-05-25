import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_employee.freezed.dart';
part 'detail_employee.g.dart';

@freezed
class DetailEmployeeResponse with _$DetailEmployeeResponse {
  const factory DetailEmployeeResponse({
    required bool success,
    required String message,
    required DetailEmployee data,
  }) = _DetailEmployeeResponse;

  factory DetailEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailEmployeeResponseFromJson(json);
}

@freezed
class DetailEmployee with _$DetailEmployee {
  const factory DetailEmployee({
    required String id,
    required String name,
    required String email,
    required String password,
    required int phone,
    required String address,
    required String avatar,
    required dynamic storeId,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String? storeLocation,
  }) = _DetailEmployee;

  factory DetailEmployee.fromJson(Map<String, dynamic> json) =>
      _$DetailEmployeeFromJson(json);
}
