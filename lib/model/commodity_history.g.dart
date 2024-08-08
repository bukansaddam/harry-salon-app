// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommodityHistoryResponseImpl _$$CommodityHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommodityHistoryResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data:
          CommodityHistoryResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommodityHistoryResponseImplToJson(
        _$CommodityHistoryResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$CommodityHistoryResultImpl _$$CommodityHistoryResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CommodityHistoryResultImpl(
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CommodityHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommodityHistoryResultImplToJson(
        _$CommodityHistoryResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$CommodityHistoryImpl _$$CommodityHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$CommodityHistoryImpl(
      id: json['id'] as String,
      commodityId: json['commodityId'] as String,
      description: json['description'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CommodityHistoryImplToJson(
        _$CommodityHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commodityId': instance.commodityId,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
