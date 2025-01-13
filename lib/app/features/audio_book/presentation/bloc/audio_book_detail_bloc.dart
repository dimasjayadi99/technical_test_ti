import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../domain/entities/audio_book_entity.dart';
import '../../domain/use_cases/fetch_audio_book.dart';

part 'audio_book_detail_event.dart';

part 'audio_book_detail_state.dart';

class AudioBookDetailBloc
    extends Bloc<AudioBookDetailEvent, AudioBookDetailState> {
  final FetchAudioBook fetchAudioBook;
  final AudioPlayer _audioPlayer = AudioPlayer();

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<void>? _completionSubscription;

  AudioBookEntity? _currentData;

  AudioBookDetailBloc({required this.fetchAudioBook})
      : super(AudioBookDetailInitState()) {
    on<OnFetchData>(_onFetchData);
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
    on<SeekAudio>(_onSeekAudio);
    on<UpdatePosition>(_onUpdatePosition);
    on<UpdateDuration>(_onUpdateDuration);
    on<AudioComplete>(_onAudioComplete);

    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      add(UpdatePosition(position: position));
    });

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      add(UpdateDuration(duration: duration));
    });

    _completionSubscription = _audioPlayer.onPlayerComplete.listen((_) {
      add(AudioComplete());
    });
  }

  Future<void> _onFetchData(
      OnFetchData event, Emitter<AudioBookDetailState> emit) async {
    emit(AudioBookDetailLoadingState());
    try {
      final response = await fetchAudioBook.fetchAudioBook(event.id);
      _currentData = response;
      emit(AudioBookDetailSuccessState(data: response));
    } catch (e) {
      emit(AudioBookDetailFailedState(message: e.toString()));
    }
  }

  Future<void> _onPlayAudio(
      PlayAudio event, Emitter<AudioBookDetailState> emit) async {
    if (_currentData == null) return;

    await _audioPlayer.play(UrlSource(_currentData!.urlAudio));

    final position = await _audioPlayer.getCurrentPosition() ?? Duration.zero;
    final duration = await _audioPlayer.getDuration() ?? Duration.zero;

    emit(AudioPlayingState(
      data: _currentData!,
      position: position,
      duration: duration,
    ));
  }

  Future<void> _onPauseAudio(
      PauseAudio event, Emitter<AudioBookDetailState> emit) async {
    await _audioPlayer.pause();
    if (state is AudioPlayingState) {
      final currentState = state as AudioPlayingState;
      emit(AudioPausedState(
        data: currentState.data,
        position: currentState.position,
        duration: currentState.duration,
      ));
    }
  }

  Future<void> _onSeekAudio(
      SeekAudio event, Emitter<AudioBookDetailState> emit) async {
    await _audioPlayer.seek(event.position);
  }

  void _onUpdatePosition(
      UpdatePosition event, Emitter<AudioBookDetailState> emit) {
    if (state is AudioPlayingState) {
      emit(AudioPlayingState(
        data: (state as AudioPlayingState).data,
        position: event.position,
        duration: (state as AudioPlayingState).duration,
      ));
    } else if (state is AudioPausedState) {
      emit(AudioPausedState(
        data: (state as AudioPausedState).data,
        position: event.position,
        duration: (state as AudioPausedState).duration,
      ));
    }
  }

  void _onUpdateDuration(
      UpdateDuration event, Emitter<AudioBookDetailState> emit) {
    if (state is AudioPlayingState) {
      emit(AudioPlayingState(
        data: (state as AudioPlayingState).data,
        position: (state as AudioPlayingState).position,
        duration: event.duration,
      ));
    } else if (state is AudioPausedState) {
      emit(AudioPausedState(
        data: (state as AudioPausedState).data,
        position: (state as AudioPausedState).position,
        duration: event.duration,
      ));
    }
  }

  void _onAudioComplete(
      AudioComplete event, Emitter<AudioBookDetailState> emit) {
    if (_currentData == null) return;
    emit(AudioPausedState(
      data: _currentData!,
      position: Duration.zero,
      duration: Duration.zero,
    ));
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _completionSubscription?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
