import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';

class SavedQuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  final String source;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const SavedQuoteCard({
    super.key,
    required this.quote,
    required this.author,
    required this.source,
    this.isFavorite = true,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColor.c444F5E.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColor.cFFFFFF.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? AppColor.c121212
                      : AppColor.cFFFFFF.withValues(alpha: 0.5),
                  size: 18.sp,
                ),
              ),
            ),
          ),
          Text(
            "“$quote”",
            style: TextFontStyle.textStyle28cFFFFFFPlayfairW400.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.4,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Container(
                width: 20.w,
                height: 1.h,
                color: AppColor.cFFFFFF.withValues(alpha: 0.2),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  "$author · $source",
                  style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                    color: AppColor.cFFFFFF.withValues(alpha: 0.3),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
