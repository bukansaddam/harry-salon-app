// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreResponseImpl _$$StoreResponseImplFromJson(Map<String, dynamic> json) =>
    _$StoreResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: StoreResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreResponseImplToJson(_$StoreResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$StoreResultImpl _$$StoreResultImplFromJson(Map<String, dynamic> json) =>
    _$StoreResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoreResultImplToJson(_$StoreResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      totalEmployees: (json['totalEmployees'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isActive': instance.isActive,
      'totalEmployees': instance.totalEmployees,
    };
