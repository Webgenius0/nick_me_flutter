import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/auth/data/rx_resend_otp/api.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class ResendOtpRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = ResendOtpApi.instance;
  ResendOtpRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<String?> resetOtp({required String email}) async {
    try {
      final data = await api.resetOtp(email: email);
      log('Status here : $data');
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
