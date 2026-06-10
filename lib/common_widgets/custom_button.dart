import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/helpers/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final String? icon;
  final Color? btnColor;
  final Color? txtColor;
  final Color? borderColor;
  final VoidCallback? onCall;

  const CustomButton({
    super.key,
    required this.btnText,
    this.onCall,
    this.btnColor,
    this.borderColor,
    this.txtColor,

    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCall,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(100.r),
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
                style: TextFontStyle.textStyle16c191A1FinterW600.copyWith(
                  fontSize: 18.sp,
                  color: txtColor ?? AppColor.cFFFFFF,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
