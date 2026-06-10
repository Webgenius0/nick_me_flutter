import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class WisdomActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const WisdomActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColor.cFFFFFF.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColor.cFFFFFF.withValues(alpha: 0.1),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: AppColor.cFFFFFF.withValues(alpha: 0.6),
                  size: 24.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  label,
                  style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                    color: AppColor.cFFFFFF.withValues(alpha: 0.4),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
