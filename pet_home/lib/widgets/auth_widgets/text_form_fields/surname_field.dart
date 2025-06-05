import 'package:flutter/material.dart';

class SurnameField extends StatefulWidget {
  const SurnameField({
    super.key,
    required this.controller,
    required this.sendSurname,
  });

  final TextEditingController controller;
  final Function(String) sendSurname;

  @override
  State<SurnameField> createState() => _SurnameFieldState();
}

class _SurnameFieldState extends State<SurnameField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.length >= 2 ||
          widget.controller.text.length <= 30) {
        widget.sendSurname(widget.controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Surname',
        hintText: 'Enter your surname',
      ),
      validator: (surname) => _validateSurname(surname),
    );
  }

  String? _validateSurname(String? surname) {
    if (surname == null || surname.isEmpty) {
      return 'Please enter a valid surname';
    }
    if (surname.length < 2 || surname.length > 30) {
      return 'Surname must be between 2 and 30 characters';
    }
    return null;
  }

}
