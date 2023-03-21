import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'resetPassword.dart';
import 'schoolLoginOTP.dart';

class LoginSchoolBGImage extends StatefulWidget {
  LoginSchoolBGImage({super.key,  this.cnfrmEmail, this.cnfrmPaswrd ,this.tenantInfoModel});
  String? cnfrmEmail;
  String? cnfrmPaswrd;
  TenantInfoModel? tenantInfoModel;
  @override
  State<LoginSchoolBGImage> createState() => _LoginSchoolBGImageState();
}

class _LoginSchoolBGImageState extends State<LoginSchoolBGImage> {
  TextEditingController cnfrmEmailController = TextEditingController();
  TextEditingController cnfrmPasswordController = TextEditingController();
    bool? isChecked = false;

    List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("School 1"),value: "School 1"),
    DropdownMenuItem(child: Text("School 2"),value: "School 2"),
    DropdownMenuItem(child: Text("+ Activate another Site",style: TextStyle(color: lightblueTextColor),),value: "+ Activate another Site"),
  ];
  return menuItems;
}
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: ScreenUtil().setHeight(650.h),
              width: size.width,
             
              child: Image.network('https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.appLoginBgImgId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}',fit: BoxFit.fill,)
      
            ),
            Column(
              children: [
            SizedBox(height: 47.h,),
      
                Center(
                  child: SizedBox(
                    width: size.width / 1.05,
                    height: ScreenUtil().setHeight(580.h),
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
                              height: 10.h,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'latoBold',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: mainTextColor),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                             CircleAvatar(
                              radius: 40.h,
                              backgroundImage:NetworkImage(
                            'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}'.isNotEmpty?

                                          'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}':"")
                                      ,
                            ),

                                   
                            SizedBox(
                              height: 15.h
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                Container(
                                        height: 50.h,
                                        width: 300.w,
                                        
                                        child: DropdownButtonFormField(
      
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          hint: Text('School 1',
                                                style: TextStyle(
                                                    fontFamily: 'latoRegular',
                                                    fontSize: 16,
                                                    color: Color(0xff323232)),),
                          decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 2.h,left: 13.w,right: 10.w,top: 2.h),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor:Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: dropdownItems),
                                      ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: 300.w,
                                   
                                    child: TextFormField(
                                      controller: cnfrmEmailController,
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "Email not matched";
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(fontSize: 20.0),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(16),
                                          borderSide: BorderSide.none ),
                                          errorBorder:OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(16),
                                          borderSide: BorderSide.none ),
                                          focusedBorder: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(16),
                                          borderSide: BorderSide.none ),
                                        hintText: 'Email',
                                        hintStyle: const TextStyle(
                                            fontFamily: 'latoRegular',
                                            fontSize: 16,
                                            color: Color(0xffA2A2A2)),
                                        contentPadding: EdgeInsets.only(
                                            left: 15, bottom: 11, top: 11, right: 15),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h
                                  ),
                                  Container(
                                    
                                    width: 300.w,
                                   
                                    child: TextFormField(
                                      controller: cnfrmPasswordController,
                                      validator: (value) {
                                        if(value!.length<6){
                                          return "enter correct password";
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      style: TextStyle(fontSize: 20.0),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(16),
                                          borderSide: BorderSide.none ),
                                          errorBorder:OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(16),
                                          borderSide: BorderSide.none ),
                                          focusedBorder: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(16),
                                          borderSide: BorderSide.none ),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            fontFamily: 'latoRegular',
                                            fontSize: 16,
                                            color: Color(0xffA2A2A2)),
                                        contentPadding: EdgeInsets.only(
                                            left: 15, bottom: 11, top: 11, right: 15),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                           
                             Padding(
                              padding:  EdgeInsets.only(left: 1.w,right: 15.w),

                               child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                                      children: [
                                        Row(
                                          children: [
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
                                                text: 'Remain Logged In',
                                                style: TextStyle(
                                                    fontFamily: 'latoBold',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff363636)),
                                              ),
                                            ),
                                          
                                          ],
                                        ),
                                          Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: (() {
                                                    Get.to(
                                                      () =>  ResetPassword(tenantInfoModel: widget.tenantInfoModel),
                                                      fullscreenDialog: false,
                                                      popGesture: true,
                                                      transition: Transition.noTransition,
                                                    );
                                                  }),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: 'Forgot Password?',
                                                      style: TextStyle(
                                                          fontFamily: 'latoBold',
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          color: appBarColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      ],
                                    ),
                             ),
                                 
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height:50.h,
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
                                  String? confrmEmail = cnfrmEmailController.text;
                                  String? cnfrmPassword = cnfrmPasswordController.text;
                                  if(_formKey.currentState!.validate()) {
                                    setState(() {
                                      
                                    });
                                    if(widget.cnfrmEmail==confrmEmail&&
                                    widget.cnfrmPaswrd==cnfrmPassword){
                                       print('ye glt ha'+confrmEmail + ' Password '+ cnfrmPassword);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Confirmed Successfully'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );  
                                           Get.to(
                                      () =>  SchoolLoginOTP(tenantInfoModel: widget.tenantInfoModel,),
                                      fullscreenDialog: false,
                                      popGesture: true,
                                      transition: Transition.noTransition,
                                      
                                    );
                                    setState(() {
                                      
                                    });
                                    }
                                     else{
                                     ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('You enterd a wrong Email'),
                                        duration: Duration(seconds: 10),
                                      ),
                                    );
                                  }
                                   
                                  }
                           
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
                              height: 10.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: size.width*0.07),
                              child: Text(
                               widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.loginPageMessage.toString(),
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 14,
                                    color: lightBlackTextColor),
                              ),
                            ),
                           
                            SizedBox(
                              height: 15.h,
                            ),
                           Image.asset(edanaLogoimg,height: 15.h,),
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
                  ),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}
