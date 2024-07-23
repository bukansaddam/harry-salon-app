// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailStoreResponseImpl _$$DetailStoreResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailStoreResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DetailStore.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailStoreResponseImplToJson(
        _$DetailStoreResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DetailStoreImpl _$$DetailStoreImplFromJson(Map<String, dynamic> json) =>
    _$DetailStoreImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      openAt: json['openAt'] as String,
      closeAt: json['closeAt'] as String,
      isActive: json['isActive'] as bool,
      ownerId: json['ownerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      images: (json['images'] as List<dynamic>)
          .map((e) => StoreImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailStoreImplToJson(_$DetailStoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'openAt': instance.openAt,
      'closeAt': instance.closeAt,
      'isActive': instance.isActive,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'images': instance.images,
    };

_$StoreImageImpl _$$StoreImageImplFromJson(Map<String, dynamic> json) =>
    _$StoreImageImpl(
      id: json['id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$StoreImageImplToJson(_$StoreImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
