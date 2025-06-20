part of 'sing_up_bloc.dart';

abstract class SignUpEvent extends Equatable{
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpNameChanged extends SignUpEvent{
  const SignUpNameChanged(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

class SignUpSurnameChanged extends SignUpEvent {
  const SignUpSurnameChanged(this.surname);
  final String surname;

  @override
  List<Object> get props => [surname];
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);
  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  const SignUpConfirmPasswordChanged(this.confirmPassword);
  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class SignUpSubmitted extends SignUpEvent {}