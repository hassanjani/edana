import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'activatedAccountError.dart';
import 'oopsBox.dart';

class ActivatedAccount extends StatefulWidget {
  const ActivatedAccount({super.key});

  @override
  State<ActivatedAccount> createState() => _ActivatedAccountState();
}

class _ActivatedAccountState extends State<ActivatedAccount> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Activate Account'),
        backgroundColor: StatusBarColor,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 1.05,
              height: size.height / 1.65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 2,
                color: Colors.white.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'To begin, please enter the',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: blackTextColor,
                              ),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 6-digit',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: blackTextColor,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: ' site',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: blackTextColor,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\nactivation code that you have received from',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: blackTextColor,
                                  ),
                                ),
                              ),
                              const TextSpan(text: '\nyour institution')
                            ]),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width:
                                40.0, // Customize the width of the OTP text field
                            height:
                                48.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width:
                                40.0, // Customize the width of the OTP text field
                            height:
                                48.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width:
                                40.0, // Customize the width of the OTP text field
                            height:
                                48.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width:
                                40.0, // Customize the width of the OTP text field
                            height:
                                48.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width:
                                40.0, // Customize the width of the OTP text field
                            height:
                                48.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width:
                                40.0, // Customize the width of the OTP text field
                            height:
                                48.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width:
                                20.0, // Customize the width of the OTP text field
                            height:
                                20.0, // Customize the height of the OTP text field
                            decoration: BoxDecoration(
                              //color: Colors.grey,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  4.0), // Customize the border radius
                            ),

                            // child: TextField(
                            //   textAlign: TextAlign.center,
                            //   keyboardType: TextInputType.number,
                            //   style: TextStyle(fontSize: 20.0),
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //   ),
                            // ),
                          ),
                          SizedBox(
                            width: size.height / 30,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'I Have read and agreed with the',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: greyTextColor,
                                  ),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' End \nUser Lisence Agreement.',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: lightblueTextColor,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 1.35,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(inactiveButtonColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(
                              () => const ActivatedAccountError(),
                              fullscreenDialog: false,
                              popGesture: true,
                              transition: Transition.noTransition,
                            );
                          },
                          child: Text('Activate',
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
                        height: size.height / 30,
                      ),
                      Text(
                        'If you have not received this code,please contact',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'your institution',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        height: size.height / 18,
                        width: size.width / 4,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/edana_logo_black.png'),
                            //fit: BoxFit.cover
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        height: size.height / 30,
                      ),
                      Text(
                        '©Copyright 2021 Edana Pty. Ltd.',
                        style: GoogleFonts.lato(
                            fontSize: 12, color: greyTextColor),
                      ),
                      //
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
