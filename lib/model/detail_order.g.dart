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
      data: DetailOrder.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailOrderResponseImplToJson(
        _$DetailOrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailOrderImpl _$$DetailOrderImplFromJson(Map<String, dynamic> json) =>
    _$DetailOrderImpl(
      id: json['id'] as String,
      orderNumber: (json['orderNumber'] as num).toInt(),
      endTime: DateTime.parse(json['endTime'] as String),
      description: json['description'] as String,
      isOnLocation: json['isOnLocation'] as bool,
      isAccepted: json['isAccepted'] as bool,
      status: json['status'] as String,
      storeName: json['storeName'] as String,
      storeLocation: json['storeLocation'] as String,
      serviceImage: json['serviceImage'] as String,
      serviceName: json['serviceName'] as String,
      servicePrice: (json['servicePrice'] as num).toInt(),
      employeeAvatar: json['employeeAvatar'] as String?,
      employeeName: json['employeeName'] as String?,
      reference: json['reference'] == null
          ? null
          : Reference.fromJson(json['reference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailOrderImplToJson(_$DetailOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'endTime': instance.endTime.toIso8601String(),
      'description': instance.description,
      'isOnLocation': instance.isOnLocation,
      'isAccepted': instance.isAccepted,
      'status': instance.status,
      'storeName': instance.storeName,
      'storeLocation': instance.storeLocation,
      'serviceImage': instance.serviceImage,
      'serviceName': instance.serviceName,
      'servicePrice': instance.servicePrice,
      'employeeAvatar': instance.employeeAvatar,
      'employeeName': instance.employeeName,
      'reference': instance.reference,
    };

_$ReferenceImpl _$$ReferenceImplFromJson(Map<String, dynamic> json) =>
    _$ReferenceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$ReferenceImplToJson(_$ReferenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
