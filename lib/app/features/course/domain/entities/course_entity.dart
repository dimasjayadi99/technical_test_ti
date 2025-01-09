import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_entity.freezed.dart';

@freezed
class CourseEntity with _$CourseEntity {
  factory CourseEntity({
    required String id,
    required String? author,
    required String category,
    required List<String> chapterIds,
    required List<String> chapterTitles,
    required String createdAt,
    required List<String> pathFileNames,
    required List<String> pathUrls,
    required String title,
  }) = _CourseEntity;
}
