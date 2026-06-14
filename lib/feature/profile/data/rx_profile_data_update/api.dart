import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/endpoints.dart';
import 'package:nick_me/networks/exception_handler/data_source.dart';
import '../../../../../networks/dio/dio.dart';

final class UpdateProfileApi {
  static final UpdateProfileApi _singleton = UpdateProfileApi._internal();
  UpdateProfileApi._internal();
  static UpdateProfileApi get instance => _singleton;

  Future<Map> updateProfile({String? name, File? avatar}) async {
    try {
      // Step 1: Create map
      Map<String, dynamic> dataMap = {"name": name};

      FormData formData = FormData.fromMap(dataMap);

      if (avatar != null && await File(avatar.path).exists()) {
        formData.files.add(
          MapEntry('avatar', await MultipartFile.fromFile(avatar.path)),
        );
      }

      // Step 6: Send request
      Response response = await postHttp(Endpoints.updateProfile(), formData);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data)); 
        ToastUtil.showShortToast(data['message']);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
