// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_icons.dart';
import 'package:nick_me/feature/home/presentation/home_screen.dart';
import 'package:nick_me/feature/profile/presentation/profile_screen.dart';
import 'package:nick_me/feature/saved/presentation/saved_screen.dart';

import 'helpers/helper_methods.dart';

final class NavigationScreen extends StatefulWidget {
  final int? pageNum;
  const NavigationScreen({super.key, this.pageNum});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<StatefulWidget> _screens = [
    HomeScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageNum ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 65.w, vertical: 10.h),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.c444F5E.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(32.r),
                border: Border.all(
                  color: AppColor.cFFFFFF.withValues(alpha: 0.25),
                  width: 1.w,
                ),
                boxShadow: [
                  BoxShadow( 
                    color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: GNav(
                  activeColor: AppColor.cFFFFFF,
                  tabBackgroundColor: AppColor.cFFFFFF.withValues(alpha: 0.11),
                  gap: 8,
                  backgroundColor: Colors.transparent,
                  selectedIndex: _currentIndex,
                  onTabChange: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  tabs: [
                    GButton(
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(8.0),
                      leading: SvgPicture.asset(
                        AppIcons.home,
                        color: _currentIndex == 0
                            ? AppColor.cFFFFFF
                            : AppColor.c555555,
                        height: 20.h,
                        width: 20.w,
                      ),
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(12.0),
                      leading: SvgPicture.asset(
                        AppIcons.star,
                        color: _currentIndex == 1
                            ? AppColor.cFFFFFF
                            : AppColor.c555555,
                        height: 20.h,
                        width: 20.w,
                      ),
                      icon: Icons.home,
                      text: 'Saved',
                    ),
                    GButton(
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(12.0),
                      leading: SvgPicture.asset(
                        AppIcons.profile,
                        color: _currentIndex == 2
                            ? AppColor.cFFFFFF
                            : AppColor.c555555,
                        height: 20.h,
                        width: 20.w,
                      ),
                      icon: Icons.home,
                      text: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
