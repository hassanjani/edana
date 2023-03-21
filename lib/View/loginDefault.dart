import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edana/Api/api_response.dart';
import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/DbHelper/shared_prefrences.dart';
import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/Services/apiRequest.dart';
import 'package:edana/View/loginSchoolBG.dart';
import 'package:edana/View/otpScreen.dart';
import 'package:edana/View/schoolLoginOTP.dart';
import 'package:edana/error.dart';
import 'package:edana/utils/colors.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'resetPassword.dart';

class Login extends StatefulWidget {
  Login({super.key, this.tenantInfoModel});
  TenantInfoModel? tenantInfoModel;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Future<ApiResponse<TenantInfoModel>?>? _getTenantInfoService;

// fetchTenantInfo() async {
//     final uri = Uri.parse('https://client2.ed-space.net/api/graphql ');
//     final headers = {'Content-Type': 'application/json'};
//     const json =
//          '''{"query":"{\\r\\n  tenantInfo {\\r\\n    logoFileId\\r\\n    appLoginBgImgId\\r\\n    tenantId\\r\\n    isAdminTenant\\r\\n    loginPageMessage\\r\\n    siteName\\r\\n    __typename\\r\\n  }\\r\\n}\\r\\n","variables":{}}''';

//     var response = await post(
//       uri,
//       body: json,
//       headers: headers
//     );

//    // var data =jsonDecode(response.body.toString());
// TenantInfoModel responseModel=TenantInfoModel.fromJson(jsonDecode(response.body));

//     print('Status code: ${response.statusCode}');
//     print('Body: ${response.body}');

//     if (response.statusCode == 200){
//       setState(() {
//       tenantInfoModel = responseModel;
//     });
//       debugPrint('Ye response ha');
//       print('Model: ' + tenantInfoModel!.tenantInfoData.toString());
//       print(response.body);
//     } else {
//       print('api hit nhi hui');
//     }
//     return responseModel;
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getTenantInfoService = TenantInfoService().fetchTenantInfo(context);
    // fetchTenantInfo();
    // print('https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}');
  }
  // Future _handleRefresh()async{
  //   _getTenantInfoService = TenantInfoService().fetchTenantInfo(context);

  // }

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool? isChecked = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("School 1"), value: "School 1"),
      DropdownMenuItem(child: Text("School 2"), value: "School 2"),
      DropdownMenuItem(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>OTPSCreen(tenantInfoModel: widget.tenantInfoModel,)));
            },
            child: Text(
              "+ Activate another Site",
              style: TextStyle(color: lightblueTextColor),
            ),
          ),
          value: "+ Activate another Site"),
    ];
    return menuItems;
  }

