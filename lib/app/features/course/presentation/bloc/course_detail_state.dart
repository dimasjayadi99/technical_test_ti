part of 'course_detail_bloc.dart';

abstract class CourseDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class CourseDetailInitState extends CourseDetailState {}

class CourseDetailLoadingState extends CourseDetailState {}

class CourseDetailSuccessState extends CourseDetailState {
  final CourseEntity data;
  final List<ChapterEntity> chapter;

  CourseDetailSuccessState(this.data, this.chapter);

  @override
  List<Object> get props => [data, chapter];
}

class CourseDetailFailedState extends CourseDetailState {
  final String message;

  CourseDetailFailedState(this.message);

  @override
  List<Object> get props => [message];
}
