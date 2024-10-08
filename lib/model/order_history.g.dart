// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryResponseImpl _$$OrderHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result:
          OrderHistoryResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderHistoryResponseImplToJson(
        _$OrderHistoryResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$OrderHistoryResultImpl _$$OrderHistoryResultImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      graph: (json['graph'] as List<dynamic>?)
          ?.map((e) => Graph.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderHistoryResultImplToJson(
        _$OrderHistoryResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'graph': instance.graph,
      'data': instance.data,
    };

_$OrderHistoryImpl _$$OrderHistoryImplFromJson(Map<String, dynamic> json) =>
    _$OrderHistoryImpl(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      storeId: json['storeId'] as String,
      handledBy: json['handledBy'] as String,
      serviceName: json['serviceName'] as String,
      servicePrice: (json['servicePrice'] as num).toInt(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      orderDescription: json['orderDescription'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$OrderHistoryImplToJson(_$OrderHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'storeId': instance.storeId,
      'handledBy': instance.handledBy,
      'serviceName': instance.serviceName,
      'servicePrice': instance.servicePrice,
      'orderDate': instance.orderDate.toIso8601String(),
      'orderDescription': instance.orderDescription,
      'status': instance.status,
    };

_$GraphImpl _$$GraphImplFromJson(Map<String, dynamic> json) => _$GraphImpl(
      date: json['date'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$GraphImplToJson(_$GraphImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'count': instance.count,
    };
