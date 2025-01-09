import 'dart:io';
import 'package:dio/dio.dart';
import 'package:talent_insider_test/app/core/exceptions/network_exception.dart';
import 'package:talent_insider_test/app/features/auth/data/models/login_model.dart';
import '../../../../../config/api_config.dart';

class AuthService {
  final Dio dio;

  AuthService()
      : dio = Dio(BaseOptions(
            baseUrl: ApiConfig.baseUrl, receiveDataWhenStatusError: true));

  /// login authentication
  Future<LoginModel> loginAuthService(String email, String password) async {
    try {
      final Map<String, dynamic> request = {
        'email': email,
        'password': password,
      };
      final response = await dio.post('/auth/login', data: request);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return LoginModel.fromJson(data);
      } else {
        throw NetworkException(statusCode: response.statusCode!);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw NetworkException(
          statusCode: e.response?.statusCode ?? 0,
        );
      } else {
        throw Exception("Request failed: ${e.message}");
      }
    } on SocketException catch (e) {
      throw Exception("No Internet connection: ${e.message}");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
