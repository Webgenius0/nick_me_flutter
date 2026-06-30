import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/data/rx_notification_data/api.dart';
import 'package:nick_me/feature/home/model/wisdom_generate_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class NotificationDataRx extends RxResponseInt<WisdomGenerateModel> {
  final api = NotificationDataApi.instance;
  NotificationDataRx({required super.empty, required super.dataFetcher});

  ValueStream<WisdomGenerateModel> get wisdom => dataFetcher.stream;

  Future<bool> getNotificationData(String slug) async {
    try {
      WisdomGenerateModel data = await api.getNotificationData(slug);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 400) {
        ToastUtil.showShortToast(
          error.response?.data["message"] ?? error.message,
        );
      } else if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(
          error.response?.data["message"] ?? error.message,
        );
      } else {
        ToastUtil.showShortToast(
          error.response?.data["message"] ?? error.message,
        );
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
