// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrCodeResponseImpl _$$QrCodeResponseImplFromJson(Map<String, dynamic> json) =>
    _$QrCodeResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$QrCodeResponseImplToJson(
        _$QrCodeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
    };
