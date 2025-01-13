import 'package:talent_insider_test/app/core/mapper/audi_book_mapper.dart';
import 'package:talent_insider_test/app/features/audio_book/data/data_sources/remote/audio_book_service.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/repositories/audi_book_repository.dart';

class AudioBookImpl extends AudioBookRepository {
  final AudioBookService audioBookService;
  final AudioMapper audioMapper;

  AudioBookImpl({required this.audioBookService, required this.audioMapper});

  @override
  Future<AudioBookEntity> fetchAudioBook(String id) async {
    try {
      final response = await audioBookService.fetchAudiBook(id);
      final data = audioMapper.toAudioBook(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AudioBookEntity>> fetchListAudioBooks() async {
    try {
      final response = await audioBookService.fetchListAudiBooks();
      final data = audioMapper.toAudioBooks(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
