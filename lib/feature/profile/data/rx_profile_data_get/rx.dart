import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:nick_me/feature/profile/data/rx_profile_data_get/api.dart';
import 'package:nick_me/feature/profile/model/profile_data_get_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ProfileDataRX extends RxResponseInt<ProfileDataGetModel> {
  final api = ProfileDataApi.instance;
  ProfileDataRX({required super.empty, required super.dataFetcher});

  ValueStream<ProfileDataGetModel> get profileData => dataFetcher.stream;

  Future<void> loadCachedProfile() async {
    try {
      final box = await Hive.openBox('profileCache');
      final cachedJson = box.get('profile_data');
      if (cachedJson != null && cachedJson is String) {
        final cachedData = ProfileDataGetModel.fromRawJson(cachedJson);
        dataFetcher.sink.add(cachedData);
      }
    } catch (e) {
      log('Error loading cached profile from Hive: $e');
    }
  }

  Future<bool> profileDataGet() async {
    try {
      ProfileDataGetModel data = await api.profileDataGet();
      handleSuccessWithReturn(data);

      try {
        final box = await Hive.openBox('profileCache');
        await box.put('profile_data', data.toRawJson());
      } catch (e) {
        log('Error saving profile data to Hive: $e');
      }
      // ToastUtil.showShortToast('Profile data fetched successfully');
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
