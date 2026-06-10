import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/common_widgets/custom_text_from_field.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/ui_helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                            ),
                            UIHelper.verticalSpace(40.h),
                            CustomSaveButton(btnText: 'Log In',
                            onCall: (){
                              NavigationService.navigateTo(Routes.navigationScreen);
                            },),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
