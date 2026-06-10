import 'package:flutter/foundation.dart';

final class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _showPassword = true;
  bool _showConfirmPassword = true;
  String _forgotPasswordEmail = '';
  String _registerEmail = '';
  String _otp = '';
  bool get isLoading => _isLoading;
  bool get showPassword => _showPassword;
  bool get showConfirmPassword => _showConfirmPassword;
  String get forgotPasswordEmail => _forgotPasswordEmail;
  String get registerEmail => _registerEmail;
  String get otpCode => _otp;

  void toogleShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void toogleShowConfirmPassword() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  void toggleLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setForgotPasswordEmail({required String email}) {
    _forgotPasswordEmail = email;
    notifyListeners();
  }

  void setOtp({required String otp}) {
    _otp = otp;
    notifyListeners();
  }

  void setRegisterEmail({required String email}) {
    _registerEmail = email;
    notifyListeners();
  }
}
