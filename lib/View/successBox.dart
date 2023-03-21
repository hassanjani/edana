import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'loginDefault.dart';

class SuccessBox extends StatefulWidget {
  const SuccessBox({super.key});

  @override
  State<SuccessBox> createState() => _SuccessBoxState();
}

class _SuccessBoxState extends State<SuccessBox> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
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
                  width: size.width / 1.05,
                  height: 410.h,
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
                          //   height: size.height / 50,
                          // ),
                          Text(
                            'Success!',
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
                              text: 'You have successfully updated your app',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 16,
                                  color: hintTextColor),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 35,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Mercedes Princepton School',
                              style: TextStyle(
                                  fontFamily: 'latoSemiBold',
                                  fontSize: 18,
                                  color: hintTextColor),
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
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'latoSemiBold',
                                    fontSize: 18,
                                    color: whiteTextColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 100,
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
                            height: size.height / 50,
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
                            height: size.height / 35,
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
    );
  }
}
