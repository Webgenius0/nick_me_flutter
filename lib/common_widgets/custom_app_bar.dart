import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/helpers/navigation_service.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? trailing;
  final VoidCallback? onBack;

  const CustomAppBar({super.key, this.trailing, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBack ?? () => NavigationService.goBack,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColor.cFFFFFF.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColor.cFFFFFF.withValues(alpha: 0.1),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back, color: AppColor.c8896AC, size: 18.sp),
                SizedBox(width: 8.w),
                Text(
                  "Back",
                  style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                    color: AppColor.c8896AC,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
