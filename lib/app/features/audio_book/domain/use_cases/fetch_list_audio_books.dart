import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/repositories/audi_book_repository.dart';

class FetchListAudioBooks {
  final AudioBookRepository audioBookRepository;

  FetchListAudioBooks(this.audioBookRepository);

  Future<List<AudioBookEntity>> fetchListAudioBooks() async {
    return await audioBookRepository.fetchListAudioBooks();
  }
}
