// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_hairstyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailHairstyleResponseImpl _$$DetailHairstyleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailHairstyleResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DetailHairstyle.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailHairstyleResponseImplToJson(
        _$DetailHairstyleResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailHairstyleImpl _$$DetailHairstyleImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailHairstyleImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      images: (json['images'] as List<dynamic>)
          .map((e) => HairstyleImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailHairstyleImplToJson(
        _$DetailHairstyleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'images': instance.images,
    };

_$HairstyleImageImpl _$$HairstyleImageImplFromJson(Map<String, dynamic> json) =>
    _$HairstyleImageImpl(
      id: json['id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$HairstyleImageImplToJson(
        _$HairstyleImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
