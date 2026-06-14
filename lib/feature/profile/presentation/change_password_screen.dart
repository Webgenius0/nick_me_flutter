import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/common_widgets/custom_text_from_field.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/helpers/ui_helpers.dart';
import 'package:nick_me/networks/api_acess.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
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
                              SizedBox(height: 10.h),
                              CustomAppBar(
                                onBack: () {
                                  NavigationService.goBack;
                                },
                              ),
                              UIHelper.verticalSpace(16.h),
                              Center(
                                child: Text(
                                  'Change password',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(45.h),

                              Text(
                                'CURRENT PASSWORD',
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter current password',
                                isPassword: true,
                                controller: currentPasswordController,
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
                                'NEW PASSWORD',
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter new password',
                                isPassword: true,
                                controller: newPasswordController,
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
                                'CONFIRM NEW PASSWORD',
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                              CustomTextFormField(
                                hintText: 'Confirm new password',
                                isPassword: true,
                                controller: confirmNewPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter confirm new password';
                                  } else if (value !=
                                      newPasswordController.text) {
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
                                  bool response = await getChangePassRXObj
                                      .changePass(
                                        currentPassword:
                                            currentPasswordController.text,
                                        newPassword: newPasswordController.text,
                                        newPasswordConfirmation:
                                            confirmNewPasswordController.text,
                                      );
                                  if (!context.mounted) return;
                                  Navigator.pop(context);
                                  if (response) {
                                    NavigationService.navigateToReplacement(
                                      Routes.loginScreen,
                                    );
                                  } else {
                                    ToastUtil.showShortToast(
                                      getChangePassRXObj.errorMessage ??
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
