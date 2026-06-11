import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nick_me/feature/auth/presentation/create_account_screen.dart';
import 'package:nick_me/feature/auth/presentation/forget_password_screen.dart';
import 'package:nick_me/feature/auth/presentation/login_screen.dart';
import 'package:nick_me/feature/auth/presentation/otp_verify_forget_pass_screen.dart';
import 'package:nick_me/feature/auth/presentation/otp_verify_screen.dart';
import 'package:nick_me/feature/auth/presentation/set_new_password_screen.dart';
import 'package:nick_me/feature/home/presentation/generate_wisdom_screen.dart';
import 'package:nick_me/feature/profile/presentation/edit_profile_screen.dart';
import 'package:nick_me/feature/profile/presentation/help_and_support_screen.dart';
import 'package:nick_me/feature/profile/presentation/privacy_policy_screen.dart';
import 'package:nick_me/feature/profile/presentation/subscription_screen.dart';
import 'package:nick_me/feature/profile/presentation/terms_and_conditions.dart';
import 'package:nick_me/navigation_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;
  static const String loginScreen = '/loginScreen';
  static const String createAccountScreen = '/createAccountScreen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerifyForgetPassScreen = '/otpVerifyForgetPassScreen';
  static const String setNewPasswordScreen = '/setNewPasswordScreen';
  static const String navigationScreen = '/navigationScreen';
  static const String generateWisdomScreen = '/generateWisdomScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String subscriptionScreen = '/subscriptionScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsAndConditions = '/termsAndConditions';
  static const String helpAndSupportScreen = '/helpAndSupportScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: LoginScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => LoginScreen());

      case Routes.createAccountScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CreateAccountScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => CreateAccountScreen());

      case Routes.otpVerifyScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: OtpVerifyScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => OtpVerifyScreen());

      case Routes.forgetPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ForgetPasswordScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => ForgetPasswordScreen());

      case Routes.otpVerifyForgetPassScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: OtpVerifyForgetPassScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => OtpVerifyForgetPassScreen(),
              );

      case Routes.setNewPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SetNewPasswordScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => SetNewPasswordScreen());

      case Routes.navigationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: NavigationScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => NavigationScreen());

      case Routes.generateWisdomScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: GenerateWisdomScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => GenerateWisdomScreen());

      case Routes.editProfileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: EditProfileScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => EditProfileScreen());

      case Routes.subscriptionScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SubscriptionScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => SubscriptionScreen());

      case Routes.privacyPolicyScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: PrivacyPolicyScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => PrivacyPolicyScreen());

      case Routes.termsAndConditions:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: TermsAndConditions(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => TermsAndConditions());

      case Routes.helpAndSupportScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HelpAndSupportScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => HelpAndSupportScreen());

      // case Routes.applicationDetailsHistoryScreen:
      //   final item = settings.arguments as VerificationRequest;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: ApplicationDetailsHistoryScreen(item: item),
      //           settings: settings,
      //         )
      //       : CupertinoPageRoute(
      //           builder: (context) =>
      //               ApplicationDetailsHistoryScreen(item: item),
      //         );

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        reverseTransitionDuration: const Duration(milliseconds: 1),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return widget;
            },
        transitionDuration: const Duration(milliseconds: 1),
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
                child: child,
              );
            },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
