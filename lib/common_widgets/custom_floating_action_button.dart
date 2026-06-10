// import 'package:alexnahai/assets_helper/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomFloatingActionButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final bool showButtons;
//   final String icons;
//   final String? removeIcon;

//   const CustomFloatingActionButton({
//     super.key,
//     required this.onTap,
//     this.showButtons = false,
//     required this.icons, // 👈 default value
//     this.removeIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 10.h),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: 72.h,
//           width: 72.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(155.r),
//             color: const Color(0xFFF5F7F9),
//           ),
//           child: CircleAvatar(
//             backgroundColor: const Color(0xFFEEF0F2),
//             child: AnimatedRotation(
//               turns: showButtons ? 0.130 : 0,
//               duration: Duration(milliseconds: 200),
//               child: Container(
//                 height: 55.h,
//                 width: 60.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(155.r),
//                   color: AppColor.primary_color,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.asset(
//                     icons,
//                     height: 40.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),

//                 // Padding(
//                 //   padding: const EdgeInsets.all(8.0),
//                 //   child: Image.asset(
//                 //     showButtons ? (removeIcon ?? icons) : icons,
//                 //     // height: 40.h,
//                 //     fit: BoxFit.cover,
//                 //   ),
//                 // ),
//               ),

//               // Image.asset(icons),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
