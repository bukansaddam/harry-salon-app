// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_payslip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailPayslipResponseImpl _$$DetailPayslipResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailPayslipResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DetailPayslip.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailPayslipResponseImplToJson(
        _$DetailPayslipResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailPayslipImpl _$$DetailPayslipImplFromJson(Map<String, dynamic> json) =>
    _$DetailPayslipImpl(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      employeeName: json['employeeName'] as String,
      name: json['name'] as String,
      attachment: json['attachment'] as String?,
      total: (json['total'] as num).toInt(),
      employeeId: json['employeeId'] as String,
      date: DateTime.parse(json['date'] as String),
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      earnings: (json['earnings'] as List<dynamic>)
          .map((e) => SubDetailPayslip.fromJson(e as Map<String, dynamic>))
          .toList(),
      deductions: (json['deductions'] as List<dynamic>)
          .map((e) => SubDetailPayslip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailPayslipImplToJson(_$DetailPayslipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'employeeName': instance.employeeName,
      'name': instance.name,
      'attachment': instance.attachment,
      'total': instance.total,
      'employeeId': instance.employeeId,
      'date': instance.date.toIso8601String(),
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'earnings': instance.earnings,
      'deductions': instance.deductions,
    };

_$SubDetailPayslipImpl _$$SubDetailPayslipImplFromJson(
        Map<String, dynamic> json) =>
    _$SubDetailPayslipImpl(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubDetailPayslipImplToJson(
        _$SubDetailPayslipImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };
