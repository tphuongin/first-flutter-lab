class SignUpState {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isSignUpSuccess;

  SignUpState({
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isSignUpSuccess = false,
  });

  bool get isEmailValid => emailError == null && email.isNotEmpty;
  bool get isPasswordValid => passwordError == null && password.isNotEmpty;
  bool get isFormValid =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      username.isNotEmpty &&
      isEmailValid &&
      isPasswordValid;

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? password,
    String? emailError = '',
    String? passwordError = '',
    bool? isLoading,
    bool? isSignUpSuccess,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError == '' ? this.emailError : emailError,
      passwordError: passwordError == '' ? this.passwordError : passwordError,
      isLoading: isLoading ?? this.isLoading,
      isSignUpSuccess: isSignUpSuccess ?? this.isSignUpSuccess,
    );
  }
}
