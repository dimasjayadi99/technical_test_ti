import 'package:talent_insider_test/app/features/course/data/models/course_model.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';

class CourseMapper {
  CourseEntity toCourse(CourseModel data) {
    try {
      return CourseEntity(
        id: data.id,
        author: data.author,
        category: data.category,
        chapterIds: data.chapter.map((ch) => ch.id).toList(),
        chapterTitles: data.chapter.map((ch) => ch.title).toList(),
        createdAt: data.createdAt,
        pathFileNames: data.path.map((p) => p.fileName).toList(),
        pathUrls: data.path.map((p) => p.url).toList(),
        title: data.title,
      );
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
  }

  List<CourseEntity> toCourses(List<CourseModel> dataList) {
    final List<CourseEntity> list = [];
    try {
      for (var entity in dataList) {
        list.add(toCourse(entity));
      }
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }

    return list;
  }
}
