import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'activatedAccountError.dart';
import 'oopsBox.dart';

class ActivatedAccount extends StatefulWidget {
  const ActivatedAccount({super.key});

  @override
  State<ActivatedAccount> createState() => _ActivatedAccountState();
}

class _ActivatedAccountState extends State<ActivatedAccount> {
    bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Activate Account'),
        backgroundColor: StatusBarColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            
            child:Image.asset(loginBgImage,fit: BoxFit.cover,),

          ),
          Center(
            child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ScreenUtil().setHeight(90.h),),
              SizedBox(
                width: size.width / 1.05,
                height: 430.h,
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
                        RichText(
                          text: TextSpan(
                              text: 'To begin, please enter the',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: blackTextColor,
                                ),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' 6-digit',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: blackTextColor,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ' site',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: blackTextColor,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '\nactivation code that you have received from',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: blackTextColor,
                                    ),
                                  ),
                                ),
                                const TextSpan(text: '\nyour institution')
                              ]),
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:
                                  40.w, // Customize the width of the OTP text field
                              height:
                                  48.h, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                             SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width:
                                  40.w, // Customize the width of the OTP text field
                              height:
                                  48.w, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                             SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width:
                                  40.w, // Customize the width of the OTP text field
                              height:
                                  48.w, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                             SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width:
                                  40.w, // Customize the width of the OTP text field
                              height:
                                  48.h, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                             SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width:
                                  40.w, // Customize the width of the OTP text field
                              height:
                                  48.h, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                             SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width:
                                  40.w, // Customize the width of the OTP text field
                              height:
                                  48.h, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 18.w,),
                           Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: StatusBarColor,
                                          value: isChecked,
                                          onChanged: (value)  {
                                            setState(() {
                                             // print(value);
                                              isChecked =value;
                                            });
                                                                          },
                                        ),
                                          
                          
                            RichText(
                              text: TextSpan(
                                  text: 'I Have read and agreed with the',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: greyTextColor,
                                    ),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' End \nUser Lisence Agreement.',
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: lightblueTextColor,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: 300.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(inactiveButtonColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.to(
                                () => const ActivatedAccountError(),
                                fullscreenDialog: false,
                                popGesture: true,
                                transition: Transition.noTransition,
                              );
                            },
                            child: Text('Activate',
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
                        Text(
                          'If you have not received this code,please contact',
                          style: GoogleFonts.lato(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'your institution',
                          style: GoogleFonts.lato(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Image.asset(edanaLogoimg,height: 15.h,),
                        SizedBox(
                          height: 15.h,
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
      
        ],
      ),

    );
  }
}
