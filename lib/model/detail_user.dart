import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_user.freezed.dart';
part 'detail_user.g.dart';

@freezed
class DetailUserResponse with _$DetailUserResponse {
  const factory DetailUserResponse({
    required bool success,
    required String message,
    required DetailUser data,
  }) = _DetailUserResponse;

  factory DetailUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailUserResponseFromJson(json);
}

@freezed
class DetailUser with _$DetailUser {
  const factory DetailUser({
    required String id,
    required String name,
    required String email,
    required String password,
    required int? phone,
    required String? storeLocation,
    required String address,
    required String avatar,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DetailUser;

  factory DetailUser.fromJson(Map<String, dynamic> json) =>
      _$DetailUserFromJson(json);
}
