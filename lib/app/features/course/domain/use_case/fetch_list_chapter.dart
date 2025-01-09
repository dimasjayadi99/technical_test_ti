import 'package:talent_insider_test/app/features/course/domain/entities/chapter_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';

class FetchListChapter {
  final CourseRepository courseRepository;

  FetchListChapter(this.courseRepository);

  Future<ChapterEntity> fetchListChapter(String id) async {
    return courseRepository.fetchListChapter(id);
  }
}
