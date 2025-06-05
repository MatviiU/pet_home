import 'package:flutter/material.dart';

class RepeatPasswordField extends StatefulWidget {
  const RepeatPasswordField({
    super.key,
    required this.controller,
    required this.isLogin, required this.newPassword,
  });

  final TextEditingController controller;
  final bool isLogin;
  final String newPassword;

  @override
  State<RepeatPasswordField> createState() => _RepeatPasswordFieldState();
}

class _RepeatPasswordFieldState extends State<RepeatPasswordField> {
  var _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: 'Repeat password',
        hintText: 'Repeat your password',
        suffixIcon: IconButton(
          onPressed: _toggleObscure,
          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validator: (password) => _validatePassword(password),
    );
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  String? _validatePassword(String? password) {
    if (!widget.isLogin) {
      if (password == null ||
          password.isEmpty ||
          password.length < 8 ||
          password.length > 16) {
        return 'Password must be between 8 and 16\n '
            'symbols long and contain at least one\n '
            'uppercase letter, one lowercase letter, one\n '
            'number and one special symbol';
      }
      if (password != widget.newPassword) {
        return 'Passwords do not match';
      }
    }
    return null;
  }
}
