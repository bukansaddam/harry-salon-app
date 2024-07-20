import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload.freezed.dart';
part 'upload.g.dart';

@freezed
class UploadResponse with _$UploadResponse {
  const factory UploadResponse({
    required bool success,
    required String message,
    String? data,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);
}
