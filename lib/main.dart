import 'dart:io';

import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/View/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'utils/colors.dart';

void main() async {
  await initHiveForFlutter();
  HttpOverrides.global = MyHttpOverrides();

// for cache
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: AuthProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ); // To turn off landscape mode
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: StatusBarColor,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDSO',
      home: SplashScreen(),
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
