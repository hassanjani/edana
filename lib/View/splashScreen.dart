import 'dart:async';
import 'dart:convert';

import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/colors.dart';
import 'loginDefault.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TenantInfoModel? tenantInfoModel;
  fetchTenantInfo() async {
    final uri = Uri.parse(AppConstants.BASE_URL);
    final headers = {'Content-Type': 'application/json'};
    const json =
        '''{"query":"{\\r\\n  tenantInfo {\\r\\n    logoFileId\\r\\n    appLoginBgImgId\\r\\n    tenantId\\r\\n    isAdminTenant\\r\\n    loginPageMessage\\r\\n    siteName\\r\\n    __typename\\r\\n  }\\r\\n}\\r\\n","variables":{}}''';

    var response = await post(uri, body: json, headers: headers);

    // var data =jsonDecode(response.body.toString());
    TenantInfoModel responseModel =
        TenantInfoModel.fromJson(jsonDecode(response.body));

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      tenantInfoModel = responseModel;

      debugPrint('Ye response ha');
      print('Model: ' + tenantInfoModel!.tenantInfoData.toString());

      print(response.body);
    } else {
      print('api hit nhi hui');
    }
    return responseModel;
  }

  // fetchQuery()async{
  //   await DBHelper.deleteTable(DBHelper.registrationTable);
  // }

  @override
  void initState() {
    super.initState();
    // fetchQuery();
    setState(() {
      fetchTenantInfo();
    });
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Login(
                      tenantInfoModel: tenantInfoModel,
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height / 14,
              width: size.width / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/edana_logo_splashscreen.png'),
                  //fit: BoxFit.cover
                ),
              ),
            ),
            Text(
              'Powered By Gowell Solutions',
              style: TextStyle(
                  fontFamily: 'latoRegular',
                  fontSize: 13.1,
                  color: splashTextColor),
            ),
            SizedBox(
              height: size.height / 100,
            ),
            Divider(
              height: 2,
              color: whiteTextColor,
              indent: 80,
              endIndent: 80,
            ),
            SizedBox(
              height: size.height / 100,
            ),
            Text(
              'Educating the Next Generation',
              style: TextStyle(
                  fontFamily: 'latoRegular',
                  fontSize: 16,
                  color: splashTextColor),
            ),
          ],
        ),
      ),
    ));
  }
}
