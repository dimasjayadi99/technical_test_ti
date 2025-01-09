import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_entity.freezed.dart';

@freezed
class LessonEntity with _$LessonEntity {
  factory LessonEntity({
    required String fileName,
    required String filePath,
  }) = _LessonEntity;
}
