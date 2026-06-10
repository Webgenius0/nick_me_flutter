// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:thibaudbdx_flutter/assets_helper/app_colors.dart';
// import 'package:thibaudbdx_flutter/assets_helper/app_fonts.dart';
// import 'package:thibaudbdx_flutter/assets_helper/app_images.dart';

// class CustomSubscriptionButton extends StatelessWidget {
//   final String btnText;
//   final VoidCallback? onCall;

//   const CustomSubscriptionButton(
//       {super.key, required this.btnText, this.onCall});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: onCall,
//         child: Container(
//           height: 50.h,
//           decoration: BoxDecoration(
//             color: AppColor.cFFFFFF,
//             borderRadius: BorderRadius.circular(30.r),
//             border: Border.all(color: AppColor.primary_color),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 4.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   btnText,
//                   style: TextFontStyle.headline14c484848poppinsw400
//                       .copyWith(color: AppColor.c000000),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: AppColor.primary_color,
//                   radius: 20,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       AppImages.rightarrow,
//                       color: AppColor.cFFFFFF,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
