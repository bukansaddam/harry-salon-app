import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code.freezed.dart';
part 'qr_code.g.dart';

@freezed
class QrCodeResponse with _$QrCodeResponse {
  const factory QrCodeResponse({
    required bool success,
    required String message,
    required String token,
  }) = _QrCodeResponse;

  factory QrCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$QrCodeResponseFromJson(json);
}
