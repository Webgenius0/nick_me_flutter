import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/model/wisdom_generate_model.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/networks/endpoints.dart';

final class WisdomGenerateApi {
  static final WisdomGenerateApi _singleton = WisdomGenerateApi._internal();
  WisdomGenerateApi._internal();
  static WisdomGenerateApi get instance => _singleton;

  Future<WisdomGenerateModel> generateWisdom({
    String? authorSlug,
    required String prompt,
  }) async {
    try {
      final Map<String, dynamic> map = {"prompt": prompt};
      if (authorSlug != null && authorSlug.isNotEmpty) {
        map["author_slug"] = authorSlug;
      }
      FormData data = FormData.fromMap(map);
      
      Response response = await postHttp(Endpoints.wisdomGenerate(), data);
      if (response.statusCode == 200) {
        final resData = WisdomGenerateModel.fromRawJson(jsonEncode(response.data));
        return resData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
