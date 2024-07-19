// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceResponseImpl _$$PresenceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PresenceResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: PresenceResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PresenceResponseImplToJson(
        _$PresenceResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$PresenceResultImpl _$$PresenceResultImplFromJson(Map<String, dynamic> json) =>
    _$PresenceResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Presence.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PresenceResultImplToJson(
        _$PresenceResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$PresenceImpl _$$PresenceImplFromJson(Map<String, dynamic> json) =>
    _$PresenceImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      entryTime: DateTime.parse(json['entryTime'] as String),
      exitTime: json['exitTime'] == null
          ? null
          : DateTime.parse(json['exitTime'] as String),
    );

Map<String, dynamic> _$$PresenceImplToJson(_$PresenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'entryTime': instance.entryTime.toIso8601String(),
      'exitTime': instance.exitTime?.toIso8601String(),
    };
