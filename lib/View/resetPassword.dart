import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/utils/app_constants.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../utils/colors.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key, this.tenantInfoModel});
  TenantInfoModel? tenantInfoModel;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetPasswordReq('');
  }

  resetPasswordReq(String? email) async {
    final uri = Uri.parse(AppConstants.BASE_URL);
    final headers = {'Content-Type': 'application/json'};
    var json =
        '''{"query":"\\r\\nmutation \\r\\n{\\r\\n  requestEmailPasswordReset\\r\\n  (\\r\\n    email: \\"${email}\\"\\r\\n    areaKey:\\"login-page\\"\\r\\n  )\\r\\n}\\r\\n\\r\\n","variables":{}}''';
    var response = await post(uri, body: json, headers: headers);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      debugPrint('Ye response ha');
      print(response.body);
    } else {
      print('api hit nhi hui');
    }
    return response.body;
  }

//    var headers = {
//   'Content-Type': 'application/json',
//   'Cookie': 'CFGLOBALS=urltoken%3DCFID%23%3D105136766%26CFTOKEN%23%3D1676d7389ae506a3%2DCC9B7DB9%2DDEBF%2D5689%2D432BF479061D4808%23lastvisit%3D%7Bts%20%272023%2D03%2D09%2018%3A37%3A12%27%7D%23hitcount%3D3%23timecreated%3D%7Bts%20%272023%2D03%2D09%2018%3A36%3A23%27%7D%23cftoken%3D1676d7389ae506a3%2DCC9B7DB9%2DDEBF%2D5689%2D432BF479061D4808%23cfid%3D105136766%23; CFID=105136766; CFTOKEN=1676d7389ae506a3%2DCC9B7DB9%2DDEBF%2D5689%2D432BF479061D4808'
// };
// var request = http.post( Uri.parse('https://emsglobal-dev.ed-space.net/utilities/api-EDSO.cfm '));
//  var params = ({
//   "Name": "registration",
//   "Code": "786656",
//   "Platform": "iOS",
//   "DeviceID": "1234567890ABCDEFGHIJKLM",
//   "UserType": "Edana",
//   "ProductID": 1857
// });

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

  final TextEditingController _emailCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Column(
              children: [
                SizedBox(
                  height: 65.h,
                ),
                Center(
                  child: SizedBox(
                    width: size.width / 1.05,
                    height: 530.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      color: Colors.white.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              'Reset Password',
                              style: TextStyle(
                                  fontFamily: 'latoBold',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: mainTextColor),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}'
                                    .isNotEmpty
                                ? CircleAvatar(
                                    radius: 40.h,
                                    backgroundImage: NetworkImage(
                                        'https://edana2-staging-fs.ed-space.net/file/${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.logoFileId}/download?tenantId=${widget.tenantInfoModel!.tenantInfoData!.tenantInfo!.tenantId}'),
                                  )
                                : CircleAvatar(
                                    radius: 40.h,
                                    backgroundImage: AssetImage(loginBgImage)),

                            SizedBox(
                              height: size.height / 30,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'School Name',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: blackTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 300.w,
                                    child: TextFormField(
                                      cursorColor: mainTextColor,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("               Email address is required in order to reset\n                                    your password");
                                        }
                                      },
                                      controller: _emailCon,
                                      keyboardType: TextInputType.emailAddress,
                                      showCursor: true,
                                      style: const TextStyle(fontSize: 20.0),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Email',
                                        hintStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffA2A2A2)),
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
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
                                onPressed: () async {
                                  String verifyEmail = _emailCon.text;
                                  if (_formKey.currentState!.validate()) {
                                    resetPasswordReq(verifyEmail);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Email Confirmed'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('something went wrong'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  }
                                  // await resetPasswordReq('registration','786656','android','','Edana','1857');
                                  setState(() {});
                                  // Get.to(ActivatedAccount());
                                },
                                child: Text('Send Reset Password Link',
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
                              height: 30.h,
                            ),
                            Image.asset(
                              edanaLogoimg,
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              height: 10.h,
                            ),
                            Text(
                              '©Copyright 2023 Edana Pty. Ltd.',
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: greyTextColor),
                            ),
                            //
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
