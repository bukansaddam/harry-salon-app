import 'package:freezed_annotation/freezed_annotation.dart';

part 'payslip.freezed.dart';
part 'payslip.g.dart';

@freezed
class PayslipResponse with _$PayslipResponse {
  const factory PayslipResponse({
    required bool success,
    required String message,
    required PayslipResult result,
  }) = _PayslipResponse;

  factory PayslipResponse.fromJson(Map<String, dynamic> json) =>
      _$PayslipResponseFromJson(json);
}

@freezed
class PayslipResult with _$PayslipResult {
  const factory PayslipResult({
    required int? totalCount,
    required int? totalPages,
    required List<Payslip> data,
  }) = _PayslipResult;

  factory PayslipResult.fromJson(Map<String, dynamic> json) =>
      _$PayslipResultFromJson(json);
}

@freezed
class Payslip with _$Payslip {
  const factory Payslip({
    required String id,
    required String avatar,
    required String employeeName,
    required String name,
    required int? total,
    required DateTime createdAt,
  }) = _Payslip;

  factory Payslip.fromJson(Map<String, dynamic> json) =>
      _$PayslipFromJson(json);
}
