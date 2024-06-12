// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailUserResponseImpl _$$DetailUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailUserResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DetailUser.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailUserResponseImplToJson(
        _$DetailUserResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailUserImpl _$$DetailUserImplFromJson(Map<String, dynamic> json) =>
    _$DetailUserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: (json['phone'] as num?)?.toInt(),
      address: json['address'] as String,
      avatar: json['avatar'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DetailUserImplToJson(_$DetailUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'address': instance.address,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
