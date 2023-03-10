import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/View/conditionsBox.dart';
import 'package:flutter/material.dart';
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
        Get.to(
          () => const ConditionsBox(),
          fullscreenDialog: false,
          popGesture: true,
          transition: Transition.noTransition,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            elevation: 1,
            title: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${context.watch<AuthProvider>().loginDataModel!.continueLogin!.user!.fullName}",
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
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 48,
                height: 48,
                // child:  Image.network("${context.watch<AuthProvider>().loginDataModel!.continueLogin!.user!.photoUrl}",scale: 30),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${context.watch<AuthProvider>().loginDataModel!.continueLogin!.user!.photoUrl}",
                      scale: 40),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
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
          body: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset('assets/images/school_cover_1.png'),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              SizedBox(
                height: size.height / 2.10,
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
                        Container(
                          height: 55,
                          width: 91,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/notification_main.png'),
                              //fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width / 20,
                        ),
                        Container(
                          height: 55,
                          width: 91,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_main.png'),
                              //fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 100,
              ),
              Column(
                children: [
                  Container(
                    height: 20,
                    width: 88,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/edana_logo_black.png'),
                        //fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Text('Version 1.2.72',
                      style: TextStyle(
                          fontFamily: 'latoRegular',
                          fontSize: 12,
                          color: lightGreyTextColor))
                ],
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
                          Get.to(
                            () => const HomePage(),
                            fullscreenDialog: false,
                            popGesture: true,
                            transition: Transition.noTransition,
                          );
                        },
                        icon: Column(
                          children: [
                            ImageIcon(
                              const AssetImage(
                                'assets/images/home_active_footer.png',
                              ),
                              color: mainTextColor,
                              size: 18,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text('Home',
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 10,
                                    color: mainTextColor))
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
                          Get.to(
                            () => const SettingScreen(),
                            fullscreenDialog: false,
                            popGesture: true,
                            transition: Transition.noTransition,
                          );
                        },
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage(
                                'assets/images/settings_inactive_footer.png',
                              ),
                              color: mainTextColor,
                              size: 22,
                            ),
                            // Text(
                            //   'data',
                            //   style: GoogleFonts.lato(fontSize: 10),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
