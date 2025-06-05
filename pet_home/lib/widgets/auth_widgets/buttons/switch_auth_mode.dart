import 'package:flutter/material.dart';

class SwitchAuthMode extends StatefulWidget {
  const SwitchAuthMode({
    super.key,
    required this.isLogin,
    required this.switchAuthMode,
  });

  final bool isLogin;
  final void Function() switchAuthMode;

  @override
  State<SwitchAuthMode> createState() => _SwitchAuthModeState();
}

class _SwitchAuthModeState extends State<SwitchAuthMode> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.switchAuthMode,
      child: Text(
        widget.isLogin
            ? 'Don\'t have an account?\n Sign up'
            : 'Already have an account?\n Sign in',
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline,),
      ),
    );
  }
}
