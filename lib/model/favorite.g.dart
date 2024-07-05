// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteResponseImpl _$$FavoriteResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FavoriteResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: FavoriteResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavoriteResponseImplToJson(
        _$FavoriteResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$FavoriteResultImpl _$$FavoriteResultImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FavoriteResultImplToJson(
        _$FavoriteResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$FavoriteImpl _$$FavoriteImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteImpl(
      id: json['id'] as String,
      hairstyleId: json['hairstyleId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images: json['images'] as String,
    );

Map<String, dynamic> _$$FavoriteImplToJson(_$FavoriteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hairstyleId': instance.hairstyleId,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
    };
