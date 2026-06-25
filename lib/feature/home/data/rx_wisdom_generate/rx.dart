import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/data/rx_wisdom_generate/api.dart';
import 'package:nick_me/feature/home/model/wisdom_generate_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class WisdomGenerateRx extends RxResponseInt<WisdomGenerateModel> {
  final api = WisdomGenerateApi.instance;
  WisdomGenerateRx({required super.empty, required super.dataFetcher});

  ValueStream<WisdomGenerateModel> get wisdom => dataFetcher.stream;

  Future<bool> generateWisdom({
    String? authorSlug,
    required String prompt,
  }) async {
    try {
      WisdomGenerateModel data = await api.generateWisdom(
        authorSlug: authorSlug,
        prompt: prompt,
      );
      handleSuccessWithReturn(data);
      // ToastUtil.showShortToast('Wisdom generated successfully');
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
