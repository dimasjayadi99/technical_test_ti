part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostLogin extends LoginEvent {
  final String email;
  final String password;

  PostLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
