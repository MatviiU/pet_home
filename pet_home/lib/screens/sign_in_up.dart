import 'package:flutter/material.dart';
import 'package:pet_home/widgets/auth_widgets/sign_form.dart';

class SignInUpScreen extends StatefulWidget {
  const SignInUpScreen({super.key});

  @override
  State<SignInUpScreen> createState() => _SignInUpScreenState();
}

class _SignInUpScreenState extends State<SignInUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app_logo.jpg',
                width: 200,
                height: 200,
              ),
              SignForm(),
            ],
          ),
        ),
      ),
    );
  }
}
