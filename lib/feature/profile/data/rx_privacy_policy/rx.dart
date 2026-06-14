// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:nick_me/helpers/toast.dart';

// import 'package:rxdart/rxdart.dart';
// import '../../../../networks/rx_base.dart';

// final class PrivacyPolicyRX extends RxResponseInt<TermsPrivacyPolicyModel> {
//   final api = TermsPrivacyPolicyApi.instance;
//   PrivacyPolicyRX({required super.empty, required super.dataFetcher});

//   ValueStream<TermsPrivacyPolicyModel> get termsPrivacyPolicy =>
//       dataFetcher.stream;
//   Future<bool> getTermsPrivacyPolicy({required String slug}) async {
//     try {
//       TermsPrivacyPolicyModel data = await api.getTermsPrivacyPolicy(
//         slug: slug,
//       );
//       handleSuccessWithReturn(data);
//       ToastUtil.showShortToast('$slug fetched successfully');
//       return true;
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleErrorWithReturn(dynamic error) {
//     if (error is DioException) {
//       if (error.response!.statusCode == 400) {
//         ToastUtil.showShortToast(error.response!.data["error"]);
//       } else if (error.response!.statusCode == 401) {
//         // NavigationService.popAndReplace(Routes.newScreen);
//       } else {
//         ToastUtil.showShortToast(error.response!.data["error"]);
//       }
//     }
//     log(error.toString());
//     dataFetcher.sink.addError(error);
//     // throw error;
//     return false;
//   }
// }
