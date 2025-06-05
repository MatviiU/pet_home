import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.isLogin,
    required this.sendNewPassword,
  });

  final TextEditingController controller;
  final bool isLogin;
  final Function(String) sendNewPassword;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _isObscure = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.length >= 8 || widget.controller.text.length <= 16) {
        widget.sendNewPassword(widget.controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
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
    if (widget.isLogin) {
      if (password == null || password.isEmpty || password.length < 8) {
        return 'Password must contain at least 8 characters';
      }
      if (password.length > 16) {
        return 'Password must contain a maximum of 16 characters';
      }
    } else {
      if (password == null ||
          password.isEmpty ||
          password.length < 8 ||
          password.length > 16) {
        return 'Password must be between 8 and 16 '
            'symbols long and contain at least one '
            'uppercase letter, one lowercase letter, one '
            'number and one special symbol';
      }
    }
    return null;
  }
}
