import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/View/conditionsBox.dart';
import 'package:edana/View/homePage.dart';
import 'package:edana/View/invalidOTPToken.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class SchoolLoginOTP extends StatefulWidget {
  SchoolLoginOTP({super.key, required this.tenantInfoModel});
  TenantInfoModel? tenantInfoModel;
  @override
  State<SchoolLoginOTP> createState() => _SchoolLoginOTPState();
}

class _SchoolLoginOTPState extends State<SchoolLoginOTP> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: ScreenUtil().setHeight(640.h),
                width: size.width,
                child: Image.network(
                  'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.appLoginBgImgId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}',
                  fit: BoxFit.cover,
                )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: size.width / 1.05,
                    height: ScreenUtil().setHeight(560.h),
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
                            CircleAvatar(
                              radius: 40.h,
                              backgroundImage: NetworkImage(
                                  'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}'),
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
                              height: 20.h,
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
                              height: 20.h,
                            ),
                            Container(
                              height: 50.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: TextFormField(
                                controller: otpController,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 13.w, bottom: 11.h, top: 13.h),
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
                              height: 15.h,
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
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .validateOtp(context, otpController.text,
                                          (bool check, String msg) {
                                    if (check) {
                                      Get.to(
                                        () =>  ConditionsBox(tenantInfoModel: widget.tenantInfoModel,),
                                        fullscreenDialog: false,
                                        popGesture: true,
                                        transition: Transition.noTransition,
                                      );
                                      // Get.to(
                                      //   () => const HomePage(),
                                      //   fullscreenDialog: false,
                                      //   popGesture: true,
                                      //   transition: Transition.noTransition,
                                      // );
                                    } else {
                                      Get.to(
                                        () =>  InvalidOTPBox(tenantInfoModel: widget.tenantInfoModel,),
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
                              height: 10.h,
                            ),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                  fontFamily: 'latoSemiBold',
                                  fontSize: 18,
                                  color: appBarColor),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Text(
                                    widget.tenantInfoModel!.tenantInfoData!
                                        .tenantInfo!.loginPageMessage
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: 'latoRegular',
                                        fontSize: 14,
                                        color: lightGreyTextColor),
                                  ),
                                ),
                              ],
                            ),
          
                            SizedBox(
                              height: 10.h,
                            ),
                            Image.asset(
                              edanaLogoimg,
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 10.h,
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
                              height: 10.h,
                            ),
                            Text(
                              '©Copyright 2023 Edana Pty. Ltd.',
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
          ],
        ),
      ),
    );
  }
}
