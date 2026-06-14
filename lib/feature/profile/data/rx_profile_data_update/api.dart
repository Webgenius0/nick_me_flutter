// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:nick_me/helpers/toast.dart';
// import 'package:nick_me/networks/endpoints.dart';
// import 'package:nick_me/networks/exception_handler/data_source.dart';
// import '../../../../../networks/dio/dio.dart';

// final class UpdateProfileApi {
//   static final UpdateProfileApi _singleton = UpdateProfileApi._internal();
//   UpdateProfileApi._internal();
//   static UpdateProfileApi get instance => _singleton;

//   Future<Map> updateProfile({
//     String? name,
//     String? userName,
//     File? avatar,
//     String? phone,
//     String? gender,
//     String? birthdate,
//     String? bio,
//     String? showGender,
//     String? address,
//     String? latitude,
//     String? longitude,
//     String? distancePreference,
//     List<String>? holidayInterests,
//     List<String>? lifestyleHabits,
//     List<String>? pets,
//     String? educationLevel,
//     String? drinkingFrequency,
//     String? smokingStatus,
//     String? workoutStatus,
//     String? budget,
//     String? travelDestination,
//   }) async {
//     try {
//       // Step 1: Create map
//       Map<String, dynamic> dataMap = {
//         "name": name,
//         "phone": phone,
//         "gender": gender,
//         "birthdate": birthdate,
//         "bio": bio,
//         "show_gender": showGender,
//         "address": address,
//         "latitude": latitude,
//         "longitude": longitude,
//         "distance_preference": distancePreference,
//         "holiday_interests": holidayInterests,
//         "lifestyle_habits": lifestyleHabits,
//         "pets": pets,
//         "education_level": educationLevel,
//         "drinking_frequency": drinkingFrequency,
//         "smoking_status": smokingStatus,
//         "workout_status": workoutStatus,
//         "budget": budget,
//         "travel_destination": travelDestination,
//       };

//       // Step 2: Remove null values
//       dataMap.removeWhere((key, value) => value == null);
//       // Step 3: Convert to FormData
//       FormData formData = FormData.fromMap(dataMap);
//       // Step 4: Add list fields with [] format
//       void addListField(String key, List<String>? list) {
//         if (list != null && list.isNotEmpty) {
//           for (var item in list) {
//             formData.fields.add(MapEntry("$key[]", item));
//           }
//         }
//       }

//       addListField("pets", pets);
//       addListField("holiday_interests", holidayInterests);
//       addListField("lifestyle_habits", lifestyleHabits);
//       // Step 5: Add avatar if exists
//       if (avatar != null && await File(avatar.path).exists()) {
//         formData.files.add(
//           MapEntry('avatar', await MultipartFile.fromFile(avatar.path)),
//         );
//       }

//       // Step 6: Send request
//       Response response = await postHttp(Endpoints.updateProfile(), formData);

//       if (response.statusCode == 200) {
//         final data = json.decode(json.encode(response.data));
//         ToastUtil.showShortToast(data['message']);
//         return data;
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
