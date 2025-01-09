part of 'lesson_bloc.dart';

abstract class LessonState extends Equatable {
  @override
  List<Object> get props => [];
}

class LessonInitState extends LessonState {}

class LessonLoadingState extends LessonState {}

class LessonSuccessState extends LessonState {
  final LessonEntity lesson;

  LessonSuccessState(this.lesson);

  @override
  List<Object> get props => [lesson];
}

class LessonFailedState extends LessonState {
  final String message;

  LessonFailedState(this.message);

  @override
  List<Object> get props => [message];
}
