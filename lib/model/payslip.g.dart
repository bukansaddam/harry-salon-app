// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayslipResponseImpl _$$PayslipResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PayslipResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: PayslipResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PayslipResponseImplToJson(
        _$PayslipResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$PayslipResultImpl _$$PayslipResultImplFromJson(Map<String, dynamic> json) =>
    _$PayslipResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Payslip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PayslipResultImplToJson(_$PayslipResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$PayslipImpl _$$PayslipImplFromJson(Map<String, dynamic> json) =>
    _$PayslipImpl(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      employeeName: json['employeeName'] as String,
      name: json['name'] as String,
      total: (json['total'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PayslipImplToJson(_$PayslipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'employeeName': instance.employeeName,
      'name': instance.name,
      'total': instance.total,
      'createdAt': instance.createdAt.toIso8601String(),
    };
