import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String token,
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String userId,
    required List<String> role,
  }) = _UserEntity;
}
