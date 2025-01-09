import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_detail_course.dart';

part 'course_detail_state.dart';

class CourseDetailBloc extends Cubit<CourseDetailState> {
  final FetchDetailCourse fetchCourseDetail;

  CourseDetailBloc({required this.fetchCourseDetail})
      : super(CourseDetailInitState());

  Future<void> fetchDetailBloc(String id) async {
    emit(CourseDetailLoadingState());
    try {
      final response = await fetchCourseDetail.fetchDetailCourse(id);
      emit(CourseDetailSuccessState(response));
    } catch (e) {
      CourseDetailFailedState(e.toString());
      rethrow;
    }
  }
}
