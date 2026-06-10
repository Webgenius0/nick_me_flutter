class PasswordRules {
  static bool hasMinLength(String value) => value.length >= 8;

  static bool hasUpperAndLower(String value) =>
      RegExp(r'(?=.*[A-Z])(?=.*[a-z])').hasMatch(value);

  static bool hasNumber(String value) => RegExp(r'(?=.*[0-9])').hasMatch(value);

  static bool hasSpecialChar(String value) =>
      RegExp(r'(?=.*[!@#\$%\^&\*])').hasMatch(value);
}
