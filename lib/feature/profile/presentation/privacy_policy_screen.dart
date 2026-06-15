import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hive/hive.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/profile/model/privacy_policy_model.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/ui_helpers.dart';
import 'package:nick_me/networks/api_acess.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final Box<String> _privacyBox = Hive.box<String>('privacyPolicyCache');

  @override
  void initState() {
    super.initState();
    getPrivacyPolicyRXObj.getPrivacyPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: StreamBuilder<PrivacyPolicyModel>(
                        stream: getPrivacyPolicyRXObj.privacyPolicy,
                        builder: (context, snapshot) {
                          final cachedHtml = _privacyBox.get('privacyHtml');

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            if (cachedHtml != null && cachedHtml.isNotEmpty) {
                              return _buildHtmlContent(
                                'Privacy Policy',
                                cachedHtml,
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasData && snapshot.data?.data != null) {
                            final privacyData = snapshot.data!.data!;
                            _privacyBox.put(
                              'privacyHtml',
                              privacyData.content ?? '',
                            );
                            return _buildHtmlContent(
                              privacyData.title ?? 'Privacy Policy',
                              privacyData.content ?? '',
                            );
                          } else if (snapshot.hasError) {
                            if (cachedHtml != null && cachedHtml.isNotEmpty) {
                              return _buildHtmlContent(
                                'Privacy Policy (Offline)',
                                cachedHtml,
                              );
                            }
                            return Center(
                              child: Text(
                                'Error loading data'.tr,
                                style: TextFontStyle.textStyle12interW400,
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                'No content available'.tr,
                                style: TextFontStyle.textStyle12interW400,
                              ),
                            );
                          }
                        },
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

  Widget _buildHtmlContent(String title, String htmlContent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextFontStyle.textStyle24SpaceGroteskW700),
        UIHelper.verticalSpace(20.h),
        Html(
          data: htmlContent,
          style: {
            "body": Style(
              color: Colors.white,
              fontSize: FontSize(14.sp),
              fontWeight: FontWeight.w400,
              margin: Margins.zero,
              padding: HtmlPaddings.zero,
            ),
          },
        ),
      ],
    );
  }
}
