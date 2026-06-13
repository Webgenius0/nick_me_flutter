import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/common_widgets/custom_text_from_field.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';
import 'package:nick_me/helpers/navigation_service.dart';

import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/helpers/ui_helpers.dart';
import 'package:nick_me/networks/api_acess.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              builder: (_, constraints) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (!RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+',
                                  ).hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                              UIHelper.verticalSpace(36.h),

                              CustomSaveButton(
                                btnText: 'Send Code',
                                onCall: () async {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) =>
                                          loadingIndicatorCircle(
                                            context: context,
                                          ),
                                    );
                                    final otpToken = await getForgetPasswodRxObj
                                        .forgetPass(
                                          email: emailController.text.trim(),
                                        );

                                    if (!context.mounted) return;
                                    Navigator.of(context).pop();

                                    if (otpToken != null) {
                                      NavigationService.navigateToWithArgs(
                                        Routes.otpVerifyForgetPassScreen,
                                        {
                                          'email': emailController.text.trim(),
                                          'otp_token': otpToken,
                                        },
                                      );
                                    } else {
                                      ToastUtil.showShortToast(
                                        getForgetPasswodRxObj.errorMessage ??
                                            'Failed to send verification code',
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
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
