part of 'audio_book_detail_bloc.dart';

abstract class AudioBookDetailState extends Equatable {
  const AudioBookDetailState();

  @override
  List<Object?> get props => [];
}

class AudioBookDetailInitState extends AudioBookDetailState {}

class AudioBookDetailLoadingState extends AudioBookDetailState {}

class AudioBookDetailSuccessState extends AudioBookDetailState {
  final AudioBookEntity data;

  const AudioBookDetailSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class AudioBookDetailFailedState extends AudioBookDetailState {
  final String message;

  const AudioBookDetailFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AudioPlayingState extends AudioBookDetailSuccessState {
  final Duration position;
  final Duration duration;

  const AudioPlayingState({
    required super.data,
    required this.position,
    required this.duration,
  });

  @override
  List<Object?> get props => [data, position, duration];
}

class AudioPausedState extends AudioBookDetailSuccessState {
  final Duration position;
  final Duration duration;

  const AudioPausedState({
    required super.data,
    required this.position,
    required this.duration,
  });

  @override
  List<Object?> get props => [data, position, duration];
}
