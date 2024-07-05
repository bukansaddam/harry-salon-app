// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueueResponseImpl _$$QueueResponseImplFromJson(Map<String, dynamic> json) =>
    _$QueueResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: Queue.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QueueResponseImplToJson(_$QueueResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$QueueImpl _$$QueueImplFromJson(Map<String, dynamic> json) => _$QueueImpl(
      totalOrder: (json['totalOrder'] as num?)?.toInt(),
      totalDuration: (json['totalDuration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QueueImplToJson(_$QueueImpl instance) =>
    <String, dynamic>{
      'totalOrder': instance.totalOrder,
      'totalDuration': instance.totalDuration,
    };
