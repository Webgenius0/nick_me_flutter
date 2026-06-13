import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
 

import '/networks/endpoints.dart';

final class LogoutApi {
  static final LogoutApi _singleton = LogoutApi._internal();
  LogoutApi._internal();
  static LogoutApi get instance => _singleton;

  Future<Map> logout() async {
    try {
      String? token = appData.read(kKeyAccessToken);
      String? role = appData.read(kKeyRole);
      if (token == null && role == null) throw Exception('Token not found');
      DioSingleton.instance.update(token);
      Response response = await postHttp(Endpoints.logOut());
      if (response.statusCode == 200 || response.statusCode == 201) {
        await appData.remove(kKeyAccessToken);
        await appData.remove(kKeyIsLoggedIn);
        final data = jsonDecode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      ToastUtil.showShortToast("Logout failed");
      rethrow;
    }
  }
}
