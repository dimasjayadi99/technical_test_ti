import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/chapter_entity.dart';

abstract class CourseRepository {
  Future<List<CourseEntity>> fetchListCourse();

  Future<CourseEntity> fetchDetailCourse(String id);

  Future<ChapterEntity> fetchListChapter(String id);
}
