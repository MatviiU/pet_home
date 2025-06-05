import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot password?',
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
