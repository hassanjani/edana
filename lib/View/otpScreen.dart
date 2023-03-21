import 'package:edana/Model/tenantinfo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'oopsBox.dart';

class OTPSCreen extends StatefulWidget {
   OTPSCreen({super.key,required this.tenantInfoModel});
   
   TenantInfoModel? tenantInfoModel;
  @override
  State<OTPSCreen> createState() => _OTPSCreenState();
}

class _OTPSCreenState extends State<OTPSCreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: ScreenUtil().setHeight(620),
              width: size.width,
              
              child:Image.network( widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId!=null? 
                'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.appLoginBgImgId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}':'',fit: BoxFit.fill,)
            ),
             Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h,),
              Text(
                'Welcome to',
                style: TextStyle(
                    fontFamily: 'latoRegular',
                    fontSize: 20.sp,
                    color: whiteTextColor),
              ),
              Text(
                'Edana Portal App',
                style: TextStyle(
                    fontFamily: 'latoBold',
                    fontSize: 24.sp,
                    color: whiteTextColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'In order to take the power and flexibility of',
                      style: TextStyle(
                          fontFamily: 'latoRegular',
                          fontSize: 14.sp,
                          color: splashTextColor),
                    ),
                    Text(
                      'Ed-admin with you wherever you go, this app',
                      style: TextStyle(
                          fontFamily: 'latoRegular',
                          fontSize: 14.sp,
                          color: splashTextColor),
                    ),
                    Text(
                      'needs to connect to your institution’s site.',
                      style: TextStyle(
                          fontFamily: 'latoRegular',
                          fontSize: 14.sp,
                          color: splashTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: size.width / 1.05,
                height: 420.h,
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
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 14.sp,
                                  color: hintTextColor),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' 6-digit',
                                  style: TextStyle(
                                      fontFamily: 'latoBold',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: hintTextColor),
                                ),
                                TextSpan(
                                  text: ' site',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14.sp,
                                      color: hintTextColor),
                                ),
                                TextSpan(
                                  text:
                                      '\nactivation code that you have received from',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14.sp,
                                      color: hintTextColor),
                                ),
                                TextSpan(
                                  text: '\nyour institution',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14.sp,
                                      color: hintTextColor),
                                ),
                                // const TextSpan(text: '\nyour institution',)
                              ]),
                        ),
                        SizedBox(
                          height: 15.h,
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
                            const SizedBox(
                              width: 5,
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
                            const SizedBox(
                              width: 5,
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
                            const SizedBox(
                              width: 5,
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
                            const SizedBox(
                              width: 5,
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
                            const SizedBox(
                              width: 5,
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
                          height: size.height / 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:
                                  20.0, // Customize the width of the OTP text field
                              height:
                                  20.0, // Customize the height of the OTP text field
                              decoration: BoxDecoration(
                                //color: Colors.grey,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    4.0), // Customize the border radius
                              ),
      
                              // child: TextField(
                              //   textAlign: TextAlign.center,
                              //   keyboardType: TextInputType.number,
                              //   style: TextStyle(fontSize: 20.0),
                              //   decoration: InputDecoration(
                              //     border: InputBorder.none,
                              //   ),
                              // ),
                            ),
                            SizedBox(
                              width: size.width / 30,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'I have read and agreed with the',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 14,
                                      color: lightGreyTextColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' End \nUser Lisence Agreement.',
                                      style: TextStyle(
                                          fontFamily: 'latoRegular',
                                          fontSize: 14,
                                          color: lightblueTextColor),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: 300.w,
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
                                () => const OOPScreen(),
                                fullscreenDialog: false,
                                popGesture: true,
                                transition: Transition.noTransition,
                              );
                            },
                            child: Text('Activate',
                                style: TextStyle(
                                    fontFamily: 'latoSemiBold',
                                    fontSize: 18,
                                    color: whiteTextColor)),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        Text(
                          'If you have not received this code, please contact',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 12,
                              color: hintTextColor),
                        ),
                        Text(
                          'your institution',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 12,
                              color: hintTextColor),
                        ),
                        SizedBox(
                          height: size.height / 80,
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
                        //
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        
          ],
        ),
      ),

    );
  }
}
