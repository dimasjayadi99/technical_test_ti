import 'package:talent_insider_test/app/features/course/data/models/lesson_model.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/lesson_entity.dart';

class LessonMapper {
  LessonEntity toLesson(LessonModel data) {
    try {
      return LessonEntity(
          fileName: data.path.map((item) => item.fileName).join(", "),
          filePath: data.path.map((item) => item.url).join(", "));
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
  }
}
