// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_commodity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailCommodityResponseImpl _$$DetailCommodityResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCommodityResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DetailCommodity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailCommodityResponseImplToJson(
        _$DetailCommodityResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailCommodityImpl _$$DetailCommodityImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCommodityImpl(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      stock: (json['stock'] as num?)?.toInt(),
      storeId: json['storeId'] as String,
      isDeleted: json['isDeleted'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DetailCommodityImplToJson(
        _$DetailCommodityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'category': instance.category,
      'stock': instance.stock,
      'storeId': instance.storeId,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
