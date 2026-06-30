import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/data/rx_terms_condition/api.dart';
import 'package:nick_me/feature/profile/model/terms_and_contitions.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class TermsAndConditionRX extends RxResponseInt<TermsPrivacyPolicyModel> {
  final api = TermsAndConditionApi.instance;
  TermsAndConditionRX({required super.empty, required super.dataFetcher});

  ValueStream<TermsPrivacyPolicyModel> get termsPrivacyPolicy =>
      dataFetcher.stream;
  Future<bool> getTermsAndConditions() async {
    try {
      TermsPrivacyPolicyModel data = await api.getTermsPrivacyPolicy();
      handleSuccessWithReturn(data);
      // ToastUtil.showShortToast('Terms and Conditions fetched successfully');
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
