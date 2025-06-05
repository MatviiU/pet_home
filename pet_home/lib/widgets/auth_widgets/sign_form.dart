import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/widgets/auth_widgets/buttons/forgot_password_button.dart';
import 'package:pet_home/widgets/auth_widgets/buttons/google_and_apple.dart';
import 'package:pet_home/widgets/auth_widgets/buttons/remember_me_button.dart';
import 'package:pet_home/widgets/auth_widgets/buttons/sign_button.dart';
import 'package:pet_home/widgets/auth_widgets/buttons/switch_auth_mode.dart';
import 'package:pet_home/widgets/auth_widgets/text_form_fields/email_field.dart';
import 'package:pet_home/widgets/auth_widgets/text_form_fields/name_field.dart';
import 'package:pet_home/widgets/auth_widgets/text_form_fields/password_field.dart';
import 'package:pet_home/widgets/auth_widgets/text_form_fields/repeat_password_field.dart';
import 'package:pet_home/widgets/auth_widgets/text_form_fields/surname_field.dart';

final _firebase = FirebaseAuth.instance;

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredPassword = '';
  String _enteredName = '';
  String _enteredSurname = '';
  bool _isAuthenticating = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isLogin ? 'Login' : 'Registration',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              if (!_isLogin)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NameField(controller: _nameController, sendName: _sendName),
                    const SizedBox(height: 20),
                    SurnameField(
                      controller: _surnameController,
                      sendSurname: _sendSurname,
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              EmailField(
                controller: _emailController,
                isLogin: _isLogin,
                sendEmail: _sendEmail,
              ),
              const SizedBox(height: 20),
              PasswordField(
                controller: _passwordController,
                isLogin: _isLogin,
                sendNewPassword: _sendNewPassword,
              ),
              if (!_isLogin)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    RepeatPasswordField(
                      controller: _repeatPasswordController,
                      isLogin: _isLogin,
                      newPassword: _enteredPassword,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              if (_isLogin)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [RememberMe(), ForgotPasswordButton()],
                ),
              if (_isAuthenticating) CircularProgressIndicator(),
              if (!_isAuthenticating)
                SignButton(isLogin: _isLogin, submit: _submit),
              SwitchAuthMode(
                isLogin: _isLogin,
                switchAuthMode: _toggleAuthMode,
              ),
              if (_isLogin) GoogleAndApple(),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _sendNewPassword(String newPassword) {
    setState(() {
      _enteredPassword = newPassword;
    });
  }

  void _sendEmail(String email) {
    setState(() {
      _enteredEmail = email;
    });
  }

  void _sendName(String name) {
    setState(() {
      _enteredName = name;
    });
  }

  void _sendSurname(String surname) {
    setState(() {
      _enteredSurname = surname;
    });
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
              'name': _enteredName,
              'surname': _enteredSurname,
              'email': _enteredEmail,
            });
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed.')),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }
}
