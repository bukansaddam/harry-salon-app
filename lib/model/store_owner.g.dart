// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreOwnerResponseImpl _$$StoreOwnerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StoreOwnerResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: StoreOwnerResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreOwnerResponseImplToJson(
        _$StoreOwnerResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$StoreOwnerResultImpl _$$StoreOwnerResultImplFromJson(
        Map<String, dynamic> json) =>
    _$StoreOwnerResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => StoreOwner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoreOwnerResultImplToJson(
        _$StoreOwnerResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$StoreOwnerImpl _$$StoreOwnerImplFromJson(Map<String, dynamic> json) =>
    _$StoreOwnerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      isActive: json['isActive'] as bool,
      totalEmployees: (json['totalEmployees'] as num?)?.toInt(),
      totalRevenue: json['totalRevenue'] as String,
    );

Map<String, dynamic> _$$StoreOwnerImplToJson(_$StoreOwnerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'isActive': instance.isActive,
      'totalEmployees': instance.totalEmployees,
      'totalRevenue': instance.totalRevenue,
    };
