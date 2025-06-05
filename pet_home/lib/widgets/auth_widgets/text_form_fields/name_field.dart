import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  const NameField({
    super.key,
    required this.controller,
    required this.sendName,
  });

  final TextEditingController controller;
  final Function(String) sendName;

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.length >= 2 ||
          widget.controller.text.length <= 30) {
        widget.sendName(widget.controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your name',
      ),
      validator: (name) => _validateName(name),
    );
  }

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter a valid name';
    }
    if (name.length < 2 || name.length > 30) {
      return 'Name must be between 2 and 30 characters';
    }
    return null;
  }

}
