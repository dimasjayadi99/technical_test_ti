import 'package:json_annotation/json_annotation.dart';

part 'chapter_model.g.dart';

@JsonSerializable()
class ChapterModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "coursesId")
  final List<CoursesId> coursesId;
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @JsonKey(name: "lesson")
  final List<CoursesId> lesson;
  @JsonKey(name: "title")
  final String title;

  ChapterModel({
    required this.id,
    required this.coursesId,
    required this.createdAt,
    required this.lesson,
    required this.title,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);
}

@JsonSerializable()
class CoursesId {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "title")
  final String title;

  CoursesId({
    required this.id,
    required this.title,
  });

  factory CoursesId.fromJson(Map<String, dynamic> json) =>
      _$CoursesIdFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesIdToJson(this);
}
