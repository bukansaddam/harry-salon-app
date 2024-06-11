// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hairstyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HairstyleResponseImpl _$$HairstyleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HairstyleResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: HairstyleResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HairstyleResponseImplToJson(
        _$HairstyleResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$HairstyleResultImpl _$$HairstyleResultImplFromJson(
        Map<String, dynamic> json) =>
    _$HairstyleResultImpl(
      totalCount: (json['total_count'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Hairstyle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HairstyleResultImplToJson(
        _$HairstyleResultImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };

_$HairstyleImpl _$$HairstyleImplFromJson(Map<String, dynamic> json) =>
    _$HairstyleImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$HairstyleImplToJson(_$HairstyleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
