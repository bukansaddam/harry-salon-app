// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeResponseImpl _$$EmployeeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: EmployeeResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmployeeResponseImplToJson(
        _$EmployeeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$EmployeeResultImpl _$$EmployeeResultImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EmployeeResultImplToJson(
        _$EmployeeResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      storeId: json['storeId'] as String?,
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'storeId': instance.storeId,
    };
