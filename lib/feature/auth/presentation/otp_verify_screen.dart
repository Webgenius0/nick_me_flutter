import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/common_widgets/custom_save_button.dart';
import 'package:nick_me/helpers/ui_helpers.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  //  Create 5 OTP controllers
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  // Combine all 4 boxes into one OTP string
  String getOtp() {
    return otpControllers.map((c) => c.text).join();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < otpControllers.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
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
                                'Verify OTP',
                                style:
                                    TextFontStyle.textStyle24SpaceGroteskW700,
                              ),
                            ),

                            UIHelper.verticalSpace(16.h),
                            Center(
                              child: Text(
                                'Please enter the code we sent you \nto email',
                                style: TextFontStyle.textStyle14cA8A8A8W500
                                    .copyWith(
                                      color: AppColor.cFFFFFF.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            UIHelper.verticalSpace(40.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(4, (index) {
                                return Container(
                                  width: 55.w,
                                  height: 50.h,
                                  padding: EdgeInsets.all(1.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: AppColor.cFFFFFF,
                                      ),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: TextField(
                                      controller: otpControllers[index],
                                      focusNode: focusNodes[index],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      cursorColor: AppColor.c8896AC,
                                      maxLength: 1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      style:
                                          TextFontStyle.textStyle16cFFFFFFW600,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) =>
                                          _onChanged(value, index),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            UIHelper.verticalSpace(32.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn’t Receive OTP ? ",
                                  style: TextFontStyle.textStyle14cA8A8A8W500
                                      .copyWith(
                                        color: AppColor.cFFFFFF.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                ),
                                Text(
                                  "Resend Code",
                                  style: TextFontStyle.textStyle14cA8A8A8W500,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(12.h),
                            Center(
                              child: Text(
                                "1.00 min",
                                style: TextFontStyle.textStyle14cA8A8A8W500,
                              ),
                            ),

                            UIHelper.verticalSpace(40.h),
                            CustomSaveButton(btnText: 'Verify'),
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
