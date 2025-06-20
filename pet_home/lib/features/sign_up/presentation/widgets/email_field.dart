import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final email = context.select((SignUpBloc bloc) => bloc.state.email);

    return TextFormField(
      onChanged: (email) {
        context.read<SignUpBloc>().add(SignUpEmailChanged(email));
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        errorText: email.isPure ? null : email.error,
      ),
    );
  }
}
