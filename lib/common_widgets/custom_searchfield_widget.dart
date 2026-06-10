// import 'package:alexnahai/assets_helper/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CustomSearchFieldWidget extends StatelessWidget {
//   final TextEditingController controller;
//   final Function(String) onChanged;
//   final String hintText;

//   const CustomSearchFieldWidget({
//     super.key,
//     required this.controller,
//     required this.onChanged,
//     this.hintText = "Search...",
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         hintText: hintText.tr,
//         prefixIcon: const Icon(Icons.search),
//         filled: true,
//         fillColor: AppColor.cFAFAFA,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }
