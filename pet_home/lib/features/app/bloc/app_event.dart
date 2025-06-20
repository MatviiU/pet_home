part of 'app_bloc.dart';

class AppEvent extends Equatable{
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class  AppLogoutRequested extends AppEvent{}

class _AppUserChanged extends AppEvent{
  const _AppUserChanged(this.user);
  final UserModel user;

  @override
  List<Object> get props => [user];
}