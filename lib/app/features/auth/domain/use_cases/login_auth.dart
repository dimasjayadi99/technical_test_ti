import 'package:talent_insider_test/app/features/auth/domain/entities/user_entity.dart';
import 'package:talent_insider_test/app/features/auth/domain/repositories/auth_repository.dart';

class LoginAuth {
  final AuthRepository authRepository;

  LoginAuth(this.authRepository);

  Future<UserEntity> loginWithEmailPassword(
      String email, String password) async {
    return await authRepository.loginWithEmailPassword(email, password);
  }
}
