import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;
  final bool showArrow;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColor.c444F5E.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isDestructive
                    ? Colors.redAccent
                    : AppColor.cFFFFFF.withValues(alpha: 0.6),
                size: 20.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextFontStyle.textStyle16cFFFFFFInterW600.copyWith(
                  color: isDestructive ? Colors.redAccent : AppColor.cFFFFFF,
                  fontSize: 15.sp,
                ),
              ),
            ),
            if (showArrow)
              Icon(
                Icons.chevron_right,
                color: AppColor.cFFFFFF.withValues(alpha: 0.3),
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
