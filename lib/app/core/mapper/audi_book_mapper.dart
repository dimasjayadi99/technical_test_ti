import 'package:talent_insider_test/app/features/audio_book/data/models/audio_book_model.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';

class AudioMapper {
  AudioBookEntity toAudioBook(AudioBookModel data) {
    try {
      return AudioBookEntity(
          id: data.id,
          artist: data.artist,
          language: data.languange,
          description: data.description,
          createdAt: data.createdAt,
          isPremium: data.isPremium,
          fileNameAudio: data.path.map((item) => item.fileName).join(", "),
          urlAudio: data.path.map((item) => item.url).join(", "),
          fileNameThumb: data.thumbnail.map((item) => item.fileName).join(", "),
          urlThumb: data.thumbnail.map((item) => item.url).join(", "),
          title: data.title);
    } catch (e) {
      throw Exception('Failed to mapping data');
    }
  }

  List<AudioBookEntity> toAudioBooks(List<AudioBookModel> listData) {
    final List<AudioBookEntity> list = [];

    try {
      for (var entity in listData) {
        list.add(toAudioBook(entity));
      }
    } catch (e) {
      throw Exception('Failed to mapping data');
    }

    return list;
  }
}
