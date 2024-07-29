// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceResponseImpl _$$ServiceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: ServiceResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServiceResponseImplToJson(
        _$ServiceResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$ServiceResultImpl _$$ServiceResultImplFromJson(Map<String, dynamic> json) =>
    _$ServiceResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceResultImplToJson(_$ServiceResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      price: (json['price'] as num?)?.toInt(),
      duration: (json['duration'] as num).toInt(),
      storeId: json['storeId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'duration': instance.duration,
      'storeId': instance.storeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
