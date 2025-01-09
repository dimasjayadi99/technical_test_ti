import 'package:json_annotation/json_annotation.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
class LessonModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "chapterId")
  final List<ChapterId> chapterId;
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @JsonKey(name: "path")
  final List<Path> path;
  @JsonKey(name: "title")
  final String title;

  LessonModel({
    required this.id,
    required this.chapterId,
    required this.createdAt,
    required this.path,
    required this.title,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}

@JsonSerializable()
class ChapterId {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "title")
  final String title;

  ChapterId({
    required this.id,
    required this.title,
  });

  factory ChapterId.fromJson(Map<String, dynamic> json) =>
      _$ChapterIdFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterIdToJson(this);
}

@JsonSerializable()
class Path {
  @JsonKey(name: "fileName")
  final String fileName;
  @JsonKey(name: "url")
  final String url;

  Path({
    required this.fileName,
    required this.url,
  });

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);

  Map<String, dynamic> toJson() => _$PathToJson(this);
}
