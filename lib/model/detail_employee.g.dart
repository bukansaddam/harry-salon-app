// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailEmployeeResponseImpl _$$DetailEmployeeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailEmployeeResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DetailEmployee.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailEmployeeResponseImplToJson(
        _$DetailEmployeeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailEmployeeImpl _$$DetailEmployeeImplFromJson(Map<String, dynamic> json) =>
    _$DetailEmployeeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: (json['phone'] as num).toInt(),
      address: json['address'] as String,
      avatar: json['avatar'] as String,
      storeId: json['storeId'],
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      storeLocation: json['storeLocation'] as String?,
    );

Map<String, dynamic> _$$DetailEmployeeImplToJson(
        _$DetailEmployeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'address': instance.address,
      'avatar': instance.avatar,
      'storeId': instance.storeId,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'storeLocation': instance.storeLocation,
    };
