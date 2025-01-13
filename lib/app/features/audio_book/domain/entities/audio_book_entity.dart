import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_book_entity.freezed.dart';

@freezed
class AudioBookEntity with _$AudioBookEntity {
  factory AudioBookEntity({
    required String id,
    required String artist,
    required String language,
    required String description,
    required String createdAt,
    required String isPremium,
    required String fileNameAudio,
    required String urlAudio,
    required String fileNameThumb,
    required String urlThumb,
    required String title,
  }) = _AudioBookEntity;
}
