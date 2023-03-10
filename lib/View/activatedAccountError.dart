import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'oopsBox.dart';
import 'successBox.dart';
import 'successScreen.dart';

class ActivatedAccountError extends StatefulWidget {
  const ActivatedAccountError({super.key});

  @override
  State<ActivatedAccountError> createState() => _ActivatedAccountErrorState();
}

class _ActivatedAccountErrorState extends State<ActivatedAccountError> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Activate Account'),
        backgroundColor: StatusBarColor,
        elevation: 0,
      ),
      body: Center(
        child: Container(
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
                height: size.height / 2,
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
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Oops!',
                          style: GoogleFonts.lato(
                              fontSize: 28, color: mainTextColor),
                        ),
                        SizedBox(
                          height: size.height / 35,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Something went wrong! Either your',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: blackTextColor,
                              ),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\ninternet connection is not working or',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: blackTextColor,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text: '\nthe registration code ABC344 is not',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: blackTextColor,
                                    ),
                                  )),
                              TextSpan(
                                  text: '\nvalid',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                    color: blackTextColor,
                                  ))),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: size.height / 35,
                        ),
                        SizedBox(
                          height: size.height / 15,
                          width: size.width / 1.35,
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
                            onPressed: () {
                              Get.to(
                                () => const ScuuessScreen(),
                                fullscreenDialog: false,
                                popGesture: true,
                                transition: Transition.noTransition,
                              );
                            },
                            child: Text('Try Again',
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
      ),
    );
  }
}
