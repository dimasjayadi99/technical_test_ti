import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/core/consts/path.dart';
import 'package:talent_insider_test/app/core/shared/custom_button.dart';
import 'package:talent_insider_test/app/core/shared/custom_divider.dart';
import 'package:talent_insider_test/app/core/shared/custom_text_field.dart';
import 'package:talent_insider_test/app/core/shared/gap.dart';
import '../../../../core/dependency/injection_container.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> form = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: SafeArea(
        child: Form(
          key: form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(PathConst.logoPath)),
              const Gap.v(h: 100),
              Text('Welcome Back',
                  style: Theme.of(context).textTheme.displayMedium),
              const Gap.v(h: 8),
              Text('Login to your account',
                  style: Theme.of(context).textTheme.bodyLarge),
              const Gap.v(h: 40),
              Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
              const Gap.v(h: 12),
              CustomTextField().generalForm('Enter Work E-Mail', 'Email',
                  Icons.email, _emailController, TextInputType.emailAddress),
              const Gap.v(h: 24),
              Text('Password', style: Theme.of(context).textTheme.bodyLarge),
              const Gap.v(h: 12),
              CustomTextField().passwordForm('Enter Password', 'Password',
                  Icons.lock, _passwordController),
              const Gap.v(h: 40),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.pushReplacementNamed(context, '/main');
                  } else if (state is LoginFailedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomButton().fillButton(context, 'Log In', () {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    if (form.currentState!.validate()) {
                      context
                          .read<LoginBloc>()
                          .add(PostLogin(email: email, password: password));
                    }
                  });
                },
              ),
              const Gap.v(h: 16),
              Row(
                children: [
                  Expanded(child: CustomDivider().basicDivider()),
                  const Gap.h(w: 16),
                  const Text('Or'),
                  const Gap.h(w: 16),
                  Expanded(child: CustomDivider().basicDivider()),
                ],
              ),
              const Gap.v(h: 16),
              CustomButton()
                  .outlineButton(context, 'Explore Without Login', () {}),
            ],
          ),
        ),
      ),
    );
  }
}
