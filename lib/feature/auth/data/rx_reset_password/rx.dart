// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:nick_oleo/feature/auth/data/rx_reset_password/api.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../../../../../networks/rx_base.dart';

// final class ResetPassRX extends RxResponseInt<Map> {
//   String? errorMessage;
//   final api = ResetPassApi.instance;
//   ResetPassRX({required super.empty, required super.dataFetcher});
//   ValueStream get getFileData => dataFetcher.stream;

//   Future<bool> resetPass({
//     required String email,
//     required String password,
//     required String confPassword,
//     required String token,
//   }) async {
//     try {
//       Map data = await api.resetPass(
//         email: email,
//         password: password,
//         confirmPassword: confPassword,
//         token: token,
//       );
//       handleSuccessWithReturn(data);
//       return true;
//     } catch (error) {
//       log('Error catch is here : ${error.toString()}');
//       return handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleSuccessWithReturn(data) async {
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
