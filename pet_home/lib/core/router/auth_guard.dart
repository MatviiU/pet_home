import 'package:auto_route/auto_route.dart';
import 'package:pet_home/core/router/app_router.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';

class AuthGuard extends AutoRouteGuard{
  AuthGuard({required this.appBloc});

  final AppBloc appBloc;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (appBloc.state.status == AppStatus.authenticated){
      resolver.next(true);
    } else {
      resolver.redirectUntil(SignInRoute());
    }
  }
}