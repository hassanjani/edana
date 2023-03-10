import 'package:edana/View/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'settings.dart';
import 'soundsScreen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Notification Status',
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
            // SizedBox(
            //   height: size.height / 50,
            // ),
            SizedBox(
              width: size.width / 1.05,
              height: size.height / 6,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications Status',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 16,
                                color: hintTextColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'On',
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 14,
                                    color: Color(0xff727272)),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.toggle_on,
                                    size: 35,
                                    color: Color(0xff07C200),
                                  )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Sounds',
                            style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 16,
                                color: hintTextColor),
                          ),
                          Row(
                            children: [
                              Text(
                                'Marimba',
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 14,
                                    color: Color(0xff727272)),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(SoundsScreen());
                                },
                                icon: ImageIcon(
                                  AssetImage("assets/images/sideIcon.png"),
                                  color: Color(0xff727272),
                                  size: 35,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 1.70,
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
                          SizedBox(
                            height: 2,
                          ),
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
                                  fontSize: 10,
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
