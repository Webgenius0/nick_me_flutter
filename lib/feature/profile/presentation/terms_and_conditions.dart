import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hive/hive.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/feature/profile/model/terms_and_contitions.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/ui_helpers.dart';
import 'package:nick_me/networks/api_acess.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final Box<String> _termsBox = Hive.box<String>('termsCache');

  @override
  void initState() {
    super.initState();
    getTermsAndConditionRXObj.getTermsAndConditions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: StreamBuilder<TermsPrivacyPolicyModel>(
                      stream: getTermsAndConditionRXObj.termsPrivacyPolicy,
                      builder: (context, snapshot) {
                        final cachedHtml = _termsBox.get('termsHtml');

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // If we have cached data, show it immediately while loading
                          if (cachedHtml != null && cachedHtml.isNotEmpty) {
                            return _buildHtmlContent(
                              'Terms & Conditions'.tr,
                              cachedHtml,
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasData && snapshot.data?.data != null) {
                          final termData = snapshot.data!.data!;
                          _termsBox.put('termsHtml', termData.content ?? '');
                          return _buildHtmlContent(
                            termData.title ?? 'Terms & Conditions'.tr,
                            termData.content ?? '',
                          );
                        } else if (snapshot.hasError) {
                          // Fallback to cache on error
                          if (cachedHtml != null && cachedHtml.isNotEmpty) {
                            return _buildHtmlContent(
                              'Terms & Conditions (Offline)'.tr,
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
