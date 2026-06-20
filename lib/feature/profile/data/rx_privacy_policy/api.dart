import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/model/privacy_policy_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class PrivacyPolicyApi {
  static final PrivacyPolicyApi _singleton = PrivacyPolicyApi._internal();
  PrivacyPolicyApi._internal();
  static PrivacyPolicyApi get instance => _singleton;

  Future<PrivacyPolicyModel> getPrivacyPolicy() async {
    try {
      Response response = await getHttp(Endpoints.privacyPolicy());
      if (response.statusCode == 200) {
        final data = PrivacyPolicyModel.fromRawJson(json.encode(response.data));
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
