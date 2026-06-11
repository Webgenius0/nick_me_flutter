import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/profile/widgets/privacy_buttet_widgets.dart';
import 'package:nick_me/feature/profile/widgets/privacy_section_widgets.dart';
import 'package:nick_me/helpers/navigation_service.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
                  Center(
                    child: Text(
                      "Privacy Policy",
                      style: TextFontStyle.textStyle16cFFFFFFInterW600,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Data Sharing and Disclosure",
                    content:
                        "We do not sell, rent, or trade your personal information to third parties.",
                  ),

                  SizedBox(height: 12.h),

                  const PrivacyBulletWidget(
                    text: "Service providers who assist in operating the App",
                  ),

                  const PrivacyBulletWidget(
                    text: "Legal authorities when required by law",
                  ),

                  const PrivacyBulletWidget(
                    text: "Business partners with your consent",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Data Security",
                    content:
                        "We implement appropriate security measures to protect your personal information. However, no method of electronic transmission or storage is completely secure, and we cannot guarantee absolute security.",
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
