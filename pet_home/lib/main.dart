import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/core/router/app_router.dart';
import 'package:pet_home/core/theme/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';
import 'package:pet_home/features/auth/data/repositories/auth_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider<AppBloc>(
        create:
            (context) =>
                AppBloc(authRepository: context.read<AuthRepository>()),
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(appBloc: context.read<AppBloc>());
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AppStatus.authenticated:
            appRouter.replace(const MainRoute());
            break;
          case AppStatus.unauthenticated:
            appRouter.replace(const SignInRoute());
            break;
          case AppStatus.unknown:
            break;
        }
      },
      child: MaterialApp.router(
        title: 'Pet home',
        theme: AppTheme.theme,
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
