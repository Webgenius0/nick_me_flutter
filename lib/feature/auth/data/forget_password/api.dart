import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class ForgetPasswordApi {
  static final ForgetPasswordApi _singleton = ForgetPasswordApi._internal();
  ForgetPasswordApi._internal();
  static ForgetPasswordApi get instance => _singleton;

  Future<Map> forgetPassword({required String email}) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
      });
      Response response = await postHttp(Endpoints.forgetPass(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final data = jsonDecode(response.data);
        final data = jsonDecode(jsonEncode(response.data));
        ToastUtil.showShortToast("You get otp from email");
        return data;
      } else {
        ToastUtil.showShortToast("Error show email");
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
