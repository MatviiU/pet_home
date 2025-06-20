part of 'sing_up_bloc.dart';

class RequiredField extends FormzInput<String, String> {
  const RequiredField.pure() : super.pure('');
  const RequiredField.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return value.isNotEmpty ? null : 'Required';
  }
}

class Name extends FormzInput<String, String> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty) return 'Field is required';
    if (value.length < 2 || value.length > 30) {
      return 'Name must be\n between 2 and 30 characters';
    }
    return null;
  }
}

class Surname extends FormzInput<String, String> {
  const Surname.pure() : super.pure('');
  const Surname.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty) return 'Field is required';
    if (value.length < 2 || value.length > 30) {
      return 'Surname must be\n between 2 and 30 characters';
    }
    return null;
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

class ConfirmedPassword extends FormzInput<String, String> {
  final String originalPassword;
  const ConfirmedPassword.pure({this.originalPassword = ''}) : super.pure('');

  const ConfirmedPassword.dirty({
    required this.originalPassword,
    String value = '',
  }) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) return 'Field is required';
    return originalPassword == value ? null : 'Passwords do not match';
  }
}

class SignUpState extends Equatable {
  final Name name;
  final Surname surname;
  final Email email;
  final Password password;
  final ConfirmedPassword confirmPassword;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  const SignUpState({
    this.name = const Name.pure(),
    this.surname = const Surname.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
    this.isValid = false,
  });

  SignUpState copyWith({
    Name? name,
    Surname? surname,
    Email? email,
    Password? password,
    ConfirmedPassword? confirmPassword,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignUpState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    name,
    surname,
    email,
    password,
    confirmPassword,
    status,
    isValid,
    errorMessage,
  ];
}
