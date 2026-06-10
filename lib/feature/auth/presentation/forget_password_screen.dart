import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/common_widgets/custom_text_from_field.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/navigation_service.dart';

import 'package:nick_me/helpers/ui_helpers.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIHelper.verticalSpace(80.h),
                            Center(
                              child: Text(
                                'Enter your Email',
                                style:
                                    TextFontStyle.textStyle24SpaceGroteskW700,
                              ),
                            ),
                            UIHelper.verticalSpace(16.h),
                            Center(
                              child: Text(
                                'we‘ll send you a verification code ',
                                style: TextFontStyle.textStyle14cA8A8A8W500
                                    .copyWith(
                                      color: AppColor.cFFFFFF.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            UIHelper.verticalSpace(32.h),
                            Text(
                              'EMAIL ADDRESS',
                              style: TextFontStyle.textStyle14cA8A8A8W500,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter your email',
                              controller: emailController,
                            ),
                            UIHelper.verticalSpace(36.h),

                            CustomSaveButton(btnText: 'Send Code',onCall: () {
                              NavigationService.navigateTo(Routes.otpVerifyForgetPassScreen);
                            },),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
