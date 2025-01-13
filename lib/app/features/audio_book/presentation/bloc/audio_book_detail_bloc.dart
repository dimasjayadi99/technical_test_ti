import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/audio_book_entity.dart';
import '../../domain/use_cases/fetch_audio_book.dart';

part 'audio_book_detail_state.dart';

part 'audio_book_detail_event.dart';

class AudioBookDetailBloc
    extends Bloc<AudioBookDetailEvent, AudioBookDetailState> {
  final FetchAudioBook fetchAudioBook;

  AudioBookDetailBloc({required this.fetchAudioBook})
      : super(AudioBookDetailInitState()) {
    on<OnFetchData>(_onFetchData);
  }

  Future<void> _onFetchData(
      OnFetchData event, Emitter<AudioBookDetailState> emit) async {
    emit(AudioBookDetailLoadingState());
    try {
      final response = await fetchAudioBook.fetchAudioBook(event.id);
      emit(
        AudioBookDetailSuccessState(
          data: response,
        ),
      );
    } catch (e) {
      emit(AudioBookDetailFailedState(message: e.toString()));
    }
  }
}
