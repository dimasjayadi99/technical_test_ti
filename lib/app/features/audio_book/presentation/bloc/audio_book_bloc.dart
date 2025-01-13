import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/entities/audio_book_entity.dart';
import 'package:talent_insider_test/app/features/audio_book/domain/use_cases/fetch_list_audio_books.dart';

part 'audio_book_state.dart';

class AudioBookBloc extends Cubit<AudioBookState> {
  final FetchListAudioBooks fetchListAudioBooks;

  AudioBookBloc({required this.fetchListAudioBooks})
      : super(AudioBookInitState());

  Future<void> listAudioBooks() async {
    emit(AudioBookLoadingState());
    try {
      final response = await fetchListAudioBooks.fetchListAudioBooks();
      emit(AudioBookSuccessState(response));
    } catch (e) {
      rethrow;
    }
  }
}
