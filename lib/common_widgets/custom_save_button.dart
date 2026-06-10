import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/helpers/ui_helpers.dart';

class CustomSaveButton extends StatelessWidget {
  final String btnText;
  final String? icon;
  final Color? btnColor;
  final Color? txtColor;
  final Color? borderColor;
  final VoidCallback? onCall;
  final List<Color>? gradientColors;

  const CustomSaveButton({
    super.key,
    required this.btnText,
    this.onCall,
    this.btnColor,
    this.borderColor,
    this.txtColor,
    this.gradientColors,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCall,
      child: Container(
        // height: 56.h,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(16.r),
          color: AppColor.cE8EDF5,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) SvgPicture.asset(icon!),
              UIHelper.horizontalSpace(12.w),
              Text(
                btnText,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16c191A1FinterW600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
