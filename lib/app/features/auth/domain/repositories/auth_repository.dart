import 'package:talent_insider_test/app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmailPassword(String email, String password);
}
