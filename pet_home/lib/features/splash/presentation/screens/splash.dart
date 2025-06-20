import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/core/router/app_router.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.status != AppStatus.unknown) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _handleNavigation(context, state);
          });
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void _handleNavigation(BuildContext context, AppState state) {
    switch (state.status) {
      case AppStatus.authenticated:
        context.router.replace(const MainRoute());
      case AppStatus.unauthenticated:
        context.router.replace(const SignInRoute());
      case AppStatus.unknown:
        break;
    }
  }
}
