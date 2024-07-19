import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
class PresenceResponse with _$PresenceResponse {
  const factory PresenceResponse({
    required bool success,
    required String message,
    required PresenceResult result,
  }) = _PresenceResponse;

  factory PresenceResponse.fromJson(Map<String, dynamic> json) =>
      _$PresenceResponseFromJson(json);
}

@freezed
class PresenceResult with _$PresenceResult {
  const factory PresenceResult({
    required int? totalCount,
    required int? totalPages,
    required List<Presence> data,
  }) = _PresenceResult;

  factory PresenceResult.fromJson(Map<String, dynamic> json) =>
      _$PresenceResultFromJson(json);
}

@freezed
class Presence with _$Presence {
  const factory Presence({
    required String id,
    required DateTime date,
    required DateTime entryTime,
    required DateTime? exitTime,
  }) = _Presence;

  factory Presence.fromJson(Map<String, dynamic> json) =>
      _$PresenceFromJson(json);
}
