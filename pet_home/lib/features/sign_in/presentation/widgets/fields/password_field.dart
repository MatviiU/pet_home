import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/sign_in/presentation/bloc/sign_in_bloc.dart';

class SignInPasswordField extends StatefulWidget {
  const SignInPasswordField({super.key});

  @override
  State<SignInPasswordField> createState() => _SignInPasswordFieldState();
}

class _SignInPasswordFieldState extends State<SignInPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final password = context.select((SignInBloc bloc) => bloc.state.password);
    return TextFormField(
      onChanged: (password) {
        context.read<SignInBloc>().add(SignInPasswordChanged(password));
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
