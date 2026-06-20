import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/feature/profile/data/rx_delete_account/api.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/stream_cleaner.dart';
import 'package:nick_me/helpers/secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nick_me/networks/rx_base.dart';

final class DeleteAccountRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = DeleteAccountApi.instance;
  DeleteAccountRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> deleteAccount() async {
    try {
      Map success = await api.deleteAccount();
      await handleSuccessWithReturn(success);
      ToastUtil.showShortToast(
        success['message'] ?? "Account deleted successfully",
      );
      return true;
    } catch (error) {
      log('Delete Account Error: ${error.toString()}');
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    await totalDataClean();
    await appData.remove(kKeyIsLoggedIn);
    await SecureStorage.deleteToken();
    DioSingleton.instance.clear();
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(error) {
    if (error is DioException) {
      if (error.response?.statusCode == 400) {
        errorMessage = error.response?.data['message'];
      } else if (error.response?.data?['code'] == 403) {
        errorMessage = error.response?.data['message'];
      } else {
        errorMessage = error.response?.data?['message'] ?? error.message;
      }
    }
    dataFetcher.sink.addError(error);
    return false;
  }
}
