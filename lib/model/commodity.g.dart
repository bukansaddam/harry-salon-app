// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommodityResponseImpl _$$CommodityResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommodityResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: CommodityResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommodityResponseImplToJson(
        _$CommodityResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$CommodityResultImpl _$$CommodityResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CommodityResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Commodity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommodityResultImplToJson(
        _$CommodityResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$CommodityImpl _$$CommodityImplFromJson(Map<String, dynamic> json) =>
    _$CommodityImpl(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      stock: (json['stock'] as num?)?.toInt(),
      storeId: json['storeId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CommodityImplToJson(_$CommodityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'stock': instance.stock,
      'storeId': instance.storeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
