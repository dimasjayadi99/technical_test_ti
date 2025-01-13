// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioBookModel _$AudioBookModelFromJson(Map<String, dynamic> json) =>
    AudioBookModel(
      id: json['_id'] as String,
      artist: json['artist'] as String,
      createdAt: json['createdAt'] as String,
      description: json['description'] as String,
      isPremium: json['isPremium'] as String,
      languange: json['languange'] as String,
      path: (json['path'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: (json['thumbnail'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['time'],
      title: json['title'] as String,
    );

Map<String, dynamic> _$AudioBookModelToJson(AudioBookModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'artist': instance.artist,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'isPremium': instance.isPremium,
      'languange': instance.languange,
      'path': instance.path,
      'thumbnail': instance.thumbnail,
      'time': instance.time,
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
