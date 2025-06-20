import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:formz/formz.dart';
import 'package:pet_home/core/router/app_router.dart';
import 'package:pet_home/core/widgets/buttons/switch_auth_mode.dart';
import 'package:pet_home/features/auth/data/repositories/auth_repository.dart';
import 'package:pet_home/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:pet_home/features/sign_in/presentation/widgets/buttons/forgot_password_button.dart';
import 'package:pet_home/features/sign_in/presentation/widgets/buttons/sign_in_button.dart';
import 'package:pet_home/features/sign_in/presentation/widgets/buttons/social_login_button.dart';
import 'package:pet_home/features/sign_in/presentation/widgets/fields/email_field.dart';
import 'package:pet_home/features/sign_in/presentation/widgets/fields/password_field.dart';

extension IntersperseExtension<T> on Iterable<T> {
  Iterable<T> intersperse(T element) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const SizedBox spacer = SizedBox(height: 20);
    final loginWidgets = <Widget>[
      Image.asset('assets/images/app_logo.jpg', width: 200, height: 200),
      Text(
        'Login',
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      SignInEmailField(),
      SignInPasswordField(),
      ForgotPasswordButton(onPressed: () {}),
      Center(child: SignInButton()),
      SwitchAuthMode(
        prefixText: 'Don\'t have an account? ',
        linkText: 'Sign up',
        onTap: () => context.router.replace(const SignUpRoute()),
      ),
      SocialLoginButton(),
    ];

    return Scaffold(
      body: BlocProvider(
        create:
            (context) =>
                SignInBloc(authRepository: context.read<AuthRepository>()),
        child: BlocListener<SignInBloc, SignInState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status.isFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage ?? 'Authentication failed',
                    ),
                  ),
                );
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [...loginWidgets.intersperse(spacer)],
            ),
          ),
        ),
      ),
    );
  }
}
