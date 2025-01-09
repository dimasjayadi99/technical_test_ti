import 'package:talent_insider_test/app/features/auth/data/models/login_model.dart';
import 'package:talent_insider_test/app/features/auth/domain/entities/user_entity.dart';

class UserMapper {
  UserEntity toUser(LoginModel data) {
    try {
      return UserEntity(
          token: data.token,
          id: data.user.id,
          email: data.user.email,
          firstName: data.user.firstName,
          lastName: data.user.lastName,
          phoneNumber: data.user.phoneNumber ?? '',
          userId: data.userId,
          role: data.user.role);
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
  }
}
