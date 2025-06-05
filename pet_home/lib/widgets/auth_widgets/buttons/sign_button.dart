import 'package:flutter/material.dart';

class SignButton extends StatefulWidget {
  const SignButton({super.key, required this.isLogin, required this.submit});

  final bool isLogin;
  final void Function() submit;

  @override
  State<SignButton> createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.submit,
      child: Text(widget.isLogin ? 'Sign in' : 'Sign up'),
    );
  }
}
