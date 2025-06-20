import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
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
                    context.read<SignUpBloc>().add(SignUpSubmitted());
                  }
                  : null,
          child: const Text('Sign up'),
        );
      },
    );
  }
}
