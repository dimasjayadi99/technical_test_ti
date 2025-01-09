import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "chapter")
  final List<Chapter> chapter;
  @JsonKey(name: "createdAt")
  final String createdAt;
  @JsonKey(name: "path")
  final List<Path> path;
  @JsonKey(name: "title")
  final String title;

  CourseModel({
    required this.id,
    this.author,
    required this.category,
    required this.chapter,
    required this.createdAt,
    required this.path,
    required this.title,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

@JsonSerializable()
class Chapter {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "title")
  final String title;

  Chapter({
    required this.id,
    required this.title,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
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
