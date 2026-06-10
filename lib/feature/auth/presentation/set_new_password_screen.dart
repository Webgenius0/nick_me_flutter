import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/common_widgets/custom_text_from_field.dart';
import 'package:nick_me/helpers/ui_helpers.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});
  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                            ),

                            UIHelper.verticalSpace(40.h),
                            CustomSaveButton(btnText: 'Continue'),
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
