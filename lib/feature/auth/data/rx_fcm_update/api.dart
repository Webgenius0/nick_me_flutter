import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class UpdateFCMTokenApi {
  static final UpdateFCMTokenApi _singleton = UpdateFCMTokenApi._internal();
  UpdateFCMTokenApi._internal();
  static UpdateFCMTokenApi get instance => _singleton;

  Future<Map> updateFCMToken({required String fcmToken}) async {
    try {
      FormData data = FormData.fromMap({"fcm_token": fcmToken});
      Response response = await postHttp(Endpoints.updateFCMToken(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(jsonEncode(response.data));
        return responseData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
