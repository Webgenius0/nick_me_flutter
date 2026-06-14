import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/feature/auth/data/rx_logout/api.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/stream_cleaner.dart';
import 'package:nick_me/helpers/secure_storage.dart';


import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class LogoutRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = LogoutApi.instance;
  LogoutRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> logout() async {
    try {
      Map success = await api.logout();
      ToastUtil.showShortToast("Logout successful");
      handleSuccessWithReturn(success);
      return true;
    } catch (error) {
      log('Logout Error   : ${error.toString()}');
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    totalDataClean();
    await appData.remove(kKeyIsLoggedIn);
    await SecureStorage.deleteToken();
    // Remove auth token from Dio
    DioSingleton.instance.clear();
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        errorMessage = error.response!.data['message'];
      } else if (error.response!.data['code'] == 403) {
        errorMessage = error.response!.data['message'];
      } else {
        errorMessage = error.response!.data['message'];
      }
    }
    // log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
