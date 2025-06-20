import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
