import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/saved/model/all_saved_stoic_model.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/networks/endpoints.dart';

final class WisdomSaveListApi {
  static final WisdomSaveListApi _singleton = WisdomSaveListApi._internal();
  WisdomSaveListApi._internal();
  static WisdomSaveListApi get instance => _singleton;

  Future<AllSavedStoicModel> getSavedWisdomList({
    String? authorSlug,
    int? perPage,
    int? page,
  }) async {
    try {
      Map<String, dynamic> queryParams = {};
      if (authorSlug != null && authorSlug.isNotEmpty) {
        queryParams['author_slug'] = authorSlug;
      }
      if (perPage != null) {
        queryParams['per_page'] = perPage;
      }
      if (page != null) {
        queryParams['page'] = page;
      }

      String endpoint = Endpoints.wisdomSaveList();
      if (queryParams.isNotEmpty) {
        final queryString = queryParams.entries
            .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
            .join('&');
        endpoint += '?$queryString';
      }

      Response response = await getHttp(endpoint);
      if (response.statusCode == 200) {
        final data = AllSavedStoicModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
