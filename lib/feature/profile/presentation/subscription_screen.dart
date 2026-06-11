import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_icons.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/profile/widgets/subscription_container_widgets.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/ui_helpers.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});
  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
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
                  SizedBox(height: 10.h),
                  CustomAppBar(
                    onBack: () {
                      NavigationService.goBack;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Container(
                      height: 62.h,
                      width: 72.w,
                      decoration: BoxDecoration(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.11),
                        borderRadius: BorderRadius.all(Radius.circular(22.r)),
                        border: Border.all(color: AppColor.c444F5E),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: SvgPicture.asset(AppIcons.circleIcon),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextFontStyle.textStyle28cFFFFFFPlayfairW400,
                        children: [
                          TextSpan(text: "Deepen Your\n"),
                          TextSpan(
                            text: "Stoic Practice",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.0),
                    child: Center(
                      child: Text(
                        'Subscribe now to reveal your pending AI reflection and unlock unlimited monthly wisdom.',
                        style: TextFontStyle.textStyle14cFFFFFFInterW300
                            .copyWith(
                              color: AppColor.cC8D2E6.withValues(alpha: .55),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(48.h),
                  Column(
                    children: [
                      PremiumFeatureTile(
                        icon: Icons.auto_awesome,
                        title: "Unlimited AI Reflections",
                        subtitle: "Deep situational context for every question",
                      ),

                      PremiumFeatureTile(
                        icon: Icons.search,
                        title: "Infinite Database Access",
                        subtitle: "Search full Stoic masterworks by any author",
                      ),

                      PremiumFeatureTile(
                        icon: Icons.notifications_none,
                        title: "Daily Mindful Reminders",
                        subtitle:
                            "Custom notifications tailored to your practice",
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(32.h),
                  GestureDetector(
                    onTap: () {
                      // NavigationService.navigateTo(Routes.subscriptionScreen);
                    },
                    child: Container(
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monthly Assess',
                                  style:
                                      TextFontStyle.textStyle16cFFFFFFInterW400,
                                ),
                                UIHelper.verticalSpace(8.h),
                                Text(
                                  '7-day free trial included',
                                  style: TextFontStyle.textStyle12interW400,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '\$4.99',
                                  style: TextFontStyle
                                      .textStyle28cFFFFFFPlayfairW400,
                                ),
                                UIHelper.verticalSpace(8.h),
                                Text(
                                  '7 month',
                                  style: TextFontStyle.textStyle12interW400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
