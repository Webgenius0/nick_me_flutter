import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class AuthorChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const AuthorChip({
    super.key,
    required this.label,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          // color: isActive
          //     ? Colors.transparent
          //     : AppColor.cFFFFFF.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(30.r),

          border: isActive
              ? null
              : Border.all(color: AppColor.cFFFFFF.withValues(alpha: 0.05)),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : null,
          gradient: isActive
              ? LinearGradient(
                  colors: [
                    AppColor.c0B0D10.withValues(alpha: 1),
                    AppColor.c444F5E.withValues(alpha: 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : LinearGradient(
                  colors: [
                    AppColor.cFFFFFF.withValues(alpha: 0.08),
                    AppColor.cFFFFFF.withValues(alpha: 0.08),
                  ],
                ),
        ),
        child: Text(
          label,
          style:
              (isActive
                      ? TextFontStyle.textStyle14cFFFFFFInterW500
                      : TextFontStyle.textStyle14cFFFFFFInterW500)
                  .copyWith(
                    color: AppColor.cFFFFFF.withValues(
                      alpha: isActive ? 1.0 : 0.4,
                    ),
                  ),
        ),
      ),
    );
  }
}
