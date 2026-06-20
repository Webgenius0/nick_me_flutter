import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/model/wisdom_authors_model.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/networks/endpoints.dart';

final class WisdomAuthorsApi {
  static final WisdomAuthorsApi _singleton = WisdomAuthorsApi._internal();
  WisdomAuthorsApi._internal();
  static WisdomAuthorsApi get instance => _singleton;

  Future<WisdomAuthorsModel> getWisdomAuthors() async {
    try {
      Response response = await getHttp(Endpoints.wisdomAuthors());
      if (response.statusCode == 200) {
        final data = WisdomAuthorsModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
