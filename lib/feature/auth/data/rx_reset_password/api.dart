// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:nick_oleo/constants/update_customer.dart';
// import 'package:nick_oleo/helpers/di.dart';
// import 'package:nick_oleo/helpers/toast.dart';
// import 'package:nick_oleo/networks/dio/dio.dart';
// import 'package:nick_oleo/networks/exception_handler/data_source.dart';
// import '/networks/endpoints.dart';

// final class ResetPassApi {
//   static final ResetPassApi _singleton = ResetPassApi._internal();
//   ResetPassApi._internal();
//   static ResetPassApi get instance => _singleton;

//   Future<Map> resetPass({
//     required String email,
//     required String password,
//     required String confirmPassword,
//     required String token,
//   }) async {
//     try {
//       FormData data = FormData.fromMap({
//         "email": email,
//         "password": password,
//         "password_confirmation": confirmPassword,
//         "token": token,
//       });
//       Response response = await postHttp(Endpoints.resetPassrod(), data);
//       // // authorization header is set before making the api call
//       DioSingleton.instance.update(appData.read(kKeyAccessToken));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // final data = jsonDecode(response.data);
//         final data = jsonDecode(jsonEncode(response.data));
//         ToastUtil.showShortToast("Password reset successful.");

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
