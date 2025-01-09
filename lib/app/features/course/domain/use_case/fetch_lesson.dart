import 'package:talent_insider_test/app/features/course/domain/entities/lesson_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';

class FetchLesson {
  final CourseRepository courseRepository;

  FetchLesson(this.courseRepository);

  Future<LessonEntity> fetchLesson(String id) async {
    return courseRepository.fetchLesson(id);
  }
}
