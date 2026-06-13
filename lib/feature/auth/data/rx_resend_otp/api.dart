import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class ResendOtpApi {
  static final ResendOtpApi _singleton = ResendOtpApi._internal();
  ResendOtpApi._internal();
  static ResendOtpApi get instance => _singleton;

  Future<Map> resetOtp({required String email}) async {
    try {
      Response response = await postHttp(Endpoints.resendOtp(), {
        "email": email,
      });
      if (response.statusCode == 200) {
        // final data = jsonDecode(response.data);
        final data = jsonDecode(jsonEncode(response.data));
        ToastUtil.showShortToast("You get otp from email");
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
  MysingletonClass._internal();
  static final MysingletonClass _singleton = MysingletonClass._internal();
  static MysingletonClass get instance => _singleton;
}
