import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/helpers/secure_storage.dart';

import '/networks/endpoints.dart';

final class SignupApi {
  static final SignupApi _singleton = SignupApi._internal();
  SignupApi._internal();
  static SignupApi get instance => _singleton;

  Future<Map> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool dailyReminders,
    required bool termsAndConditions,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "first_name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "daily_reminders": dailyReminders ? 1 : 0,
        "terms_and_conditions": termsAndConditions ? 1 : 0,
      });
      Response response = await postHttp(Endpoints.register(), data); 
      String? token = await SecureStorage.getToken();
      DioSingleton.instance.update(token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(jsonEncode(response.data));
        ToastUtil.showShortToast("Sign Up successful. Please verify with OTP.");

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}

final class MysingletonClass {
  // private constructor.
  MysingletonClass._internal();

  //only one object is created.
  static final MysingletonClass _singleton = MysingletonClass._internal();

  static MysingletonClass get instance => _singleton;
}
