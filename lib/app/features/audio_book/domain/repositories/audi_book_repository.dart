import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';

abstract class AudioBookRepository {
  Future<List<AudioBookEntity>> fetchListAudioBooks();

  Future<AudioBookEntity> fetchAudioBook(String id);
}
