import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class EmployeeResponse with _$EmployeeResponse {
  const factory EmployeeResponse({
    required bool success,
    required String message,
    required EmployeeResult result,
  }) = _EmployeeResponse;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResponseFromJson(json);
}

@freezed
class EmployeeResult with _$EmployeeResult {
  const factory EmployeeResult({
    @JsonKey(name: 'total_count') required int? totalCount,
    @JsonKey(name: 'total_pages') required int? totalPages,
    required List<Employee> data,
  }) = _EmployeeResult;

  factory EmployeeResult.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResultFromJson(json);
}

@freezed
class Employee with _$Employee {
  const factory Employee({
    required String id,
    required String name,
    required String avatar,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
