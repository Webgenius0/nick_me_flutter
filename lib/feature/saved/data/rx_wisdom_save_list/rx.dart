import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/saved/data/rx_wisdom_save_list/api.dart';
import 'package:nick_me/feature/saved/model/all_saved_stoic_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class WisdomSaveListRx extends RxResponseInt<AllSavedStoicModel> {
  final api = WisdomSaveListApi.instance;
  WisdomSaveListRx({required super.empty, required super.dataFetcher});

  ValueStream<AllSavedStoicModel> get savedWisdomList => dataFetcher.stream;

  Future<bool> getSavedWisdomList({
    String? authorSlug,
    int? perPage,
    int? page,
  }) async {
    try {
      AllSavedStoicModel data = await api.getSavedWisdomList(
        authorSlug: authorSlug,
        perPage: perPage,
        page: page,
      );
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
          error.response?.data["error"] ?? error.message,
        );
      } else {
        ToastUtil.showShortToast(
          error.response?.data["error"] ?? error.message,
        );
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
