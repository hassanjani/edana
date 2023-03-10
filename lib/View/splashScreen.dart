import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'loginDefault.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height / 14,
              width: size.width / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/edana_logo_splashscreen.png'),
                  //fit: BoxFit.cover
                ),
              ),
            ),
            Text(
              'Powered By Gowell Solutions',
              style: TextStyle(
                  fontFamily: 'latoRegular',
                  fontSize: 13.1,
                  color: splashTextColor),
            ),
            SizedBox(
              height: size.height / 100,
            ),
            Divider(
              height: 2,
              color: whiteTextColor,
              indent: 80,
              endIndent: 80,
            ),
            SizedBox(
              height: size.height / 100,
            ),
            Text(
              'Educating the Next Generation',
              style: TextStyle(
                  fontFamily: 'latoRegular',
                  fontSize: 16,
                  color: splashTextColor),
            ),
          ],
        ),
      ),
    ));
  }
}
