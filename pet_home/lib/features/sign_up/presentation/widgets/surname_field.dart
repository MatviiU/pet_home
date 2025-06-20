import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';

class SurnameField extends StatelessWidget {
  const SurnameField({super.key});

  @override
  Widget build(BuildContext context) {
    final surname = context.select((SignUpBloc bloc) => bloc.state.surname);
    return TextFormField(
      onChanged: (surname) {
        context.read<SignUpBloc>().add(SignUpSurnameChanged(surname));
      },
      decoration: InputDecoration(
        labelText: 'Surname',
        hintText: 'Enter your surname',
        errorText: surname.isPure ? null : surname.error,
      ),
    );
  }
}