// final List<String> dropdownItems = [
//       'School 1',
//       'School 2',
//       '+ Activate another Site',
//     ];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
        widget.tenantInfoModel!=null?  Container(
            height: ScreenUtil().setHeight(640.h),
            width: size.width,
            decoration: const BoxDecoration(),
            child:  Image.network(
               widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId!=null? 
              'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.appLoginBgImgId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}':'',
              fit: BoxFit.cover,
            ),
          ):CircularProgressIndicator(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: size.width / 1.05,
                    height: 580.h,
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
                              height: 15.h,
                            ),
                            CircleAvatar(
                              radius: 35.h,
                              backgroundImage: NetworkImage( 'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}'),),
                
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 300.w,
                              child: DropdownButtonFormField(
                                  menuMaxHeight: 200.h,
                                  isDense: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  hint: Text(
                                    'School 1',
                                    style: TextStyle(
                                        fontFamily: 'latoRegular',
                                        fontSize: 16,
                                        color: Color(0xff323232)),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        bottom: 1.h,
                                        left: 13.w,
                                        right: 10.w,
                                        top: 1.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
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
                              height: 10.h,
                            ),
                            Container(
                              width: 300.w,
                              child: TextFormField(
                                controller: emailControler,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none
                                  ),
                                  focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 16,
                                      color: Color(0xffA2A2A2)),
                                  contentPadding: EdgeInsets.only(
                                      left: 15,
                                      bottom: 11.h,
                                      top: 13.h,
                                      right: 15),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 300.w,
                              
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return 'Password must be 6 charachters';
                                  }
                                },
                                controller: passwordControler,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 16,
                                      color: Color(0xffA2A2A2)),
                                  contentPadding: EdgeInsets.only(
                                      left: 15,
                                      bottom: 11.h,
                                      top: 13.h,
                                      right: 0),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
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
                                        onChanged: (value) {
                                          setState(() {
                                            // print(value);
                                            isChecked = value;
                                          });
                                        },
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Remain Logged In',
                                          style: TextStyle(
                                              fontFamily: 'latoBold',
                                              fontSize: 12.sp,
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
                              height: 10.h,
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
                                  final String email = emailControler.text;
                                  final String password =
                                      passwordControler.text;
                                  print('ye ja rhi ha aagy ' + email);
                                  if (_formKey.currentState!.validate()) {
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .initiateLogin(context, email, password,
                                            (bool check, String msg) {
                                      if (check) {
                                        Get.to(
                                          () => LoginSchoolBGImage(
                                            cnfrmEmail: email,
                                            cnfrmPaswrd: password,
                                            tenantInfoModel:
                                                widget.tenantInfoModel,
                                          ),
                                          fullscreenDialog: false,
                                          popGesture: true,
                                          transition: Transition.noTransition,
                                        );
                                        // DbHelper.deleteTable(DbHelper.registrationTable);
                                      }
                                    });
                                  }
                
                                  // Get.to(
                                  //   () => const LoginSchoolBGImage(),
                                  //   fullscreenDialog: false,
                                  //   popGesture: true,
                                  //   transition: Transition.noTransition,
                                  // );
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
                            SizedBox(height: 10.h),
                            Container(
                              margin: EdgeInsets.only(left: 27),
                              child: Text(
                                widget.tenantInfoModel!.tenantInfoData!
                                            .tenantInfo!.loginPageMessage !=
                                        null
                                    ? widget.tenantInfoModel!.tenantInfoData!
                                        .tenantInfo!.loginPageMessage
                                        .toString()
                                    : '',
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 14,
                                    color: lightGreyTextColor),
                              ),
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));

    //      StreamBuilder<ApiResponse<TenantInfoModel>?>(
    //       stream: _getTenantInfoService!.asStream(),
    //       builder:(context,snapshot){
    //         switch (snapshot.connectionState){
    //           case ConnectionState.waiting:
    //           return Center(child: CircularProgressIndicator(),);
    //           break;
    //           default:
    //           if(snapshot.hasData){
    //             switch (snapshot.data!.status) {
    //                     case Status.LOADING:
    //                       return Center(child: CircularProgressIndicator());
    //                       break;
    //                     case Status.COMPLETED:
    //                       return
    //                       break;
    //                     case Status.ERROR:
    //                       return ShowError(
    //                           errorMessage: snapshot.data!.message.toString(),height: 200,width: 300,
    //                           onRetryPressed: () => _handleRefresh());
    //                       break;
    //           }
    //         }
    //          return ShowError(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     errorMessage: "An unexpected Error Occurred",
    //                     onRetryPressed: () => _handleRefresh());
    //                 break;

    // }}));
  }

  // void initiateLogin() async {
  //   // final String url = 'https://client2.ed-space.net/api/graphql';
  //   final String url = 'https://client1.ed-space.net/api/graphql';
  //   final String email = emailControler.text;
  //   final String password = passwordControler.text;
  //
  //   final GraphQLClient client = GraphQLClient(
  //     cache: GraphQLCache(),
  //     link: HttpLink(url),
  //   );
  //
  //   final MutationOptions options = MutationOptions(
  //     document: gql('''
  //     mutation {
  //       initiateLogin(
  //         email: "$email"
  //         password: "$password"
  //         rememberMe: false
  //         inviteOperationId: null
  //       ) {
  //         user {
  //           id
  //           fullName
  //           firstName
  //           lastName
  //           middleName
  //           titleId
  //           gender
  //           photoUrl
  //           photoFileId
  //           tenantId
  //           organisationGroupId
  //           isStudent
  //           isStaff
  //         }
  //         pendingEmailConfirmation
  //         pendingMobileConfirmation
  //         pendingTcConfirmation
  //         tcConfirmationToken
  //         termsConditions {
  //           id
  //           name
  //           content
  //         }
  //       }
  //     }
  //   '''),
  //   );
  //
  //   final QueryResult result = await client.mutate(options);
  //
  //   print(result.toString());
  //
  //   if (result.data != null) {
  //     LoginDataModel loginDataModel = LoginDataModel.fromMap(result.data!);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('otp sent to email'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //
  //     Get.to(
  //       () => const SchoolLoginOTP(),
  //       fullscreenDialog: false,
  //       popGesture: true,
  //       transition: Transition.noTransition,
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Login Failed'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   }
  //
  //   if (result.hasException) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(result.exception.toString()),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //
  //     print(result.exception.toString());
  //   } else {
  //     print(result.data.toString());
  //   }
  // }
}
