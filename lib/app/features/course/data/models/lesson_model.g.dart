// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel(
      id: json['_id'] as String,
      chapterId: (json['chapterId'] as List<dynamic>)
          .map((e) => ChapterId.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      path: (json['path'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'chapterId': instance.chapterId,
      'createdAt': instance.createdAt.toIso8601String(),
      'path': instance.path,
      'title': instance.title,
    };

ChapterId _$ChapterIdFromJson(Map<String, dynamic> json) => ChapterId(
      id: json['_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ChapterIdToJson(ChapterId instance) => <String, dynamic>{
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
