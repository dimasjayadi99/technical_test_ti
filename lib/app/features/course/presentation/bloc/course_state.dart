part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  @override
  List<Object> get props => [];
}

class CourseInitState extends CourseState {}

class CourseLoadingState extends CourseState {}

class CourseSuccessState extends CourseState {
  final List<CourseEntity> list;

  CourseSuccessState(this.list);

  @override
  List<Object> get props => [list];
}

class CourseFailedState extends CourseState {
  final String message;

  CourseFailedState(this.message);

  @override
  List<Object> get props => [message];
}
