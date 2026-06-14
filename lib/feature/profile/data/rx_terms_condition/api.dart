// import 'dart:convert';
// import 'package:dio/dio.dart';
// import '../../../../../networks/dio/dio.dart';
// import '../../../../networks/exception_handler/data_source.dart';
// import '/networks/endpoints.dart';

// final class TermsAndConditionApi {
//   static final TermsAndConditionApi _singleton =
//       TermsAndConditionApi._internal();
//   TermsAndConditionApi._internal();
//   static TermsAndConditionApi get instance => _singleton;

//   Future<TermsPrivacyPolicyModel> getTermsPrivacyPolicy({
//     required String slug,
//   }) async {
//     try {
//       Response response = await getHttp(Endpoints.getTermsPrivacy(slug: slug));
//       if (response.statusCode == 200) {
//         final data = TermsPrivacyPolicyModel.fromRawJson(
//           json.encode(response.data),
//         );
//         return data;
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       // Handle generic errors
//       rethrow;
//     }
//   }
// }
