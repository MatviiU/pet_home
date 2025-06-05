import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});


  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  var _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Zapamiętaj mnie',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Checkbox(
          value: _rememberMe,
          onChanged: _toggleRememberMe,
        ),
      ],
    );
  }

  void _toggleRememberMe(value) {
    setState(() {
      _rememberMe = !_rememberMe;
    });
  }
}
