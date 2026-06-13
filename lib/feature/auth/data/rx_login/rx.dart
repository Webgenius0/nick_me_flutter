import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/feature/auth/data/rx_login/api.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/stream_cleaner.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class LoginRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = LoginApi.instance;
  LoginRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;
  Future<bool> login({required String email, required String password}) async {
    try {
      final data = await api.login(email: email, password: password);

      handleSuccessWithReturn(data);
      ToastUtil.showShortToast("Login successfuly");

      return true;
    } catch (error) {
      log('Error catch is here : ${error.toString()}');
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    await totalDataClean();
    String? accessToken = data['data']['access_token'];
    await appData.write(kKeyIsLoggedIn, true);
    await appData.write(kKeyAccessToken, accessToken);
    String token = appData.read(kKeyAccessToken);
    dataFetcher.sink.add(data);
    DioSingleton.instance.update(token);

    return data;

    // dataFetcher.sink.add(data);
    // return data;
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
