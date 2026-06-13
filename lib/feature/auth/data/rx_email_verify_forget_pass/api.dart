// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:nick_oleo/helpers/toast.dart';
// import 'package:nick_oleo/networks/dio/dio.dart';
// import 'package:nick_oleo/networks/exception_handler/data_source.dart';
// import '/networks/endpoints.dart';

// final class EmailVerifyForgetPassApi {
//   static final EmailVerifyForgetPassApi _singleton =
//       EmailVerifyForgetPassApi._internal();
//   EmailVerifyForgetPassApi._internal();
//   static EmailVerifyForgetPassApi get instance => _singleton;

//   Future<Map> emailVerifyForgetPass({
//     required String email,
//     required String otp,
//   }) async {
//     try {
//       FormData data = FormData.fromMap({"email": email, "otp": otp});
//       Response response = await postHttp(Endpoints.emailOtpForgetPass(), data);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // final data = jsonDecode(response.data);
//         final data = jsonDecode(jsonEncode(response.data));
//         ToastUtil.showShortToast("Email verified successful");
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

// final class MysingletonClass {
//   // private constructor.
//   MysingletonClass._internal();

//   //only one object is created.
//   static final MysingletonClass _singleton = MysingletonClass._internal();

//   static MysingletonClass get instance => _singleton;
// }
