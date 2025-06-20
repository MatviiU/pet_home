import 'package:auto_route/auto_route.dart';
import 'package:pet_home/core/router/auth_guard.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';
import 'package:pet_home/features/sign_in/presentation/screens/sign_in.dart';
import 'package:pet_home/features/sign_up/presentation/screens/sign_up.dart';
import 'package:pet_home/features/home/presentation/screens/home_page.dart';
import 'package:pet_home/features/favorites/presentation/screens/favorites.dart';
import 'package:pet_home/features/profile/presentation/screens/profile.dart';
import 'package:pet_home/features/app/presentation/screens/main_screen.dart';
import 'package:pet_home/features/splash/presentation/screens/splash.dart';

  part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.appBloc});

  final AppBloc appBloc;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/sign-in', page: SignInRoute.page,),
    AutoRoute(path: '/sign-up', page: SignUpRoute.page),
    AutoRoute(
      path: '/main',
      page: MainRoute.page,
      guards: [AuthGuard(appBloc: appBloc)],
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'favorites', page: FavoritesRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
      ],
    ),
  ];
}
