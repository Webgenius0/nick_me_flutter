import 'package:auto_animated/auto_animated.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nick_me/loading.dart';
import 'package:provider/provider.dart';
import '/helpers/all_routes.dart';

import 'helpers/di.dart';
import 'helpers/language.dart';
import 'helpers/navigation_service.dart';
import 'helpers/register_provider.dart';
import 'networks/dio/dio.dart';
import 'package:nick_me/constants/update_customer.dart';
import 'package:nick_me/helpers/secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  diSetup();
  // initiInternetChecker();
  await SecureStorage.migrateLegacyToken(appData, kKeyAccessToken);
  String? token = await SecureStorage.getToken();
  if (token != null && token.isNotEmpty) {
    DioSingleton.instance.update(token);
  } else {
    DioSingleton.instance.create();
  }

  // Set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    // const MyApp(),
    DevicePreview(
      enabled: true, // Set to false to disable device preview
      builder: (context) => const MyApp(), // Your app widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // rotation();
    // setInitValue();
    return MultiProvider(
      providers: providers,
      child: AnimateIfVisibleWrapper(
        showItemInterval: Duration(milliseconds: 150),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return UtillScreenMobile();
          },
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 827),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          showPerformanceOverlay: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            canvasColor: Colors.black,
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
          translations: LocalString(),
          builder: (context, widget) {
            return MediaQuery(data: MediaQuery.of(context), child: widget!);
          },
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,

          home: Loading(),
        );
      },
    );
  }
}
