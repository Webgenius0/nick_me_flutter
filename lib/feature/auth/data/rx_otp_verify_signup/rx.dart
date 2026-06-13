import 'package:dio/dio.dart';
import 'package:nick_me/feature/auth/data/rx_otp_verify_signup/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/stream_cleaner.dart';
import '../../../../../../networks/rx_base.dart';

final class EmailVerifySignUpRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = OtpVerifyRegisterScreen.instance;

  EmailVerifySignUpRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> emailVerifySignup({
    required String email,
    required String otp,
    required String otpToken,
  }) async {
    try {
      final data = await api.otpVerifyRegister(
        email: email,
        otp: otp,
        otpToken: otpToken,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    await totalDataClean();
    String? accessToken = data['data']?['access_token'] ?? data['access_token'];
    await appData.write(kKeyIsLoggedIn, true);
    await appData.write(kKeyAccessToken, accessToken);

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
