import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/feature/home/widgets/author_chip.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedAuthor = "Any of the authors";
  final PageController _virtueController = PageController();

  final List<Map<String, String>> _virtues = [
    {
      "title": "Wisdom",
      "subtitle": "Sophia",
      "description":
          "The ability to discern what is good, bad, and indifferent. Wisdom guides all other virtues and allows us to navigate life's complexities with clarity and sound judgment.",
    },
    {
      "title": "Justice",
      "subtitle": "Dikaiosyne",
      "description":
          "Treating others with fairness, honesty, and respect. Justice is the foundation of all human relationships and the cornerstone of a well-ordered society.",
    },
    {
      "title": "Temperance",
      "subtitle": "Sophrosyne",
      "description":
          "Self-discipline and moderation in all things. Temperance keeps our desires and passions in check, allowing reason to guide our actions rather than impulse.",
    },
    {
      "title": "Courage",
      "subtitle": "Andreia",
      "description":
          "Acting rightly in the face of fear, pain, or adversity. Courage is not the absence of fear, but the resolve to do what is right regardless of the cost.",
    },
  ];

  int _currentVirtueIndex = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    Future.doWhile(() async {
      await Future.delayed(Duration(seconds: 12));
      if (!mounted || !_virtueController.hasClients) return false;
      _currentVirtueIndex++;
      await _virtueController.animateToPage(
        _currentVirtueIndex,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );

      return mounted;
    });
  }

  @override
  void dispose() {
    _virtueController.dispose();
    super.dispose();
  }

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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "GOOD AFTERNOON",
                  //       style: TextFontStyle.textStyle14cFFFFFFInterW500
                  //           .copyWith(
                  //             color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                  //             letterSpacing: 2.0,
                  //           ),
                  //     ),
                  //     CircleAvatar(
                  //       radius: 20.r,
                  //       backgroundImage: const NetworkImage(
                  //         "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80",
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 30.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 16.h,
                    children:
                        [
                          "Marcus Aurelius",
                          "Seneca",
                          "Epictetus",
                          "Musonius Rufus",
                          "Any of the authors",
                        ].map((author) {
                          return AuthorChip(
                            label: author,
                            isActive: _selectedAuthor == author,
                            onTap: () {
                              setState(() {
                                _selectedAuthor = author;
                              });
                            },
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    "STOIC VIRTUES",
                    style: TextFontStyle.textStyle13cFFFFFFInterW500.copyWith(
                      color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 180.h,
                    child: PageView.builder(
                      controller: _virtueController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        setState(() {
                          _currentVirtueIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final virtue = _virtues[index % _virtues.length];

                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColor.c444F5E.withValues(alpha: 1),
                                AppColor.c0B0D10.withValues(alpha: 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    virtue["title"]!,
                                    style: TextFontStyle
                                        .textStyle16cFFFFFFInterW600,
                                  ),
                                  Text(
                                    " - ${virtue["subtitle"]}",
                                    style: TextFontStyle
                                        .textStyle16cFFFFFFInterW400
                                        .copyWith(
                                          color: AppColor.cFFFFFF.withValues(
                                            alpha: 0.3,
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Divider(
                                color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                child: Text(
                                  virtue["description"]!,
                                  style:
                                      TextFontStyle.textStyle14cFFFFFFInterW300,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.all(20.w),
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         AppColor.c444F5E.withValues(alpha: 1),
                  //         AppColor.c0B0D10.withValues(alpha: 1),
                  //       ],
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //     ),
                  //     borderRadius: BorderRadius.circular(16.r),
                  //     border: Border.all(
                  //       color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                  //     ),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Text(
                  //             "Wisdom",
                  //             style: TextFontStyle.textStyle16cFFFFFFInterW600,
                  //           ),
                  //           Text(
                  //             " - Sophia",
                  //             style: TextFontStyle.textStyle16cFFFFFFInterW400
                  //                 .copyWith(
                  //                   color: AppColor.cFFFFFF.withValues(
                  //                     alpha: 0.3,
                  //                   ),
                  //                 ),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(height: 8.h),
                  //       Divider(color: AppColor.cFFFFFF.withValues(alpha: 0.1)),
                  //       SizedBox(height: 8.h),
                  //       Text(
                  //         "The ability to discern what is good, bad, and indifferent. Wisdom guides all other virtues and allows us to navigate life's complexities with clarity and sound judgment.",
                  //         style: TextFontStyle.textStyle14cFFFFFFInterW300,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 40.h),
                  RichText(
                    text: TextSpan(
                      style: TextFontStyle.textStyle28cFFFFFFPlayfairW400,
                      children: [
                        TextSpan(text: "What troubles "),
                        TextSpan(
                          text: "your mind?",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.c444F5E.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                      ),
                    ),
                    child: TextField(
                      style: TextFontStyle.textStyle16cFFFFFFInterW400,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Describe your struggle or question...",
                        hintStyle: TextFontStyle.textStyle14cFFFFFFInterW500
                            .copyWith(
                              color: AppColor.cFFFFFF.withValues(alpha: 0.3),
                            ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomSaveButton(
                    btnText: "Ask The Stoics",
                    onCall: () {
                      NavigationService.navigateTo(Routes.generateWisdomScreen);
                    },
                  ),

                  // SizedBox(height: 120.h), // Spacer for bottom nav
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
