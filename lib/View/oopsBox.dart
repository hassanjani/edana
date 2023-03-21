import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'successBox.dart';

class OOPScreen extends StatefulWidget {
  const OOPScreen({super.key});

  @override
  State<OOPScreen> createState() => _OOPScreenState();
}

class _OOPScreenState extends State<OOPScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            
            child: Image.asset(loginBgImage,fit: BoxFit.cover,)
          ),
          Column(
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
                      //   height: size.height / 50,
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
                        text: const TextSpan(
                          text: 'Something went wrong! Either your',
                          style: TextStyle(
                            fontFamily: 'latoRegular',
                            fontSize: 15,
                            color: Color(0xff4C4C4C),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '\ninternet connection is not working or',
                              style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 15,
                                color: Color(0xff4C4C4C),
                              ),
                            ),
                            TextSpan(
                                text:
                                    '\nthe registration code ABC344 is not',
                                style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 15,
                                  color: Color(0xff4C4C4C),
                                )),
                            TextSpan(
                              text: '\nvalid',
                              style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 15,
                                color: Color(0xff4C4C4C),
                              ),
                            ),
                          ],
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
                              () => const SuccessBox(),
                              fullscreenDialog: false,
                              popGesture: true,
                              transition: Transition.noTransition,
                            );
                          },
                          child: Text(
                            'Try Again',
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
                      Image.asset(edanaLogoimg,height: 15.h,),
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
      
        ],
      ),
    );
  }
}
