class LoginState {
  final String username;
  final String password;
  final String? usernameError;
  final String? passwordError;
  final bool isLoading;
  final bool isLoginSuccess;

  LoginState({
    this.username = '',
    this.password = '',
    this.usernameError,
    this.passwordError,
    this.isLoading = false,
    this.isLoginSuccess = false,
  });

  bool get isUsernameValid => usernameError == null && username.isNotEmpty;
  bool get isPasswordValid => passwordError == null && password.isNotEmpty;
  bool get isFormValid => isUsernameValid && isPasswordValid;

  LoginState copyWith({
    String? username,
    String? password,
    String? usernameError = '',
    String? passwordError = '',
    bool? isLoading,
    bool? isLoginSuccess,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      usernameError: usernameError == '' ? this.usernameError : usernameError,
      passwordError: passwordError == '' ? this.passwordError : passwordError,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
