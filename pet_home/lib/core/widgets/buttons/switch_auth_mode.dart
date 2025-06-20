import 'package:flutter/material.dart';

class SwitchAuthMode extends StatelessWidget {
  const SwitchAuthMode({
    super.key,
    required this.prefixText,
    required this.linkText,
    required this.onTap,
  });

  final String prefixText;
  final String linkText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
          children: [TextSpan(text: prefixText), TextSpan(text: linkText)],
        ),
      ),
    );
  }
}
