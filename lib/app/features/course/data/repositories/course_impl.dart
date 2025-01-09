import 'package:talent_insider_test/app/core/mapper/course_mapper.dart';
import 'package:talent_insider_test/app/features/course/data/data_source/course_service.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';

class CourseImpl extends CourseRepository {
  final CourseService courseService;
  final CourseMapper courseMapper;

  CourseImpl({required this.courseService, required this.courseMapper});

  @override
  Future<CourseEntity> fetchDetailCourse(String id) async {
    try {
      final response = await courseService.fetchDetailCourse(id);
      final data = courseMapper.toCourse(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CourseEntity>> fetchListCourse() async {
    try {
      final response = await courseService.fetchListCourse();
      final data = courseMapper.toCourses(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
