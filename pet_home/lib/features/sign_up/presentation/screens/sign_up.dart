import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pet_home/core/router/app_router.dart';
import 'package:pet_home/core/widgets/buttons/switch_auth_mode.dart';
import 'package:pet_home/features/auth/data/repositories/auth_repository.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';
import 'package:pet_home/features/sign_up/presentation/widgets/buttons/sign_up_button.dart';
import 'package:pet_home/features/sign_up/presentation/widgets/confirm_password_field.dart';
import 'package:pet_home/features/sign_up/presentation/widgets/email_field.dart';
import 'package:pet_home/features/sign_up/presentation/widgets/name_field.dart';
import 'package:pet_home/features/sign_up/presentation/widgets/password_field.dart';
import 'package:pet_home/features/sign_up/presentation/widgets/surname_field.dart';

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
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const SizedBox spacer = SizedBox(height: 20);
    final registrationWidgets = <Widget>[
      Image.asset('assets/images/app_logo.jpg', width: 200, height: 200),
      Text(
        'Registration',
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      NameField(),
      SurnameField(),
      SignUpEmailField(),
      SignUpPasswordField(),
      ConfirmPasswordField(),
      Center(child: SignUpButton()),
      SwitchAuthMode(
        prefixText: 'Already have an account? ',
        linkText: 'Sign in',
        onTap: () => context.router.replace(const SignInRoute()),
      ),
    ];
    return Scaffold(
      body: BlocProvider(
        create:
            (context) =>
                SignUpBloc(authRepository: context.read<AuthRepository>()),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [...registrationWidgets.intersperse(spacer)],
          ),
        ),
      ),
    );
  }
}
