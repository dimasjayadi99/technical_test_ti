// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: json['_id'] as String,
      author: json['author'] as String?,
      category: json['category'] as String,
      chapter: (json['chapter'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      path: (json['path'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'chapter': instance.chapter,
      'createdAt': instance.createdAt,
      'path': instance.path,
      'title': instance.title,
    };

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

Path _$PathFromJson(Map<String, dynamic> json) => Path(
      fileName: json['fileName'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'url': instance.url,
    };
