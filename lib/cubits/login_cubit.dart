import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void updateUsername(String username) {
    String? error;
    String trimmed = username.trim();
    if (trimmed.isEmpty) {
      error = null;
    } else if (!_isValidUsername(trimmed)) {
      error = 'Username không hợp lệ (3-20 ký tự)';
    } else {
      error = null;
    }
    emit(state.copyWith(username: trimmed, usernameError: error));
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

  void login() {
    if (state.isFormValid) {
      emit(state.copyWith(isLoading: true));
      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false, isLoginSuccess: true));
      });
    }
  }

  bool _isValidUsername(String username) {
    String trimmed = username.trim();
    return trimmed.length >= 3 && trimmed.length <= 20;
  }

  bool _isValidPassword(String password) {
    String trimmed = password.trim();
    return trimmed.length >= 6;
  }
}
