import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talent_insider_test/app/features/course/data/models/chapter_model.dart';
import 'package:talent_insider_test/app/features/course/data/models/course_model.dart';
import 'package:talent_insider_test/app/features/course/data/models/lesson_model.dart';
import '../../../../config/api_config.dart';
import '../../../../core/exceptions/network_exception.dart';

class CourseService {
  final Dio dio;

  CourseService()
      : dio = Dio(BaseOptions(
            baseUrl: ApiConfig.baseUrl, receiveDataWhenStatusError: true));

  /// fetch List Courses
  Future<List<CourseModel>> fetchListCourse() async {
    try {
      final response = await dio.get(
        '/courses',
        queryParameters: {
          r'$lookup': '*',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as List;

        final courses = data
            .map((item) => CourseModel.fromJson(item as Map<String, dynamic>))
            .toList();

        return courses;
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

  /// fetch detail Course
  Future<CourseModel> fetchDetailCourse(String id) async {
    try {
      final response = await dio.get(
        '/courses/$id',
        queryParameters: {
          r'$lookup': '*',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return CourseModel.fromJson(data);
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

  /// fetch chapter
  Future<ChapterModel> fetchChapter(String id) async {
    try {
      final response = await dio.get(
        '/chapter/$id',
        queryParameters: {
          r'$lookup': '*',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return ChapterModel.fromJson(data);
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

  /// fetch chapter
  Future<LessonModel> fetchLesson(String id) async {
    try {
      final response = await dio.get(
        '/lesson/$id',
        queryParameters: {
          r'$lookup': '*',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return LessonModel.fromJson(data);
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
