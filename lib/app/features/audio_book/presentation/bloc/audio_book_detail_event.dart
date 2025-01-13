part of 'audio_book_detail_bloc.dart';

abstract class AudioBookDetailEvent extends Equatable {
  const AudioBookDetailEvent();

  @override
  List<Object> get props => [];
}

class OnFetchData extends AudioBookDetailEvent {
  final String id;

  const OnFetchData({required this.id});

  @override
  List<Object> get props => [id];
}

class PlayAudio extends AudioBookDetailEvent {}

class PauseAudio extends AudioBookDetailEvent {}

class SeekAudio extends AudioBookDetailEvent {
  final Duration position;

  const SeekAudio({required this.position});

  @override
  List<Object> get props => [position];
}

class UpdatePosition extends AudioBookDetailEvent {
  final Duration position;

  const UpdatePosition({required this.position});

  @override
  List<Object> get props => [position];
}

class UpdateDuration extends AudioBookDetailEvent {
  final Duration duration;

  const UpdateDuration({required this.duration});

  @override
  List<Object> get props => [duration];
}

class AudioComplete extends AudioBookDetailEvent {}
