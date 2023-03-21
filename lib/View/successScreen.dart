import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'loginDefault.dart';

class ScuuessScreen extends StatefulWidget {
  const ScuuessScreen({super.key});

  @override
  State<ScuuessScreen> createState() => _ScuuessScreenState();
}

class _ScuuessScreenState extends State<ScuuessScreen> {
  var mainTextColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width / 1.05,
                    height: 400.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      color: Colors.white.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Success!',
                              style: GoogleFonts.lato(
                                  fontSize: 28, color: mainTextColor),
                            ),
                            SizedBox(
                              height: size.height / 35,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'You have successfully updated your app',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: blackTextColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 35,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'School Name',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: blackTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 35,
                            ),
                            SizedBox(
                              height: size.height / 15,
                              width: size.width / 1.35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      inactiveButtonColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(
                                    () =>  Login(),
                                    fullscreenDialog: false,
                                    popGesture: true,
                                    transition: Transition.noTransition,
                                  );
                                },
                                child: Text('Login',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: whiteTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            Container(
                              height: size.height / 18,
                              width: size.width / 4,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/edana_logo_black.png'),
                                  //fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Privacy Policy',
                                  style: GoogleFonts.lato(
                                      color: mainTextColor, fontSize: 14),
                                ),
                                Text(
                                  'Contact Us',
                                  style: GoogleFonts.lato(
                                      color: mainTextColor, fontSize: 14),
                                ),
                                Text(
                                  'Terms of Use',
                                  style: GoogleFonts.lato(
                                      color: mainTextColor, fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            Text(
                              '©Copyright 2021 Edana Pty. Ltd.',
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: greyTextColor),
                            ),
                            //
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
