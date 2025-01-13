import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/repositories/audi_book_repository.dart';

class FetchAudioBook {
  final AudioBookRepository audioBookRepository;

  FetchAudioBook(this.audioBookRepository);

  Future<AudioBookEntity> fetchAudioBook(String id) async {
    return await audioBookRepository.fetchAudioBook(id);
  }
}
