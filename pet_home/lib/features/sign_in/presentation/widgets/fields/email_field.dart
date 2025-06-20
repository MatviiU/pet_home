import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_in/presentation/bloc/sign_in_bloc.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final email = context.select((SignInBloc bloc) => bloc.state.email);

    return TextFormField(
      onChanged: (email) {
        context.read<SignInBloc>().add(SignInEmailChanged(email));
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        errorText: email.isPure ? null : email.error,
      ),
    );
  }
}
