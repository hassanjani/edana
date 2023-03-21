import 'dart:io';

import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/View/splashScreen.dart';
import 'package:edana/provider/tenantinfo_provider.dart';
import 'package:edana/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'DbHelper/cache_helper.dart';
import 'utils/colors.dart';

void main() async {
  await initHiveForFlutter();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox('Registration');
  await CacheHelper.init();
  await AppConstants.init();

// Hive.registerAdapter(RegistarModalAdapter());
// for cache
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: AuthProvider(),
    ),
    ChangeNotifierProvider<TenantInfoProvider>(
      create: (context) => TenantInfoProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setPreferredOrientations(
    //   [DeviceOrientation.portraitUp],
    // ); // To turn off landscape mode
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: StatusBarColor,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EDSO App',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
// return  GetMaterialApp(
//   debugShowCheckedModeBanner: false,
//   title: 'EDSO',
//   home: SplashScreen(),
// );
