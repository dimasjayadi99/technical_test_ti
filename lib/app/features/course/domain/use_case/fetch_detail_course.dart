import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';

class FetchDetailCourse {
  final CourseRepository courseRepository;

  FetchDetailCourse(this.courseRepository);

  Future<CourseEntity> fetchDetailCourse(String id) async {
    return await courseRepository.fetchDetailCourse(id);
  }
}
