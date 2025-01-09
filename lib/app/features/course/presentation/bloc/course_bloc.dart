import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_list_course.dart';

part 'course_state.dart';

class CourseBloc extends Cubit<CourseState> {
  final FetchListCourse fetchListCourse;

  CourseBloc({required this.fetchListCourse}) : super(CourseInitState());

  Future<void> fetchList() async {
    emit(CourseLoadingState());
    try {
      final response = await fetchListCourse.fetchListCourse();
      emit(CourseSuccessState(response));
    } catch (e) {
      CourseFailedState(e.toString());
      rethrow;
    }
  }
}
