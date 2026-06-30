import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/auth/data/rx_fcm_update/api.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';

final class UpdateFCMTokenRx extends RxResponseInt<Map> {
  String? errorMessage;
  final api = UpdateFCMTokenApi.instance;
  
  UpdateFCMTokenRx({required super.empty, required super.dataFetcher});
  
  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> updateFCMToken({required String fcmToken}) async {
    try {
      final data = await api.updateFCMToken(fcmToken: fcmToken);
      log('FCM Token Update Status: $data');
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      log('Error updating FCM Token: ${error.toString()}');
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(error) {
    if (error is DioException) {
      if (error.response?.statusCode == 400) {
        errorMessage = error.response?.data['message'];
      } else if (error.response?.data['code'] == 403) {
        errorMessage = error.response?.data['message'];
      } else {
        errorMessage = error.response?.data['message'];
      }
    }
    dataFetcher.sink.addError(error);
    return false;
  }
}
