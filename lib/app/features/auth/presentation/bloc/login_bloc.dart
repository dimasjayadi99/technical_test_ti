import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/core/helpers/shared_prefs_helper.dart';
import 'package:talent_insider_test/app/features/auth/domain/use_cases/login_auth.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/dependency/injection_container.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginAuth loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitState()) {
    on<PostLogin>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final response = await loginUseCase.loginWithEmailPassword(
            event.email, event.password);
        final prefs = sl<SharedPrefsHelper>();
        await prefs.setToken(response.token);
        emit(LoginSuccessState());
      } catch (e) {
        emit(LoginFailedState(e.toString()));
      }
    });
  }
}
