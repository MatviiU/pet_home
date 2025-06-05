import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/screens/main_screen.dart';
import 'package:pet_home/screens/sign_in_up.dart';
import 'package:pet_home/styles/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_home/widgets/splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return SignInUpScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
