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
import 'package:nick_me/networks/api_acess.dart';

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

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      // If not on Home, go to Home tab
      setState(() {
        _currentIndex = 0;
      });
      return false; // Prevent default back action
    } else {
      // If already on Home, optionally show exit dialog
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Exit App"),
              content: Text("Do you really want to exit?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Yes"),
                ),
              ],
            ),
          ) ??
          false;
    }
  }

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 2) {
        getData();
      }
      if (_currentIndex == 1) {
        getDataForSaved();
      }
    });
  }

  Future<void> getData() async {
    await Future.wait([getProfileDataRXObj.profileDataGet()]);
  }

  Future<void> getDataForSaved() async {
    await Future.wait([getWisdomSaveListRxObj.getSavedWisdomList()]);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageNum ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 10.h),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.c444F5E.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(100.r),
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
                  onTabChange: onItemTapped,
                  tabs: [
                    GButton(
                      border: Border.all(color: Colors.transparent),
                      activeBorder: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                        width: 2.w,
                      ),
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(12.0),
                      leading: SvgPicture.asset(
                        AppIcons.home,
                        color: _currentIndex == 0
                            ? AppColor.cFFFFFF
                            : AppColor.c5A6478,
                        height: 20.h,
                        width: 20.w,
                      ),
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      border: Border.all(color: Colors.transparent),
                      activeBorder: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                        width: 2.w,
                      ),
                      padding: EdgeInsets.all(12.0),
                      // margin: EdgeInsets.all(12.0),
                      leading: SvgPicture.asset(
                        AppIcons.star,
                        color: _currentIndex == 1
                            ? AppColor.cFFFFFF
                            : AppColor.c5A6478,
                        height: 20.h,
                        width: 20.w,
                      ),
                      icon: Icons.home,
                      text: 'Saved',
                    ),
                    GButton(
                      border: Border.all(color: Colors.transparent),
                      activeBorder: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                        width: 2.w,
                      ),
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(12.0),
                      leading: SvgPicture.asset(
                        AppIcons.profile,
                        color: _currentIndex == 2
                            ? AppColor.cFFFFFF
                            : AppColor.c5A6478,
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
