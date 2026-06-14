import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/helpers/secure_storage.dart';
import '/networks/endpoints.dart';

final class ResetPassApi {
  static final ResetPassApi _singleton = ResetPassApi._internal();
  ResetPassApi._internal();
  static ResetPassApi get instance => _singleton;

  Future<Map> resetPass({
    required String email,
    required String password,
    required String confirmPassword,
    required String resetToken,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "reset_token": resetToken,
      });
      Response response = await postHttp(Endpoints.resetPassrod(), data);
      String? token = await SecureStorage.getToken();
      DioSingleton.instance.update(token);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(jsonEncode(response.data));
        ToastUtil.showShortToast("Password reset successfully.");

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
