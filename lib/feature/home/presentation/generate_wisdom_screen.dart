import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/home/widgets/ai_reflection_card.dart';
import 'package:nick_me/feature/home/widgets/wisdom_action_button.dart';
import 'package:nick_me/feature/home/widgets/wisdom_quote_card.dart';
import 'package:nick_me/helpers/ui_helpers.dart';
import 'package:share_plus/share_plus.dart';

class GenerateWisdomScreen extends StatefulWidget {
  const GenerateWisdomScreen({super.key});
  @override
  State<GenerateWisdomScreen> createState() => _GenerateWisdomScreenState();
}

class _GenerateWisdomScreenState extends State<GenerateWisdomScreen> {
  bool _isAiReflectionEnabled = true;
  void _showAppShareOptionNew(BuildContext context) {
    const appLink =
        'https://play.google.com/store/apps/details?id=com.pchscareconnect&pcampaignid=web_share';
    Share.share(appLink, subject: 'PCHS App');
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    CustomAppBar(),
                    SizedBox(height: 30.h),
                    WisdomQuoteCard(
                      quote:
                          "It is not the man who has too little that is poor, but the man who hankers after more.",
                      author: "Seneca",
                      source: "Letters to Lucilius, Book -5",
                    ),
                    SizedBox(height: 20.h),
                    AiReflectionCard(
                      isEnabled: _isAiReflectionEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isAiReflectionEnabled = value;
                        });
                      },
                      content:
                          "Epictetus, born a slave, understood the Stoic paradox: those with the least external freedom can achieve the greatest inner freedom. Act with full effort on what you control, accept all outcomes with equanimty.",
                    ),
                    UIHelper.verticalSpace(24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WisdomActionButton(
                          icon: Icons.favorite_border,
                          label: "Save",
                          onTap: () {},
                        ),
                        SizedBox(width: 16.w),
                        WisdomActionButton(
                          icon: Icons.share_outlined,
                          label: "Share",
                          onTap: () {
                            _showAppShareOptionNew(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
