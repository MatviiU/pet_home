import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.isLogin, required this.sendEmail,
  });

  final TextEditingController controller;
  final bool isLogin;
  final Function(String) sendEmail;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  String enteredEmail = '';

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.contains('@')) {
        widget.sendEmail(widget.controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
      ),
      onSaved: (value) {
        enteredEmail = value!;
      },
      validator: (email) => _validateEmail(email),
    );
  }

  String? _validateEmail(String? email) {
    if (email == null ||
        email.trim().isEmpty ||
        !email.contains('@')) {
      return widget.isLogin
          ? 'The email address is invalid'
          : 'Please enter a valid email to continue';
    }
    return null;
  }
}
