// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) => ChapterModel(
      id: json['_id'] as String,
      coursesId: (json['coursesId'] as List<dynamic>)
          .map((e) => CoursesId.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lesson: (json['lesson'] as List<dynamic>)
          .map((e) => CoursesId.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ChapterModelToJson(ChapterModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'coursesId': instance.coursesId,
      'createdAt': instance.createdAt.toIso8601String(),
      'lesson': instance.lesson,
      'title': instance.title,
    };

CoursesId _$CoursesIdFromJson(Map<String, dynamic> json) => CoursesId(
      id: json['_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$CoursesIdToJson(CoursesId instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };
