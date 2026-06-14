import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/data/rx_change_password/api.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class ChangePassRX extends RxResponseInt<Map> {
  String? errorMessage;
  final api = ChangePassApi.instance;
  ChangePassRX({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> changePass({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      Map data = await api.changePass(
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      log('Error catch is here : ${error.toString()}');
      return handleErrorWithReturn(error);
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
