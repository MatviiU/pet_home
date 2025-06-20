import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pet_home/features/auth/data/repositories/auth_repository.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SignUpState()) {
    on<SignUpNameChanged>(_onNameChanged);
    on<SignUpSurnameChanged>(_onSurnameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  final AuthRepository _authRepository;

  void _onNameChanged(SignUpNameChanged event, Emitter<SignUpState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([
          name,
          state.surname,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onSurnameChanged(SignUpSurnameChanged event,
      Emitter<SignUpState> emit,) {
    final surname = Surname.dirty(event.surname);
    emit(
      state.copyWith(
        surname: surname,
        isValid: Formz.validate([
          state.name,
          surname,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
        state.name,
        state.surname,
        email,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onPasswordChanged(SignUpPasswordChanged event,
      Emitter<SignUpState> emit) {
    final password = Password.dirty(event.password);
    final confirmPassword = ConfirmedPassword.dirty(
      originalPassword: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmPassword: confirmPassword,
      isValid: Formz.validate([
        state.name,
        state.surname,
        state.email,
        password,
        state.confirmPassword,
      ]),
    ));
  }

  void _onConfirmPasswordChanged(SignUpConfirmPasswordChanged event,
      Emitter<SignUpState> emit) {
    final confirmPassword = ConfirmedPassword.dirty(
      originalPassword: state.password.value,
      value: event.confirmPassword,
    );
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate([
        state.name,
        state.surname,
        state.email,
        state.password,
        confirmPassword,
      ]),
    ));
  }

  Future<void> _onSubmitted(SignUpSubmitted event,
      Emitter<SignUpState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authRepository.signUpWithEmailAndPassword(name: state.name.value,
          surname: state.surname.value,
          email: state.email.value,
          password: state.password.value);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
