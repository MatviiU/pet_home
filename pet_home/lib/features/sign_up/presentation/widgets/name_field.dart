import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          onChanged: (name) {
            context.read<SignUpBloc>().add(SignUpNameChanged(name));
          },
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'Enter your name',
            errorText:
                state.name.isNotValid && !state.name.isPure
                    ? state.name.error
                    : null,
          ),
        );
      },
    );
  }
}
