import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_up/presentation/bloc/sing_up_bloc.dart';

class SignUpPasswordField extends StatefulWidget {
  const SignUpPasswordField({super.key});

  @override
  State<SignUpPasswordField> createState() => _SignUpPasswordFieldState();
}

class _SignUpPasswordFieldState extends State<SignUpPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final password = context.select((SignUpBloc bloc) => bloc.state.password);
    return TextFormField(
      onChanged: (password) {
        context.read<SignUpBloc>().add(SignUpPasswordChanged(password));
      },
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        errorText: password.isPure ? null : password.error,
      ),
    );
  }
}
