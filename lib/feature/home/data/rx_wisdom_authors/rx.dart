import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/home/data/rx_wisdom_authors/api.dart';
import 'package:nick_me/feature/home/model/wisdom_authors_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class WisdomAuthorsRx extends RxResponseInt<WisdomAuthorsModel> {
  final api = WisdomAuthorsApi.instance;
  WisdomAuthorsRx({required super.empty, required super.dataFetcher});

  ValueStream<WisdomAuthorsModel> get wisdomAuthors => dataFetcher.stream;

  Future<bool> getWisdomAuthors() async {
    try {
      WisdomAuthorsModel data = await api.getWisdomAuthors();
      handleSuccessWithReturn(data);
      // ToastUtil.showShortToast('Wisdom authors fetched successfully');
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
