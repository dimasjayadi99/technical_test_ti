import 'dart:io';
import 'package:dio/dio.dart';
import 'package:talent_insider_test/app/features/audio_book/data/models/audio_book_model.dart';
import '../../../../../config/api_config.dart';
import '../../../../../core/exceptions/network_exception.dart';

class AudioBookService {
  final Dio dio;

  AudioBookService()
      : dio = Dio(BaseOptions(
            baseUrl: ApiConfig.baseUrl, receiveDataWhenStatusError: true));

  /// fetch list audio book
  Future<List<AudioBookModel>> fetchListAudiBooks() async {
    try {
      final response = await dio.get(
        '/audio/?',
        queryParameters: {
          r'$lookup': '*',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as List;

        final audio = data
            .map(
                (item) => AudioBookModel.fromJson(item as Map<String, dynamic>))
            .toList();

        return audio;
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

  /// fetch audio book
  Future<AudioBookModel> fetchAudiBook(String id) async {
    try {
      final response = await dio.get(
        '/audio/$id',
        queryParameters: {
          r'$lookup': '*',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AudioBookModel.fromJson(response.data);
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
