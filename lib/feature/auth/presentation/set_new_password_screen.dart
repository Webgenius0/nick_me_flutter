import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class SetNewPasswordScreen extends StatefulWidget {
  final String? email;
  final String? otpToken;
  const SetNewPasswordScreen({super.key, this.email, this.otpToken});
  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                              // Text(widget.otpToken ?? ''),
                              Center(
                                child: Text(
                                  'Set new password',
                                  style:
                                      TextFontStyle.textStyle24SpaceGroteskW700,
                                ),
                              ),
                              UIHelper.verticalSpace(89.h),

                              Text(
                                'PASSWORD',
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter your password',
                                isPassword: true,
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              UIHelper.verticalSpace(24.h),

                              Text(
                                'CONFIRM PASSWORD',
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter your confirm password',
                                isPassword: true,
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your confirm password';
                                  } else if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),

                              UIHelper.verticalSpace(40.h),

                              CustomSaveButton(
                                btnText: 'Continue',
                                onCall: () async {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) =>
                                        loadingIndicatorCircle(
                                          context: context,
                                        ),
                                  );
                                  bool response = await getResetPassRXObj
                                      .resetPass(
                                        email: widget.email ?? '',
                                        password: passwordController.text,
                                        confPassword:
                                            confirmPasswordController.text,
                                        resetToken: widget.otpToken ?? '',
                                      );
                                  if (!context.mounted) return;
                                  Navigator.pop(context);
                                  if (response) {
                                    NavigationService.navigateTo(
                                      Routes.loginScreen,
                                    );
                                  } else {
                                    ToastUtil.showShortToast(
                                      getResetPassRXObj.errorMessage ??
                                          'Verification failed',
                                    );
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
