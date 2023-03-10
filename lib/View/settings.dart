import 'package:edana/View/homePage.dart';
import 'package:edana/View/notificationsScreen.dart';
import 'package:flutter/material.dart';
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
            SizedBox(
              width: size.width / 1.05,
              height: size.height / 4.5,
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
                    ListTile(
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
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 2000,
                    // ),
                    ListTile(
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
                    ListTile(
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 1.95,
            ),
            SizedBox(
              height: size.height / 11,
              width: size.width / 1.05,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 2,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(HomePage());
                      },
                      icon: Column(
                        children: [
                          ImageIcon(
                            const AssetImage(
                              'assets/images/home_inactive_footer.png',
                            ),
                            color: mainTextColor,
                            size: 18,
                          ),
                          // SizedBox(
                          //   height: 2,
                          // ),
                          // Text('Home',
                          //     style: TextStyle(
                          //         fontFamily: 'latoRegular',
                          //         fontSize: 12,
                          //         color: mainTextColor))
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Column(
                        children: [
                          ImageIcon(
                            const AssetImage(
                              'assets/images/notification_inactive_footer.png',
                            ),
                            color: mainTextColor,
                            size: 18,
                          ),
                          // Text(
                          //   'data',
                          //   style: GoogleFonts.lato(fontSize: 10),
                          // )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Column(
                        children: [
                          ImageIcon(
                            AssetImage(
                              'assets/images/profile_inactive_footer.png',
                            ),
                            color: mainTextColor,
                            size: 18,
                          ),
                          // Text(
                          //   'data',
                          //   style: GoogleFonts.lato(fontSize: 10),
                          // )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(SettingScreen());
                      },
                      icon: ListView(
                        children: [
                          ImageIcon(
                            AssetImage(
                              'assets/images/settings_active_footer.png',
                            ),
                            color: mainTextColor,
                            size: 18,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text('Settings',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 9,
                                  color: mainTextColor))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
