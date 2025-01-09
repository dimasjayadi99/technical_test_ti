import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_entity.freezed.dart';

@freezed
class ChapterEntity with _$ChapterEntity {
  factory ChapterEntity({
    required String title,
    required String lessonId,
    required String lessonTitle,
  }) = _ChapterEntity;
}
