import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/chapter_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/course_entity.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_detail_course.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_list_chapter.dart';

part 'course_detail_state.dart';

class CourseDetailBloc extends Cubit<CourseDetailState> {
  final FetchDetailCourse fetchCourseDetail;
  final FetchListChapter fetchListChapter;

  CourseDetailBloc(
      {required this.fetchCourseDetail, required this.fetchListChapter})
      : super(CourseDetailInitState());

  Future<void> fetchDetailBloc(String id) async {
    emit(CourseDetailLoadingState());
    try {
      final response = await fetchCourseDetail.fetchDetailCourse(id);
      final chapters = await Future.wait(
        response.chapterIds.map((id) => fetchListChapter.fetchListChapter(id)),
      );
      emit(CourseDetailSuccessState(response, chapters));
    } catch (e) {
      CourseDetailFailedState(e.toString());
      rethrow;
    }
  }
}
