part of 'audio_book_bloc.dart';

abstract class AudioBookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AudioBookInitState extends AudioBookState {}

class AudioBookLoadingState extends AudioBookState {}

class AudioBookSuccessState extends AudioBookState {
  final List<AudioBookEntity> books;

  AudioBookSuccessState(this.books);

  @override
  List<Object?> get props => [books];
}

class AudioBookFailedState extends AudioBookState {
  final String message;

  AudioBookFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
