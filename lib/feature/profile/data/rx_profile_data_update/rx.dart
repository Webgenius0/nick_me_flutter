import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

import 'api.dart';

final class UpdateProfileRx extends RxResponseInt<Map> {
  final api = UpdateProfileApi.instance;

  UpdateProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> updateProfile({String? name, File? avatar}) async {
    try {
      Map data = await api.updateProfile(name: name, avatar: avatar);

      handleSuccessWithReturn(data);
      ToastUtil.showShortToast('Profile updated successfully');
      return true;
    } catch (error) { 
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException && error.response != null) {
      final message = error.response!.data["message"];
      if (message is String) {
        ToastUtil.showShortToast(message);
        return false;
      }

      if (message is Map) {
        final errorMessage = message.values
            .whereType<List>()
            .map((e) => e.first)
            .join("\n");
        ToastUtil.showShortToast(errorMessage);
        return false;
      }
    }
    ToastUtil.showShortToast("Something went wrong");
    return false;
  }
}
