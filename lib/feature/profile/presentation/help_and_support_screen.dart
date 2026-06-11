import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/profile/widgets/privacy_buttet_widgets.dart';
import 'package:nick_me/feature/profile/widgets/privacy_section_widgets.dart';
import 'package:nick_me/helpers/navigation_service.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});
  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
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
                      "Help & Support",
                      style: TextFontStyle.textStyle16cFFFFFFInterW600,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  PrivacySectionWidget(
                    title: "How Can We Help?",
                    content:
                        "We are committed to providing the best experience possible. If you encounter any issues while using the application, our support team is here to assist you.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Common Support Topics",
                    content:
                        "You can contact us for assistance regarding the following topics:",
                  ),

                  SizedBox(height: 12.h),

                  const PrivacyBulletWidget(
                    text: "Account registration and login issues",
                  ),

                  const PrivacyBulletWidget(
                    text: "Subscription and payment related questions",
                  ),

                  const PrivacyBulletWidget(
                    text: "Technical problems and app performance issues",
                  ),

                  const PrivacyBulletWidget(
                    text: "Feature requests and general feedback",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Response Time",
                    content:
                        "Our support team aims to respond to all inquiries within 24 to 48 business hours. Response times may vary depending on the volume of requests.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Contact Support",
                    content:
                        "If you need assistance, please reach out to our support team using one of the methods below.",
                  ),

                  SizedBox(height: 12.h),

                  const PrivacyBulletWidget(text: "Email: support@yourapp.com"),

                  const PrivacyBulletWidget(text: "Website: www.yourapp.com"),

                  const PrivacyBulletWidget(text: "In-App Support Center"),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Report a Problem",
                    content:
                        "When reporting an issue, please provide as much detail as possible, including your device model, operating system version, and steps to reproduce the problem. This helps us resolve issues more quickly.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Feedback and Suggestions",
                    content:
                        "We value your feedback and continuously work to improve our services. If you have ideas, suggestions, or feature requests, we would love to hear from you.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Frequently Asked Questions",
                    content:
                        "Please check our FAQ section before contacting support, as many common questions may already be answered there.",
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
