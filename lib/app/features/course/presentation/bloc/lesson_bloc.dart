import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_lesson.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/lesson_entity.dart';

part 'lesson_state.dart';

class LessonBloc extends Cubit<LessonState> {
  final FetchLesson fetchLesson;

  LessonBloc({required this.fetchLesson}) : super(LessonInitState());

  Future<void> fetchData(String id) async {
    emit(LessonLoadingState());
    try {
      final response = await fetchLesson.fetchLesson(id);
      emit(LessonSuccessState(response));
    } catch (e) {
      LessonFailedState(e.toString());
      rethrow;
    }
  }
}
