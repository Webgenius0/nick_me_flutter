import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/networks/endpoints.dart';

final class SaveWisdomApi {
  static final SaveWisdomApi _singleton = SaveWisdomApi._internal();
  SaveWisdomApi._internal();
  static SaveWisdomApi get instance => _singleton;

  Future<Map> saveWisdom({required String stoicSlug}) async {
    try {
      FormData data = FormData.fromMap({"stoic_slug": stoicSlug});
      Response response = await postHttp(Endpoints.wisdomSave(), data);
      if (response.statusCode == 200) {
        final resData = jsonDecode(jsonEncode(response.data));
        return resData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
