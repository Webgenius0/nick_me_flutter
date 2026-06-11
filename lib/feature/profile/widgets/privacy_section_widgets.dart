import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class PrivacySectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const PrivacySectionWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextFontStyle.textStyle16cFFFFFFInterW600,
        ),
        SizedBox(height: 8.h),
        Text(
          content,
          style: TextFontStyle.textStyle13cFFFFFFInterW500.copyWith(
            color: Colors.white70,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}