import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/data/rx_virtues/api.dart';
import 'package:nick_me/feature/home/model/virtues_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class VirtuesRx extends RxResponseInt<VirtuesModel> {
  final api = VirtuesApi.instance;
  VirtuesRx({required super.empty, required super.dataFetcher});

  ValueStream<VirtuesModel> get virtues => dataFetcher.stream;

  Future<bool> getVirtues() async {
    try {
      VirtuesModel data = await api.getVirtues();
      handleSuccessWithReturn(data);
      ToastUtil.showShortToast('Virtues fetched successfully');
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 400) {
        ToastUtil.showShortToast(error.response?.data["error"] ?? error.message);
      } else {
        ToastUtil.showShortToast(error.response?.data["error"] ?? error.message);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
