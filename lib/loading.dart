// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/feature/auth/presentation/login_screen.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/helpers/helper_methods.dart';
import 'package:nick_me/navigation_screen.dart';
import 'package:nick_me/splash_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    _isLoading = true;
    await setInitValue();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return SplashScreen();
    } else {
      return appData.read(kKeyAccessToken) != null
          ? NavigationScreen(pageNum: 0)
          : LoginScreen();
      // : HomeNewScreen();
      // var token = appData.read(kKeyAccessToken);
      // if (token != null && role == "customer") {
      //   return BottomNavbar(pageNum: 0);
      // } else if (token != null && role == "service_provider") {
      //   return BottomNavbarTradePeople(pageNum: 0);
      // } else {
      //   return OnboardingScreen();
      // }
    }
  }
}
