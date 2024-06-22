// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailOrderResponseImpl _$$DetailOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailOrderResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : DetailOrder.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailOrderResponseImplToJson(
        _$DetailOrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$DetailOrderImpl _$$DetailOrderImplFromJson(Map<String, dynamic> json) =>
    _$DetailOrderImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      storeName: json['storeName'] as String,
      storeLocation: json['storeLocation'] as String,
      serviceName: json['serviceName'] as String,
      servicePrice: (json['servicePrice'] as num).toInt(),
      reference: json['reference'] == null
          ? null
          : Reference.fromJson(json['reference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailOrderImplToJson(_$DetailOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'storeName': instance.storeName,
      'storeLocation': instance.storeLocation,
      'serviceName': instance.serviceName,
      'servicePrice': instance.servicePrice,
      'reference': instance.reference,
    };

_$ReferenceImpl _$$ReferenceImplFromJson(Map<String, dynamic> json) =>
    _$ReferenceImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReferenceImplToJson(_$ReferenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
