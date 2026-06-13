import 'dart:convert';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';

import '/networks/endpoints.dart';

final class OtpVerifyRegisterScreen {
  static final OtpVerifyRegisterScreen _singleton =
      OtpVerifyRegisterScreen._internal();
  OtpVerifyRegisterScreen._internal();
  static OtpVerifyRegisterScreen get instance => _singleton;

  Future<Map> otpVerifyRegister({
    required String email,
    required String otp,
    required String otpToken,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
        "otp": otp,
        "otp_token": otpToken,
      });
      Response response = await postHttp(Endpoints.otpVerifyRegister(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final data = jsonDecode(response.data);
        final data = jsonDecode(jsonEncode(response.data));
        ToastUtil.showShortToast("Otp verified successful");
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
