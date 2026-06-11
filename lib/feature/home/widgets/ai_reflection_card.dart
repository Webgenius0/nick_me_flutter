import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class AiReflectionCard extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onChanged;
  final String content;

  const AiReflectionCard({
    super.key,
    required this.isEnabled,
    required this.onChanged,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        // color: AppColor.cFFFFFF.withValues(alpha: 0.08),
        gradient: LinearGradient(
          colors: [
            AppColor.c444F5E.withValues(alpha: 0.9),
            AppColor.c0B0D10.withValues(alpha: 0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColor.cFFFFFF.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: AppColor.cFFFFFF.withValues(alpha: 0.4),
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  "AI Reflection",
                  style: TextFontStyle.textStyle16cFFFFFFInterW600,
                ),
              ),
              Switch(
                value: isEnabled,
                activeColor: AppColor.c8896AC,
                activeTrackColor: AppColor.c242424,
                inactiveThumbColor: AppColor.c8896AC,
                inactiveTrackColor: AppColor.c191A1F,
                onChanged: onChanged,
              ),
            ],
          ),
          if (isEnabled) ...[
            SizedBox(height: 16.h),
            Divider(color: AppColor.cFFFFFF.withValues(alpha: 0.05)),
            SizedBox(height: 16.h),
            Text(content, style: TextFontStyle.textStyle14cFFFFFFInterW300),
          ],
        ],
      ),
    );
  }
}
