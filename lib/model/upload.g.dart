// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadResponseImpl _$$UploadResponseImplFromJson(Map<String, dynamic> json) =>
    _$UploadResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$UploadResponseImplToJson(
        _$UploadResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
