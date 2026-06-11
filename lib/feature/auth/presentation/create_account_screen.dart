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

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool rememberme = false;
  bool dailyreminders = false;
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
                                'Create Account',
                                style:
                                    TextFontStyle.textStyle24SpaceGroteskW700,
                              ),
                            ),
                            UIHelper.verticalSpace(58.h),
                            Text(
                              'NAME',
                              style: TextFontStyle.textStyle14cA8A8A8W500,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter your name',
                              controller: nameController,
                            ),
                            UIHelper.verticalSpace(24.h),
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
                            UIHelper.verticalSpace(24.h),
                            Text(
                              'CONFIRM PASSWORD',
                              style: TextFontStyle.textStyle14cA8A8A8W500,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter your password',
                              isPassword: true,
                              controller: confirmPasswordController,
                            ),
                            UIHelper.verticalSpace(40.h),
                            CustomSaveButton(
                              btnText: 'Register',
                              onCall: () {
                                NavigationService.navigateTo(
                                  Routes.otpVerifyScreen,
                                );
                              },
                            ),
                            UIHelper.verticalSpace(24.h),

                            Row(
                              children: [
                                InkWell(
                                  onTap: () => setState(() {
                                    rememberme = !rememberme;
                                  }),
                                  child: Container(
                                    height: 16.h,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      border: Border.all(
                                        color: AppColor.c8896AC,
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: rememberme,
                                      child: Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColor.c8896AC,
                                      ),
                                    ),
                                  ),
                                ),
                                UIHelper.horizontalSpace(12.w),
                                Text(
                                  'I agree to',
                                  style: TextFontStyle.textStyle14cA8A8A8W500
                                      .copyWith(fontSize: 14.sp),
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                ),
                                UIHelper.horizontalSpace(12.w),
                                Text(
                                  'Terms and Conditions',
                                  style: TextFontStyle.textStyle13interW600,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(16.h),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => setState(() {
                                    dailyreminders = !dailyreminders;
                                  }),
                                  child: Container(
                                    height: 16.h,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      border: Border.all(
                                        color: AppColor.c8896AC,
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: dailyreminders,
                                      child: Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColor.c8896AC,
                                      ),
                                    ),
                                  ),
                                ),
                                UIHelper.horizontalSpace(12.w),
                                Text(
                                  'Daily reminders',
                                  style: TextFontStyle.textStyle14cA8A8A8W500
                                      .copyWith(fontSize: 14.sp),
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                ),
                              ],
                            ),

                            // UIHelper.verticalSpace(50.h),
                            Spacer(),

                            Center(
                              child: Text(
                                'Already have an account ?',
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                            ),
                            UIHelper.verticalSpace(16.h),
                            GestureDetector(
                              onTap: () {
                                NavigationService.navigateTo(
                                  Routes.loginScreen,
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Log In',
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
