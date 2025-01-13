// audio_book_detail_event.dart
part of 'audio_book_detail_bloc.dart';

abstract class AudioBookDetailEvent extends Equatable {
  const AudioBookDetailEvent();

  @override
  List<Object> get props => [];
}

// class OnPlayPause extends AudioBookDetailEvent {
//   final bool isPlaying;
//
//   const OnPlayPause({required this.isPlaying});
//
//   @override
//   List<Object> get props => [isPlaying];
// }
//
// class OnSeekAudio extends AudioBookDetailEvent {
//   final Duration duration;
//
//   const OnSeekAudio({required this.duration});
//
//   @override
//   List<Object> get props => [duration];
// }

class OnFetchData extends AudioBookDetailEvent {
  final String id;

  const OnFetchData({required this.id});

  @override
  List<Object> get props => [id];
}
