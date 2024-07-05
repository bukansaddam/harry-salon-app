import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue.freezed.dart';
part 'queue.g.dart';

@freezed
class QueueResponse with _$QueueResponse {
  const factory QueueResponse({
    required bool success,
    required String message,
    required Queue result,
  }) = _QueueResponse;

  factory QueueResponse.fromJson(Map<String, dynamic> json) =>
      _$QueueResponseFromJson(json);
}

@freezed
class Queue with _$Queue {
  const factory Queue({
    required int? totalOrder,
    required int? totalDuration,
  }) = _Queue;

  factory Queue.fromJson(Map<String, dynamic> json) => _$QueueFromJson(json);
}
