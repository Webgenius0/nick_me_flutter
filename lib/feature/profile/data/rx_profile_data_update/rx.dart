// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:nick_oleo/networks/rx_base.dart';
// import 'package:nick_oleo/helpers/toast.dart';
// import 'api.dart';

// final class UpdateProfileRx extends RxResponseInt<Map> {
//   final api = UpdateProfileApi.instance;

//   UpdateProfileRx({required super.empty, required super.dataFetcher});

//   ValueStream get getFileData => dataFetcher.stream;

//   Future<bool> updateProfile({
//     String? name,
//     String? phone,
//     String? gender,
//     File? avatar,
//     String? location,
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
//       Map data = await api.updateProfile(
//         name: name,
//         phone: phone,
//         gender: gender,
//         avatar: avatar,
//         birthdate: birthdate,
//         bio: bio,
//         showGender: showGender,
//         address: address,
//         latitude: latitude,
//         longitude: longitude,
//         distancePreference: distancePreference,
//         holidayInterests: holidayInterests,
//         lifestyleHabits: lifestyleHabits,
//         pets: pets,
//         educationLevel: educationLevel,
//         drinkingFrequency: drinkingFrequency,
//         smokingStatus: smokingStatus,
//         workoutStatus: workoutStatus,
//         budget: budget,
//         travelDestination: travelDestination,
//       );

//       handleSuccessWithReturn(data);
//       ToastUtil.showShortToast('Profile updated successfully');
//       return true;
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleErrorWithReturn(dynamic error) {
//     if (error is DioException && error.response != null) {
//       final message = error.response!.data["message"];
//       if (message is String) {
//         ToastUtil.showShortToast(message);
//         return false;
//       }

//       if (message is Map) {
//         final errorMessage = message.values
//             .whereType<List>()
//             .map((e) => e.first)
//             .join("\n");
//         ToastUtil.showShortToast(errorMessage);
//         return false;
//       }
//     }
//     ToastUtil.showShortToast("Something went wrong");
//     return false;
//   }
// }
