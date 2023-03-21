import 'package:edana/View/homePage.dart';
import 'package:edana/View/notificationsScreen.dart';
import 'package:edana/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'allactivatedAccounts.dart';
import 'splashScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Text(
            'Settings',
            style: TextStyle(
                fontFamily: 'latoBold', fontSize: 18, color: whiteTextColor),
          ),
        ),
        elevation: 0,
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
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: size.width / 1.05,
                height: 170.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(
                                () => const NotificationsScreen(),
                                fullscreenDialog: false,
                                popGesture: true,
                                transition: Transition.noTransition,
                              );
                        },
                        child: ListTile(
                          leading: Text(
                            'Notifications',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 16,
                                color: hintTextColor),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Get.to(
                                () => const NotificationsScreen(),
                                fullscreenDialog: false,
                                popGesture: true,
                                transition: Transition.noTransition,
                              );
                            },
                            icon: ImageIcon(
                              AssetImage("assets/images/sideIcon.png"),
                              color: Color(0xff727272),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height / 2000,
                      // ),
                      InkWell(
                        onTap: (){
                          Get.to(AllActivatedAccounts());
                        },
                        child: ListTile(
                          leading: Text(
                            'Activated Accounts',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 16,
                                color: hintTextColor),
                          ),
                          dense: true,
                          trailing: IconButton(
                            onPressed: () {
                              Get.to(AllActivatedAccounts());
                            },
                            icon: ImageIcon(
                              AssetImage("assets/images/sideIcon.png"),
                              color: Color(0xff727272),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        
                        child: ListTile(
                          leading: Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 16,
                                color: hintTextColor),
                          ),
                          // trailing: IconButton(
                          //   onPressed: () {
                          //     Get.to(NotificationsScreen());
                          //   },
                          //   icon: ImageIcon(
                          //     AssetImage("assets/images/sideIcon.png"),
                          //     color: Color(0xff727272),
                          //     size: 10,
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            
            ],
          ),
        ),
      ),
    );
  }
}
