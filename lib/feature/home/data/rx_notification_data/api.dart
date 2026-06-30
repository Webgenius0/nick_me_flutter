import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/model/wisdom_generate_model.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import 'package:nick_me/networks/endpoints.dart';

final class NotificationDataApi {
  static final NotificationDataApi _singleton = NotificationDataApi._internal();
  NotificationDataApi._internal();
  static NotificationDataApi get instance => _singleton;

  Future<WisdomGenerateModel> getNotificationData(String slug) async {
    try {
      Response response = await getHttp(Endpoints.notificationData(slug));
      if (response.statusCode == 200) {
        final data = WisdomGenerateModel.fromRawJson(jsonEncode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
