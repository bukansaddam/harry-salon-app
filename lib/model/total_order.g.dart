// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotalOrderResponseImpl _$$TotalOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TotalOrderResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$$TotalOrderResponseImplToJson(
        _$TotalOrderResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };
