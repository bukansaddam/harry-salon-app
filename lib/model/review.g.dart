// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: ReviewResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
        _$ReviewResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

_$ReviewResultImpl _$$ReviewResultImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResultImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReviewResultImplToJson(_$ReviewResultImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String,
      isMe: json['isMe'] as bool,
      avatar: json['avatar'] as String,
      username: json['username'] as String,
      rating: (json['rating'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isMe': instance.isMe,
      'avatar': instance.avatar,
      'username': instance.username,
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
    };
