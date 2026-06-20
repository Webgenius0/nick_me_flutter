import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/secure_storage.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class DeleteAccountApi {
  static final DeleteAccountApi _singleton = DeleteAccountApi._internal();
  DeleteAccountApi._internal();
  static DeleteAccountApi get instance => _singleton;

  Future<Map> deleteAccount() async {
    try {
      String? token = await SecureStorage.getToken();
      if (token != null && token.isNotEmpty) {
        DioSingleton.instance.update(token);
      }
      Response response = await deleteHttp(Endpoints.deleteAccount());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
