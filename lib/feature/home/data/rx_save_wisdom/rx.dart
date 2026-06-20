import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/data/rx_save_wisdom/api.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class SaveWisdomRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = SaveWisdomApi.instance;
  SaveWisdomRx({required super.empty, required super.dataFetcher});

  ValueStream<Map> get saveWisdomStream => dataFetcher.stream;

  Future<bool> saveWisdom({required String stoicSlug}) async {
    try {
      final data = await api.saveWisdom(stoicSlug: stoicSlug);
      handleSuccessWithReturn(data);
      ToastUtil.showShortToast(data['message'] ?? "Wisdom saved successfully");
      return true;
    } catch (error) {
      log('Error catch is here : ${error.toString()}');
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(error) {
    if (error is DioException) {
      if (error.response?.statusCode == 400) {
        errorMessage = error.response?.data['message'];
      } else if (error.response?.data?['code'] == 403) {
        errorMessage = error.response?.data['message'];
      } else {
        errorMessage = error.response?.data?['message'] ?? error.message;
      }
    }
    dataFetcher.sink.addError(error);
    return false;
  }
}
