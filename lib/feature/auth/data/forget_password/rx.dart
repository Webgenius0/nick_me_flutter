import 'package:dio/dio.dart';
import 'package:nick_me/feature/auth/data/forget_password/api.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../networks/rx_base.dart';

final class ForgetPasswodRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = ForgetPasswordApi.instance;

  ForgetPasswodRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<String?> forgetPass({required String email}) async {
    try {
      final data = await api.forgetPassword(email: email);
      handleSuccessWithReturn(data);
      return data['data']?['otp_token'] ?? data['otp_token'];
    } catch (error) {
      // log('Error catch is here : ${error.toString()}');
      handleErrorWithReturn(error);
      return null;
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    // totalDataClean();
    // String? accessToken = data['token'];
    // await appData.write(kKeyIsLoggedIn, true);
    // await appData.write(kKeyAccessToken, accessToken);
    // String token = appData.read(kKeyAccessToken);
    // dataFetcher.sink.add(data);
    // DioSingleton.instance.update(token);

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
    dataFetcher.sink.addError(error);
    return false;
  }
}
