import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';

class FetchListCourse {
  final CourseRepository courseRepository;

  FetchListCourse(this.courseRepository);

  Future<List<CourseEntity>> fetchListCourse() async {
    return await courseRepository.fetchListCourse();
  }
}
