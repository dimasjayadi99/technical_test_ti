import 'package:talent_insider_test/app/core/mapper/chapter_mapper.dart';
import 'package:talent_insider_test/app/core/mapper/course_mapper.dart';
import 'package:talent_insider_test/app/features/course/data/data_source/course_service.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/chapter_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';

class CourseImpl extends CourseRepository {
  final CourseService courseService;
  final CourseMapper courseMapper;
  final ChapterMapper chapterMapper;

  CourseImpl(
      {required this.courseService,
      required this.courseMapper,
      required this.chapterMapper});

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

  @override
  Future<ChapterEntity> fetchListChapter(String id) async {
    try {
      final response = await courseService.fetchChapter(id);
      final data = chapterMapper.toChapter(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
