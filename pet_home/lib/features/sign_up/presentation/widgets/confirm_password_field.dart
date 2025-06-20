import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({super.key});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final confirmPassword = context.select(
      (SignUpBloc bloc) => bloc.state.confirmPassword,
    );
    return TextFormField(
      onChanged: (password) {
        context.read<SignUpBloc>().add(
          SignUpConfirmPasswordChanged(password),
        );
      },
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Confirm password',
        hintText: 'Confirm your password',
        errorText: confirmPassword.isPure ? null : confirmPassword.error,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
