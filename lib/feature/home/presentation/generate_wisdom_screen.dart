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
import 'package:nick_me/networks/api_acess.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/feature/home/model/wisdom_generate_model.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';

class GenerateWisdomScreen extends StatefulWidget {
  const GenerateWisdomScreen({super.key});

  @override
  State<GenerateWisdomScreen> createState() => _GenerateWisdomScreenState();
}

class _GenerateWisdomScreenState extends State<GenerateWisdomScreen> {
  bool _isAiReflectionEnabled = true;

  void _showAppShareOptionNew(BuildContext context, String? shareLink) {
    final link =
        shareLink ??
        'https://play.google.com/store/apps/details?id=com.pchscareconnect&pcampaignid=web_share';
    Share.share(link, subject: 'Ask The Stoics');
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
                    StreamBuilder<WisdomGenerateModel>(
                      stream: getWisdomGenerateRXObj.wisdom,
                      initialData: getWisdomGenerateRXObj.wisdom.valueOrNull,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            !snapshot.hasData) {
                          return SizedBox(
                            height: 350.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (snapshot.hasError) {
                          return SizedBox(
                            height: 350.h,
                            child: Center(
                              child: Text(
                                "Failed to generate wisdom. Please try again.",
                                textAlign: TextAlign.center,
                                style: TextFontStyle.textStyle14cFFFFFFInterW500
                                    .copyWith(color: Colors.redAccent),
                              ),
                            ),
                          );
                        }

                        final responseData = snapshot.data;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WisdomQuoteCard(
                              quote: responseData?.data?.wisdom?.stoic ?? "",
                              author: responseData?.data?.author?.name ?? "",
                              source: responseData?.data?.wisdom?.book ?? "",
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
                                  responseData?.data?.reflection ??
                                  "No AI reflection available.",
                            ),
                            UIHelper.verticalSpace(24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WisdomActionButton(
                                  icon: (responseData?.data?.isSaved ?? false)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  label: (responseData?.data?.isSaved ?? false)
                                      ? "Saved"
                                      : "Save",
                                  onTap: () async {
                                    final slug =
                                        responseData?.data?.wisdom?.slug;
                                    if (slug != null && slug.isNotEmpty) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) =>
                                            loadingIndicatorCircle(
                                              context: context,
                                            ),
                                      );
                                      bool success = await getSaveWisdomRxObj
                                          .saveWisdom(stoicSlug: slug);
                                      if (context.mounted) {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).pop();
                                      }
                                      if (success) {
                                        final currentModel =
                                            getWisdomGenerateRXObj
                                                .wisdom
                                                .valueOrNull;
                                        if (currentModel != null &&
                                            currentModel.data != null) {
                                          currentModel.data!.isSaved =
                                              !(currentModel.data!.isSaved ??
                                                  false);
                                          getWisdomGenerateRXObj
                                              .handleSuccessWithReturn(
                                                currentModel,
                                              );
                                        }
                                      }
                                    } else {
                                      ToastUtil.showShortToast(
                                        "No quote to save",
                                      );
                                    }
                                  },
                                ),
                                SizedBox(width: 16.w),
                                WisdomActionButton(
                                  icon: Icons.share_outlined,
                                  label: "Share",
                                  onTap: () {
                                    _showAppShareOptionNew(
                                      context,
                                      responseData?.data?.shareLink,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
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
