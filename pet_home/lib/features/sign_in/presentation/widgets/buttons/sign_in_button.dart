import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pet_home/features/sign_in/presentation/bloc/sign_in_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen:
          (previous, current) =>
              previous.status != current.status ||
              previous.isValid != current.isValid,
      builder: (context, state) {
        if (state.status.isInProgress) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed:
              state.isValid
                  ? () {
                    context.read<SignInBloc>().add(SignInSubmitted());
                  }
                  : null,
          child: const Text('Sign in'),
        );
      },
    );
  }
}
