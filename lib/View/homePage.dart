import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/View/conditionsBox.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      if (Provider.of<AuthProvider>(context, listen: false)
          .loginDataModel!
          .continueLogin
          .termsConditions
          .isEmpty) {
       
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backGroundColor,
        
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 1,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${context.watch<AuthProvider>().loginDataModel!.continueLogin.user.fullName}",
                    style: TextStyle(
                        fontFamily: 'latoBold',
                        fontSize: 18,
                        color: whiteTextColor),
                  ),
                  Text("Straton High School",
                      style: TextStyle(
                          fontFamily: 'latoRegular',
                          fontSize: 16,
                          color: whiteTextColor)),
                ],
              ),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 48,
              height: 48,
              // child:  Image.network("${context.watch<AuthProvider>().loginDataModel!.continueLogin!.user!.photoUrl}",scale: 30),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "${context.watch<AuthProvider>().loginDataModel!.continueLogin?.user?.photoUrl}",
                    scale: 40),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          actions:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20.h,
                backgroundImage: AssetImage(
                  logoImg,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset('assets/images/school_cover_1.png'),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              SizedBox(
                height: 300.h,
                width: size.width / 1.05,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Image.asset(bellImg,height: 50.h,),
                        SizedBox(
                          width: size.width / 20,
                        ),
                       Image.asset(profileIcon,height: 50.h,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Image.asset(edanaLogoimg,height: 20.h,),
              SizedBox(
                height: 5.h,
              ),
              Text('Version 1.2.72',
                  style: TextStyle(
                      fontFamily: 'latoRegular',
                      fontSize: 12.sp,
                      color: lightGreyTextColor)),
                      SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ));
  }
}
