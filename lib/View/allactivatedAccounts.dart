import 'dart:convert';

import 'package:edana/DbHelper/cache_helper.dart';
import 'package:edana/Model/activate_account_model.dart';
import 'package:edana/globals.dart' as globals;
import 'package:edana/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../utils/colors.dart';
import 'activatedAccount.dart';

class AllActivatedAccounts extends StatefulWidget {
  const AllActivatedAccounts({super.key});

  @override
  State<AllActivatedAccounts> createState() => _AllActivatedAccountsState();
}

class _AllActivatedAccountsState extends State<AllActivatedAccounts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchActivateAccountList();
  }

  RegistarModal? registarModal;
  fetchActivateAccountList() async {
    final uri = Uri.parse(AppConstants().registrationUrl);
    final headers = {'Content-Type': 'application/json'};
    var request = json.encode({
      "Name": "registration",
      "Code": "830074",
      "Platform": "iOS",
      "DeviceID": "1234567890ABCDEFGHIJKLM",
      "UserType": "Edana",
      "ProductID": 1857
    });
    var response = await post(uri, body: request, headers: headers);
    //  var data =jsonDecode(response.body.toString());

    // setState(() {
    // });
    // print('Status code: ${response.statusCode}');
    // print('Body: ${response.body}');

    if (response.statusCode == 200) {
      debugPrint('Ye response ha');
      RegistarModal responseModel =
          RegistarModal.fromJson(jsonDecode(response.body));
      registarModal = responseModel;
      CacheHelper.saveData(
          key: AppConstants.ContactProductUID,
          value: responseModel.registration!.contactProductUniqueID);
      CacheHelper.saveData(
          key: AppConstants.LicenseName,
          value: responseModel.registration!.licenseName);
      CacheHelper.saveData(
          key: "ValidTo", value: responseModel.registration!.validTo);
      CacheHelper.saveData(
          key: AppConstants.Product,
          value: responseModel.registration!.product);
      CacheHelper.saveData(
          key: AppConstants.URL, value: responseModel.registration!.uRL);
      CacheHelper.saveData(
          key: AppConstants.MobileAPI,
          value: responseModel.registration!.mobileAPI);
      CacheHelper.saveData(
          key: AppConstants.Logo, value: responseModel.registration!.logo);
      CacheHelper.saveData(
          key: AppConstants.LogoRGB,
          value: responseModel.registration!.logoRGB);
      CacheHelper.saveData(
          key: AppConstants.COUNTRY_CODE,
          value: responseModel.registration!.countryCode);

      Navigator.pop(context);
      print(response.body);
    } else {
      print('api hit nhi hui');
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 8.w, bottom: 18.h),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: Color(0xff3F51B5),
            onPressed: () {
              Get.to(ActivatedAccount());
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Activated Accounts',
          style: TextStyle(
              fontFamily: 'latoBold', fontSize: 18, color: whiteTextColor),
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/school_logo_1.png',
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 50,
            ),
            globals.registrationData!.isNotEmpty
                ? Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: size.width,
                          height: size.height * 0.15,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(
                                  '${''}',
                                  style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  '${''}',
                                  style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 12,
                                  ),
                                ),
                                // leading: Image.network(
                                //   activateAccountModel!.registration!.logo.toString(),
                                //   width: 72,
                                //   height: 72,
                                //   //fit: BoxFit.cover,
                                // )
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator(
                    color: StatusBarColor,
                  ),
          ],
        ),
      ),
    );
  }
}
