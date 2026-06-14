import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class ChangePassApi {
  static final ChangePassApi _singleton = ChangePassApi._internal();
  ChangePassApi._internal();
  static ChangePassApi get instance => _singleton;
  Future<Map> changePass({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirmation": newPasswordConfirmation,
      });
      Response response = await postHttp(Endpoints.changePass(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(jsonEncode(response.data));
        ToastUtil.showShortToast("Password change successfully.");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
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
