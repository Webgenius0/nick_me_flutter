import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/data/rx_profile_data_get/api.dart';
import 'package:nick_me/feature/profile/model/profile_data_get_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ProfileDataRX extends RxResponseInt<ProfileDataGetModel> {
  final api = ProfileDataApi.instance;
  ProfileDataRX({required super.empty, required super.dataFetcher});

  ValueStream<ProfileDataGetModel> get profileData => dataFetcher.stream;
  Future<bool> profileDataGet() async {
    try {
      ProfileDataGetModel data = await api.profileDataGet();
      handleSuccessWithReturn(data);
      ToastUtil.showShortToast('Profile data fetched successfully');
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
