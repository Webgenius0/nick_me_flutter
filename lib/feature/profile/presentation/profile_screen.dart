import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/feature/profile/widgets/profile_menu_item.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';
import 'package:nick_me/networks/api_acess.dart';
import 'package:nick_me/feature/profile/model/profile_data_get_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getProfileDataRXObj.loadCachedProfile();
    getProfileDataRXObj.profileDataGet();
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.editProfileScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColor.cFFFFFF,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  StreamBuilder<ProfileDataGetModel>(
                    stream: getProfileDataRXObj.profileData,
                    builder: (context, snapshot) {
                      final profileData = snapshot.data;
                      final user = profileData?.data?.user;
                      final name = user != null
                          ? "${user.firstName ?? ''} ${user.lastName ?? ''}"
                                .trim()
                          : "";
                      final displayName = name.isNotEmpty
                          ? name
                          : (user?.username ?? "Sarah Jenkins");
                      final email = user?.email ?? "sarah.jenkins@example.com";
                      final avatar = user?.avatar;

                      String avatarUrl = "";
                      if (avatar != null && avatar.isNotEmpty) {
                        if (avatar.startsWith('http')) {
                          avatarUrl = avatar;
                        } else if (avatar.startsWith('/')) {
                          avatarUrl = "https://admin.askthestoics.com$avatar";
                        } else {
                          avatarUrl = "https://admin.askthestoics.com/$avatar";
                        }
                      }

                      return Column(
                        children: [
                          Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                                width: 4,
                              ),
                              image: DecorationImage(
                                image: avatarUrl.isNotEmpty
                                    ? NetworkImage(avatarUrl)
                                    : NetworkImage(
                                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=150&auto=format&fit=crop",
                                      ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            displayName,
                            style: TextFontStyle.textStyle16cFFFFFFInterW600
                                .copyWith(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            email,
                            style: TextFontStyle.textStyle14cFFFFFFInterW500
                                .copyWith(
                                  color: AppColor.cFFFFFF.withValues(
                                    alpha: 0.4,
                                  ),
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ACCOUNT & DATA",
                      style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.4),
                        letterSpacing: 1.5,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.c444F5E.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        ProfileMenuItem(
                          icon: Icons.shield_outlined,
                          title: "Privacy Policy",
                          onTap: () {
                            NavigationService.navigateTo(
                              Routes.privacyPolicyScreen,
                            );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                        ),
                        ProfileMenuItem(
                          icon: Icons.description_outlined,
                          title: "Terms & Conditions",
                          onTap: () {
                            NavigationService.navigateTo(
                              Routes.termsAndConditions,
                            );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                        ),
                        ProfileMenuItem(
                          icon: Icons.lock_outline,
                          title: "Change Password",
                          onTap: () {
                            NavigationService.navigateTo(
                              Routes.changePasswordScreen,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.c444F5E.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        ProfileMenuItem(
                          icon: Icons.help_outline,
                          title: "Help & Support",
                          onTap: () {
                            NavigationService.navigateTo(
                              Routes.helpAndSupportScreen,
                            );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                        ),
                        ProfileMenuItem(
                          icon: Icons.delete_outline,
                          title: "Delete Account",
                          onTap: () {},
                        ),
                        Divider(
                          height: 1,
                          color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                        ),
                        ProfileMenuItem(
                          icon: Icons.subject_sharp,
                          title: "Subscription",
                          onTap: () {
                            NavigationService.navigateTo(
                              Routes.subscriptionScreen,
                            );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                        ),
                        ProfileMenuItem(
                          icon: Icons.logout,
                          title: "Sign Out",
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                backgroundColor: AppColor.c0E1116,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  side: BorderSide(
                                    color: AppColor.cFFFFFF.withValues(
                                      alpha: 0.1,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Sign Out",
                                  style: TextFontStyle
                                      .textStyle16cFFFFFFInterW600
                                      .copyWith(fontSize: 20.sp),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  "Are you sure you want to sign out?",
                                  style: TextFontStyle
                                      .textStyle14cFFFFFFInterW500
                                      .copyWith(
                                        color: AppColor.cFFFFFF.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                actionsAlignment: MainAxisAlignment.spaceEvenly,
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(),
                                    child: Text(
                                      "Cancel",
                                      style: TextFontStyle
                                          .textStyle14cFFFFFFInterW500
                                          .copyWith(
                                            color: AppColor.cFFFFFF.withValues(
                                              alpha: 0.5,
                                            ),
                                          ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (loadingContext) =>
                                            loadingIndicatorCircle(
                                              context: loadingContext,
                                            ),
                                      );
                                      bool logoutSuccess = await getLogoutRxObj
                                          .logout();

                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).pop();

                                      Navigator.of(dialogContext).pop();

                                      if (logoutSuccess) {
                                        NavigationService.navigateToUntilReplacement(
                                          Routes.loginScreen,
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Yes, Sign Out",
                                      style: TextFontStyle
                                          .textStyle14cFFFFFFInterW500
                                          .copyWith(color: Colors.redAccent),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          isDestructive: true,
                          showArrow: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
