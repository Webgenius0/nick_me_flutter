import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/profile/widgets/privacy_buttet_widgets.dart';
import 'package:nick_me/feature/profile/widgets/privacy_section_widgets.dart';
import 'package:nick_me/helpers/navigation_service.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
                      "Terms & Conditions",
                      style: TextFontStyle.textStyle16cFFFFFFInterW600,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Acceptance of Terms",
                    content:
                        "By downloading, accessing, or using this application, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, please do not use the application.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Use of the Application",
                    content:
                        "You agree to use the application only for lawful purposes and in a manner that does not violate the rights of others or restrict their use of the application.",
                  ),

                  SizedBox(height: 12.h),

                  const PrivacyBulletWidget(
                    text:
                        "Do not misuse or interfere with the application's services.",
                  ),

                  const PrivacyBulletWidget(
                    text:
                        "Do not attempt to gain unauthorized access to any part of the application.",
                  ),

                  const PrivacyBulletWidget(
                    text:
                        "Do not use the application for illegal or fraudulent activities.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "User Accounts",
                    content:
                        "You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Subscriptions and Payments",
                    content:
                        "Certain features of the application may require a paid subscription. All payments are processed through authorized payment providers and are subject to their terms and conditions.",
                  ),

                  SizedBox(height: 12.h),

                  const PrivacyBulletWidget(
                    text:
                        "Subscription fees may be charged on a recurring basis.",
                  ),

                  const PrivacyBulletWidget(
                    text:
                        "You may cancel your subscription according to the platform's cancellation policy.",
                  ),

                  const PrivacyBulletWidget(
                    text:
                        "Refund requests are subject to the policies of the payment provider.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Intellectual Property",
                    content:
                        "All content, features, logos, designs, and intellectual property within the application are owned by the company or its licensors and are protected by applicable laws.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Limitation of Liability",
                    content:
                        "The application is provided on an 'as is' and 'as available' basis. We make no warranties regarding the reliability, availability, or accuracy of the services provided.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Termination",
                    content:
                        "We reserve the right to suspend or terminate access to the application at any time if a user violates these Terms and Conditions or engages in harmful activities.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Changes to Terms",
                    content:
                        "We may update these Terms and Conditions from time to time. Continued use of the application after changes become effective constitutes acceptance of the revised terms.",
                  ),

                  SizedBox(height: 24.h),

                  PrivacySectionWidget(
                    title: "Contact Us",
                    content:
                        "If you have any questions regarding these Terms and Conditions, please contact us through the support channels provided within the application.",
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
