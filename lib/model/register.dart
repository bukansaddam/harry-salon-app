import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.g.dart';
part 'register.freezed.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required bool success,
    required String message,
    required String token,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
