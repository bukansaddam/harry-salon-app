// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: OrderResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$OrderResultImpl _$$OrderResultImplFromJson(Map<String, dynamic> json) =>
    _$OrderResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderResultImplToJson(_$OrderResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderNumber: (json['orderNumber'] as num?)?.toInt(),
      isMe: json['isMe'] as bool?,
      id: json['id'] as String,
      description: json['description'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String,
      storeName: json['storeName'] as String,
      storeLocation: json['storeLocation'] as String,
      serviceName: json['serviceName'] as String,
      servicePrice: (json['servicePrice'] as num).toInt(),
      status: json['status'] as String,
      date: DateTime.parse(json['date'] as String),
      reference: json['reference'] == null
          ? null
          : Reference.fromJson(json['reference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'isMe': instance.isMe,
      'id': instance.id,
      'description': instance.description,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'storeName': instance.storeName,
      'storeLocation': instance.storeLocation,
      'serviceName': instance.serviceName,
      'servicePrice': instance.servicePrice,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
      'reference': instance.reference,
    };

_$ReferenceImpl _$$ReferenceImplFromJson(Map<String, dynamic> json) =>
    _$ReferenceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReferenceImplToJson(_$ReferenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
