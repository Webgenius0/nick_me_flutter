import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class WisdomQuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  final String source;

  const WisdomQuoteCard({
    super.key,
    required this.quote,
    required this.author,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColor.c444F5E.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColor.cFFFFFF.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.format_quote,
            color: AppColor.cFFFFFF.withValues(alpha: 0.1),
            size: 40.sp,
          ),
          Text(
            quote,
            style: TextFontStyle.textStyle28cFFFFFFPlayfairW400.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
          SizedBox(height: 40.h),
          Row(
            children: [
              Container(
                width: 24.w,
                height: 1.h,
                color: AppColor.cFFFFFF.withValues(alpha: 0.2),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      author,
                      style: TextFontStyle.textStyle16cFFFFFFInterW600,
                    ),
                    Text(
                      source,
                      style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
