import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'conditionsBox.dart';
import 'successBox.dart';

class InvalidOTPBox extends StatefulWidget {
  const InvalidOTPBox({super.key});

  @override
  State<InvalidOTPBox> createState() => _InvalidOTPBoxState();
}

class _InvalidOTPBoxState extends State<InvalidOTPBox> {
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
                    height: size.height / 2,
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
                            // SizedBox(
                            //   height: size.height / 60,
                            // ),
                            Text(
                              'Oops!',
                              style: TextStyle(
                                  fontFamily: 'latoBold',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: mainTextColor),
                            ),
                            SizedBox(
                              height: size.height / 35,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Email Confirmation token is invalid',
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 15,
                                    color: Color(0xff4C4c4c)),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 16,
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
                                    () => const ConditionsBox(),
                                    fullscreenDialog: false,
                                    popGesture: true,
                                    transition: Transition.noTransition,
                                  );
                                },
                                child: Text('Try Again',
                                    style: TextStyle(
                                        fontFamily: 'latoSemiBold',
                                        fontSize: 18,
                                        color: whiteTextColor)),
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
                              height: size.height / 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14,
                                      color: appBarColor),
                                ),
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14,
                                      color: appBarColor),
                                ),
                                Text(
                                  'Terms of Use',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14,
                                      color: appBarColor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height / 40,
                            ),
                            Text(
                              '©Copyright 2021 Edana Pty. Ltd.',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 14,
                                  color: greyTextColor),
                            ),
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
