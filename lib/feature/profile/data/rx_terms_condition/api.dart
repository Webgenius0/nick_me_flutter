import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nick_me/feature/profile/model/terms_and_contitions.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class TermsAndConditionApi {
  static final TermsAndConditionApi _singleton =
      TermsAndConditionApi._internal();
  TermsAndConditionApi._internal();
  static TermsAndConditionApi get instance => _singleton;

  Future<TermsPrivacyPolicyModel> getTermsPrivacyPolicy() async {
    try {
      Response response = await getHttp(Endpoints.termsAndContitions());
      if (response.statusCode == 200) {
        final data = TermsPrivacyPolicyModel.fromRawJson(
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
