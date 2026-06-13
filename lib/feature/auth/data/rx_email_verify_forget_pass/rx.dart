// import 'package:dio/dio.dart';
// import 'package:nick_oleo/constants/update_customer.dart';
// import 'package:nick_oleo/feature/auth/data/rx_email_verify_forget_pass/api.dart';
// import 'package:nick_oleo/helpers/di.dart';
// import 'package:nick_oleo/networks/dio/dio.dart';
// import 'package:nick_oleo/networks/stream_cleaner.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../../../../../networks/rx_base.dart';

// final class EmailVerifyForgetPassRx extends RxResponseInt<Map> {
//   String? errorMessage;
//   final api = EmailVerifyForgetPassApi.instance;
//   EmailVerifyForgetPassRx({required super.empty, required super.dataFetcher});
//   ValueStream get getFileData => dataFetcher.stream;

//   Future<bool> emailVerifyForgetPass({
//     required String email,
//     required String otp,
//   }) async {
//     try {
//       final data = await api.emailVerifyForgetPass(email: email, otp: otp);
//       handleSuccessWithReturn(data);
//       return true;
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleSuccessWithReturn(data) async {
//     totalDataClean();

//     String? accessToken = data['token'];
//     // await appData.write(kKeyIsLoggedIn, true);
//     await appData.write(kKeyAccessToken, accessToken);
//     String token = appData.read(kKeyAccessToken);
//     dataFetcher.sink.add(data);
//     DioSingleton.instance.update(token);
//     return data;
//   }

//   @override
//   handleErrorWithReturn(error) {
//     if (error is DioException) {
//       if (error.response!.statusCode == 400) {
//         errorMessage = error.response!.data['message'];
//       } else if (error.response!.data['code'] == 403) {
//         errorMessage = error.response!.data['message'];
//       } else {
//         errorMessage = error.response!.data['message'];
//       }
//     }
//     // log(error.toString());
//     dataFetcher.sink.addError(error);
//     return false;
//   }
// }
