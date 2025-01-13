import 'package:json_annotation/json_annotation.dart';

part 'audio_book_model.g.dart';

@JsonSerializable()
class AudioBookModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "artist")
  final String artist;
  @JsonKey(name: "createdAt")
  final String createdAt;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "isPremium")
  final String isPremium;
  @JsonKey(name: "languange")
  final String languange;
  @JsonKey(name: "path")
  final List<Path> path;
  @JsonKey(name: "thumbnail")
  final List<Path> thumbnail;
  @JsonKey(name: "time")
  final dynamic time;
  @JsonKey(name: "title")
  final String title;

  AudioBookModel({
    required this.id,
    required this.artist,
    required this.createdAt,
    required this.description,
    required this.isPremium,
    required this.languange,
    required this.path,
    required this.thumbnail,
    required this.time,
    required this.title,
  });

  factory AudioBookModel.fromJson(Map<String, dynamic> json) =>
      _$AudioBookModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioBookModelToJson(this);
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
