import 'package:edana/View/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'settings.dart';

class SoundsScreen extends StatefulWidget {
  const SoundsScreen({super.key});

  @override
  State<SoundsScreen> createState() => _SoundsScreenState();
}

class _SoundsScreenState extends State<SoundsScreen> {
 
 
  List<Object?> result = ['abs'];

// this is the channel that links flutter with native code
static const channel = MethodChannel('com.example.pomo_app/mychannel');

// this method waits for results from the native code 
Future<void> getRingtones() async {
    try {
      result = await channel.invokeMethod('getAllRingtones');

    } on PlatformException catch (ex) {
      print('Exception: $ex.message');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRingtones();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Sounds',
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
            Text(
              'Select the notification sound',
              style: TextStyle(
                  fontFamily: 'latoRegular',
                  fontSize: 14,
                  color: Color(0xff727272)),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index){
                return  SizedBox(
                width: size.width / 1.05,
                height: size.height*0.1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                            leading: Text(
                              '${result[index]}',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 16,
                                  color: hintTextColor),
                            ),
                            onTap: (){
                                FlutterRingtonePlayer.play(
                      android: AndroidSounds.notification,
                      ios: IosSounds.glass,
                      looping: true,
                      volume: 1.0,
                    );
                            },
                            dense: true,
                            trailing: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff07C200)),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 15,
                                color: Color(0xff07C200),
                              ),
                            )),
                  ),
                ),
              );
                       
              }),
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
