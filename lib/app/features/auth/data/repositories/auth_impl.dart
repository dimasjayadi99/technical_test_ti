import 'package:talent_insider_test/app/core/mapper/user_mapper.dart';
import 'package:talent_insider_test/app/features/auth/data/data_source/remote/auth_services.dart';
import 'package:talent_insider_test/app/features/auth/domain/entities/user_entity.dart';
import 'package:talent_insider_test/app/features/auth/domain/repositories/auth_repository.dart';

class AuthImpl extends AuthRepository {
  final AuthService authService;
  final UserMapper userMapper;

  AuthImpl({required this.authService, required this.userMapper});

  @override
  Future<UserEntity> loginWithEmailPassword(
      String email, String password) async {
    try {
      final response = await authService.loginAuthService(email, password);
      final data = userMapper.toUser(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
