import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/feature/home/widgets/author_chip.dart';
import 'package:nick_me/feature/saved/widgets/saved_quote_card.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String _selectedAuthor = "All";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splashScreen),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "COLLECTED",
                    style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                      color: AppColor.cFFFFFF.withValues(alpha: 0.4),
                      letterSpacing: 2.0,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Saved Wisdom",
                    style: TextFontStyle.textStyle28cFFFFFFPlayfairW400
                        .copyWith(fontSize: 32.sp),
                  ),
                  SizedBox(height: 24.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          [
                            "All",
                            "Marcus Aurelius",
                            "Seneca",
                            "Epictetus",
                            "Musonius Rufus",
                          ].map((author) {
                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: AuthorChip(
                                label: author,
                                isActive: _selectedAuthor == author,
                                onTap: () {
                                  setState(() {
                                    _selectedAuthor = author;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SavedQuoteCard(
                    quote:
                        "Waste no more time arguing about what a good man should be. Be one.",
                    author: "Marcus Aurelius",
                    source: "Meditations, X.16",
                  ),
                  SavedQuoteCard(
                    quote:
                        "It is not the man who has too little that is poor, but the man who hankers after more.",
                    author: "Seneca",
                    source: "Letters to Lucilius, II.6",
                    isFavorite: false,
                  ),
                  SizedBox(height: 100.h), // Bottom nav spacer
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
