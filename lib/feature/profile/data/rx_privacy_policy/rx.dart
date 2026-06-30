import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/data/rx_privacy_policy/api.dart';
import 'package:nick_me/feature/profile/model/privacy_policy_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class PrivacyPolicyRX extends RxResponseInt<PrivacyPolicyModel> {
  final api = PrivacyPolicyApi.instance;
  PrivacyPolicyRX({required super.empty, required super.dataFetcher});

  ValueStream<PrivacyPolicyModel> get privacyPolicy => dataFetcher.stream;
  Future<bool> getPrivacyPolicy() async {
    try {
      PrivacyPolicyModel data = await api.getPrivacyPolicy();
      handleSuccessWithReturn(data);
      // ToastUtil.showShortToast('Privacy Policy Fetched successfully');
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else if (error.response!.statusCode == 401) {
        // NavigationService.popAndReplace(Routes.newScreen);
      } else {
        ToastUtil.showShortToast(error.response!.data["error"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
