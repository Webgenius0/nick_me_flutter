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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              builder: (context, constraints) {
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
                                  'Log in',
                                  style:
                                      TextFontStyle.textStyle24SpaceGroteskW700,
                                ),
                              ),
                              UIHelper.verticalSpace(89.h),
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
                              UIHelper.verticalSpace(24.h),
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
                                    return 'Must be at least 8 character';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),
                              UIHelper.verticalSpace(40.h),
                              CustomSaveButton(
                                btnText: 'Log In',
                                onCall: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // show loader
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) =>
                                          loadingIndicatorCircle(
                                            context: context,
                                          ),
                                    );

                                    bool loginSuccess = await getLoginRxObj
                                        .login(
                                          email: emailController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                        );

                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                    if (loginSuccess) {
                                      NavigationService.navigateTo(
                                        Routes.navigationScreen,
                                      );
                                    } else {
                                      ToastUtil.showShortToast(
                                        getLoginRxObj.errorMessage ??
                                            'Login failed',
                                      );
                                    }
                                  }
                                },
                              ),
                              UIHelper.verticalSpace(24.h),
                              GestureDetector(
                                onTap: () {
                                  NavigationService.navigateTo(
                                    Routes.forgetPasswordScreen,
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Forgotten your password ?',
                                    style: TextFontStyle.textStyle13interW600,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Center(
                                child: Text(
                                  'Don’t have an account ?',
                                  style: TextFontStyle.textStyle14cA8A8A8W500,
                                ),
                              ),
                              UIHelper.verticalSpace(16.h),
                              GestureDetector(
                                onTap: () {
                                  NavigationService.navigateTo(
                                    Routes.createAccountScreen,
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Create an Account',
                                    style: TextFontStyle.textStyle13interW600,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(20.h),
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
