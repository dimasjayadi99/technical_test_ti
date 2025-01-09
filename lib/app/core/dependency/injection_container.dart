import 'package:get_it/get_it.dart';
import 'package:talent_insider_test/app/core/helpers/shared_prefs_helper.dart';
import 'package:talent_insider_test/app/core/mapper/chapter_mapper.dart';
import 'package:talent_insider_test/app/core/mapper/course_mapper.dart';
import 'package:talent_insider_test/app/core/mapper/lesson_mapper.dart';
import 'package:talent_insider_test/app/core/mapper/user_mapper.dart';
import 'package:talent_insider_test/app/features/auth/data/data_source/remote/auth_services.dart';
import 'package:talent_insider_test/app/features/auth/data/repositories/auth_impl.dart';
import 'package:talent_insider_test/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:talent_insider_test/app/features/auth/domain/use_cases/login_auth.dart';
import 'package:talent_insider_test/app/features/course/data/data_source/course_service.dart';
import 'package:talent_insider_test/app/features/course/data/repositories/course_impl.dart';
import 'package:talent_insider_test/app/features/course/domain/repositories/course_repository.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_detail_course.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_lesson.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_list_chapter.dart';
import 'package:talent_insider_test/app/features/course/domain/use_case/fetch_list_course.dart';
import 'package:talent_insider_test/app/features/course/presentation/bloc/course_bloc.dart';
import 'package:talent_insider_test/app/features/course/presentation/bloc/course_detail_bloc.dart';
import 'package:talent_insider_test/app/features/course/presentation/bloc/lesson_bloc.dart';
import '../../features/auth/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  // helper
  sl.registerSingletonAsync<SharedPrefsHelper>(
      () async => await SharedPrefsHelper.init());

  // service
  sl.registerLazySingleton<AuthService>(() => AuthService());
  sl.registerLazySingleton<CourseService>(() => CourseService());

  // mapper
  sl.registerLazySingleton<UserMapper>(() => UserMapper());
  sl.registerLazySingleton<CourseMapper>(() => CourseMapper());
  sl.registerLazySingleton<ChapterMapper>(() => ChapterMapper());
  sl.registerLazySingleton<LessonMapper>(() => LessonMapper());

  // repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthImpl(authService: sl(), userMapper: sl()));
  sl.registerLazySingleton<CourseRepository>(() => CourseImpl(
      courseService: sl(),
      courseMapper: sl(),
      chapterMapper: sl(),
      lessonMapper: sl()));

  // use case
  sl.registerLazySingleton<LoginAuth>(() => LoginAuth(sl()));
  sl.registerLazySingleton<FetchListCourse>(() => FetchListCourse(sl()));
  sl.registerLazySingleton<FetchDetailCourse>(() => FetchDetailCourse(sl()));
  sl.registerLazySingleton<FetchListChapter>(() => FetchListChapter(sl()));
  sl.registerLazySingleton<FetchLesson>(() => FetchLesson(sl()));

  // Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => CourseBloc(fetchListCourse: sl()));
  sl.registerFactory(() => LessonBloc(fetchLesson: sl()));
  sl.registerFactory(
      () => CourseDetailBloc(fetchCourseDetail: sl(), fetchListChapter: sl()));
}
