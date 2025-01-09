import '../../features/course/data/models/chapter_model.dart';
import '../../features/course/domain/entities/chapter_entity.dart';

class ChapterMapper {
  ChapterEntity toChapter(ChapterModel data) {
    try {
      return ChapterEntity(
        title: data.title,
        lessonId: data.lesson.map((item) => item.id).join(', '),
        lessonTitle: data.lesson.map((item) => item.title).join(', '),
      );
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
  }

// List<ChapterEntity> toChapters(List<ChapterModel> dataList) {
//   final List<CourseEntity> list = [];
//   try {
//     for (var entity in dataList) {
//       list.add(toCourse(entity));
//     }
//   } catch (e) {
//     throw Exception('Failed to mapping data : $e');
//   }
//
//   return list;
// }
}
