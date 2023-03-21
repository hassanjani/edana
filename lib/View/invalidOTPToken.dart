import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'conditionsBox.dart';
import 'successBox.dart';

class InvalidOTPBox extends StatefulWidget {
   InvalidOTPBox({super.key,required this.tenantInfoModel});
TenantInfoModel? tenantInfoModel;
  @override
  State<InvalidOTPBox> createState() => _InvalidOTPBoxState();
}

class _InvalidOTPBoxState extends State<InvalidOTPBox> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              
              child: Image.network('https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.appLoginBgImgId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}',fit: BoxFit.cover,)
            ),
            Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ScreenUtil().setHeight(150.h)),
              Center(
                child: SizedBox(
                  width: size.width / 1.05,
                  height: ScreenUtil().setHeight(320.h),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 2,
                    color: Colors.white.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Oops!',
                            style: TextStyle(
                                fontFamily: 'latoBold',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: mainTextColor),
                          ),
                          SizedBox(
                            height: 25.h,
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
                            height: 25.h,
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
                                  () =>  ConditionsBox(tenantInfoModel: widget.tenantInfoModel,),
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
                            height: 30.h,
                          ),
                         Image.asset(edanaLogoimg,height: 15.h,),

                          SizedBox(
                            height: 25.h,
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
                            height: 25.h,
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
