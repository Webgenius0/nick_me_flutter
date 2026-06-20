import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/model/virtues_model.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/networks/endpoints.dart';

final class VirtuesApi {
  static final VirtuesApi _singleton = VirtuesApi._internal();
  VirtuesApi._internal();
  static VirtuesApi get instance => _singleton;

  Future<VirtuesModel> getVirtues() async {
    try {
      Response response = await getHttp(Endpoints.virtues());
      if (response.statusCode == 200) {
        final data = VirtuesModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
