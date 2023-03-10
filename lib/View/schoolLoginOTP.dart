import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/View/homePage.dart';
import 'package:edana/View/invalidOTPToken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class SchoolLoginOTP extends StatefulWidget {
  const SchoolLoginOTP({super.key});

  @override
  State<SchoolLoginOTP> createState() => _SchoolLoginOTPState();
}

class _SchoolLoginOTPState extends State<SchoolLoginOTP> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height / 60,
              ),
              SizedBox(
                width: size.width / 1.05,
                height: size.height / 1.1,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: size.height / 50,
                        // ),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'latoBold',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: mainTextColor),
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Container(
                          height: size.height / 8,
                          width: size.width / 4,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/school_logo_1.png'),
                              //fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'School Name',
                            style: TextStyle(
                                fontFamily: 'latoSemiBold',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: hintTextColor),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 50,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Login OTP is required for login',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 16,
                                color: lightGreyTextColor),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 100,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'it has been sent to your primary email',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 13,
                                color: lightGreyTextColor),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 50,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Enter Login OTP here',
                            style: TextStyle(
                                fontFamily: 'latoSemiBold',
                                fontSize: 16,
                                color: lightGreyTextColor),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 50,
                        ),
                        Container(
                          height: size.height / 15,
                          width: size.width / 1.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(
                                16.0), // Customize the border radius
                          ),
                          child: TextField(
                            controller: otpController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 20.0),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              hintText: 'S143Xy8',
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xff323232)),
                              // contentPadding: EdgeInsets.only(
                              //     left: 15, bottom: 11, top: 11, right: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 40,
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
                              Provider.of<AuthProvider>(context, listen: false)
                                  .validateOtp(context, otpController.text,
                                      (bool check, String msg) {
                                if (check) {
                                  Get.to(
                                    () => const HomePage(),
                                    fullscreenDialog: false,
                                    popGesture: true,
                                    transition: Transition.noTransition,
                                  );
                                } else {
                                  Get.to(
                                    () => const InvalidOTPBox(),
                                    fullscreenDialog: false,
                                    popGesture: true,
                                    transition: Transition.noTransition,
                                  );
                                }
                              });

                              // Get.to(
                              //   () => const InvalidOTPBox(),
                              //   fullscreenDialog: false,
                              //   popGesture: true,
                              //   transition: Transition.noTransition,
                              // );
                            },
                            child: Text('Continue',
                                style: TextStyle(
                                    fontFamily: 'latoSemiBold',
                                    fontSize: 18,
                                    color: whiteTextColor)),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontFamily: 'latoSemiBold',
                              fontSize: 18,
                              color: appBarColor),
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Text(
                          'Access to this site is monitored by Edsecure,',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 14,
                              color: lightGreyTextColor),
                        ),
                        Text(
                          'unauthorized access attempts will be tracked.',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 14,
                              color: lightGreyTextColor),
                        ),
                        SizedBox(
                          height: size.height / 60,
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
    );
  }
}
