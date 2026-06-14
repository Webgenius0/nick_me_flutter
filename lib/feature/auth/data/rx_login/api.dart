import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/helpers/secure_storage.dart';
import '/networks/endpoints.dart';

final class LoginApi {
  static final LoginApi _singleton = LoginApi._internal();
  LoginApi._internal();
  static LoginApi get instance => _singleton;

  Future<Map> login({required String email, required String password}) async {
    try {
      FormData data = FormData.fromMap({"email": email, "password": password});
      Response response = await postHttp(Endpoints.logIn(), data);
      String? token = await SecureStorage.getToken();
      DioSingleton.instance.update(token);
      if (response.statusCode == 200) {
        final data = jsonDecode(jsonEncode(response.data));

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
