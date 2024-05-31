import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_payslip.freezed.dart';
part 'detail_payslip.g.dart';

@freezed
class DetailPayslipResponse with _$DetailPayslipResponse {
  const factory DetailPayslipResponse({
    required bool success,
    required String message,
    required DetailPayslip data,
  }) = _DetailPayslipResponse;

  factory DetailPayslipResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailPayslipResponseFromJson(json);
}

@freezed
class DetailPayslip with _$DetailPayslip {
  const factory DetailPayslip({
    required String id,
    required String name,
    required String attachment,
    required int total,
    required String employeeId,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<SubDetailPayslip> earnings,
    required List<SubDetailPayslip> deductions,
  }) = _DetailPayslip;

  factory DetailPayslip.fromJson(Map<String, dynamic> json) =>
      _$DetailPayslipFromJson(json);
}

@freezed
class SubDetailPayslip with _$SubDetailPayslip {
  const factory SubDetailPayslip({
    required String name,
    required int amount,
  }) = _SubDetailPayslip;

  factory SubDetailPayslip.fromJson(Map<String, dynamic> json) =>
      _$SubDetailPayslipFromJson(json);
}
