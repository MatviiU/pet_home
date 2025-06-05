import 'package:flutter/material.dart';
import 'package:pet_home/styles/app_colors.dart';

class GoogleAndApple extends StatelessWidget {
  const GoogleAndApple({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/google.png', width: 30, height: 30),
        SizedBox(width: 10),
        Text(
          '/',
          style: TextStyle(
            color: AppColors.brown,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Image.asset('assets/icons/apple-logo.png', width: 35, height: 35),
      ],
    );
  }
}
