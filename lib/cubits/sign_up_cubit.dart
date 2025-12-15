import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  void updateFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void updateLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void updateEmail(String email) {
    String? error;
    String trimmed = email.trim();
    if (trimmed.isEmpty) {
      error = null;
    } else if (!_isValidEmail(trimmed)) {
      error = 'Email không hợp lệ';
    } else {
      error = null;
    }
    emit(state.copyWith(email: trimmed, emailError: error));
  }

  void updatePassword(String password) {
    String? error;
    String trimmed = password.trim();
    if (trimmed.isEmpty) {
      error = null;
    } else if (!_isValidPassword(trimmed)) {
      error = 'Mật khẩu phải có ít nhất 6 ký tự';
    } else {
      error = null;
    }
    emit(state.copyWith(password: trimmed, passwordError: error));
  }

  void signUp() {
    if (state.isFormValid) {
      emit(state.copyWith(isLoading: true));
      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false, isSignUpSuccess: true));
      });
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@(gmail|yahoo|outlook|hotmail)\.(com|net|org|edu)$',
    );
    return emailRegex.hasMatch(email.trim());
  }

  bool _isValidPassword(String password) {
    String trimmed = password.trim();
    return trimmed.length >= 6;
  }
}
