import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nick_me/assets_helper/app_colors.dart';

class TextFontStyle {
  TextFontStyle._();

  /*custom font use anywhere*/

  static final textStyle30UrbanistW500 = GoogleFonts.urbanist(
    color: AppColor.cFFFFFF,
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
  );

  static final textStyle24c848484poppinsW400 = GoogleFonts.poppins(
    color: AppColor.cFFFFFF,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.33.h,
    letterSpacing: 0,
  );

  static final textStyle16c191A1FinterW600 = GoogleFonts.inter(
    color: AppColor.c191A1F,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static final textStyle14cA8A8A8W500 = GoogleFonts.publicSans(
    color: AppColor.cFFFFFF,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  static final textStyle16cFFFFFFW600 = GoogleFonts.inter(
    color: AppColor.cFFFFFF,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static final textStyle24SpaceGroteskW700 = GoogleFonts.spaceGrotesk(
    color: AppColor.cFFFFFF,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  static final textStyle13interW600 = GoogleFonts.inter(
    color: AppColor.c96A89A,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );

  static final textStyle12interW400 = GoogleFonts.inter(
    color: AppColor.cB4C3DC.withValues(alpha: 0.5),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static final textStyle14cFFFFFFInterW500 = GoogleFonts.inter(
    color: AppColor.cFFFFFF,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static final textStyle14cFFFFFFInterW300 = GoogleFonts.inter(
    color: AppColor.cE8EDF5.withValues(alpha: 0.5),
    fontSize: 14.sp,
    height: 1.5,
    fontWeight: FontWeight.w300,
  );

  static final textStyle13cFFFFFFInterW500 = GoogleFonts.inter(
    color: AppColor.cFFFFFF,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );

  static final textStyle16cFFFFFFInterW600 = GoogleFonts.inter(
    color: AppColor.cFFFFFF,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static final textStyle16cFFFFFFInterW400 = GoogleFonts.inter(
    color: AppColor.cFFFFFF,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final textStyle28cFFFFFFPlayfairW400 = GoogleFonts.playfairDisplay(
    color: AppColor.cFFFFFF,
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
  );

  static final textStyle16c0E1116InterW600 = GoogleFonts.inter(
    color: AppColor.c0E1116,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
