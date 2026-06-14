import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/model/profile_data_get_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class ProfileDataApi {
  static final ProfileDataApi _singleton = ProfileDataApi._internal();
  ProfileDataApi._internal();
  static ProfileDataApi get instance => _singleton;

  Future<ProfileDataGetModel> profileDataGet() async {
    try {
      Response response = await getHttp(Endpoints.getUserProfile());
      if (response.statusCode == 200) {
        final data = ProfileDataGetModel.fromRawJson(
          json.encode(response.data),
        );
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
