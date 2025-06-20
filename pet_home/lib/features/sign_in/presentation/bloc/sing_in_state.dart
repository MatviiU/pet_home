part of 'sign_in_bloc.dart';

class RequiredField extends FormzInput<String, String> {
  const RequiredField.pure() : super.pure('');

  const RequiredField.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return value.isNotEmpty ? null : 'Required';
  }
}

class Email extends FormzInput<String, String> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  @override
  String? validator(String value) {
    if (value.isEmpty) return 'Field is required';
    return _emailRegExp.hasMatch(value) ? null : 'Incorrect email format';
  }
}

class Password extends FormzInput<String, String> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty) return 'Field is required';
    if (value.length < 8) return 'Password must contain\n at least 8 characters';
    if (value.length > 16) {
      return 'Password must contain\n a maximum of 16 characters';
    }
    return null;
  }
}

class SignInState extends Equatable {
  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
    this.isValid = false,
  });

  final Email email;
  final Password password;

  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, isValid, errorMessage];
}
