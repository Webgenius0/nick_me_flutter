import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/feature/auth/data/rx_signup/api.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/stream_cleaner.dart';
import 'package:nick_me/helpers/secure_storage.dart';


import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class SignUpRX extends RxResponseInt<Map> {
  String? errorMessage;
  final api = SignupApi.instance;

  SignUpRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<String?> signupRx({
    required String name,
    required String email,
    required String password,
    required String confPassword,
    required bool dailyReminders,
    required bool termsAndConditions,
  }) async {
    try {
      Map data = await api.signup(
        email: email,
        password: password,
        name: name,
        confirmPassword: confPassword,
        dailyReminders: dailyReminders,
        termsAndConditions: termsAndConditions,
      );
      handleSuccessWithReturn(data);
      return data['data']?['otp_token'] ?? data['otp_token'];
    } catch (error) {
      log('Error catch is here : ${error.toString()}');
      handleErrorWithReturn(error);
      return null;
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    totalDataClean();
    String? accessToken = data['data']['access_token'];
    appData.write(kKeyIsLoggedIn, true);
    if (accessToken != null) {
      await SecureStorage.saveToken(accessToken);
    }
    DioSingleton.instance.update(accessToken);

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
