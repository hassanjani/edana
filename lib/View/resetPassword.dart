import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../utils/colors.dart';
import 'activatedAccount.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void resetPassword() async {
    setState(() {
      resetPassword();
    });

    HttpLink link = HttpLink("https://client1.ed-space.net/api/graphql");
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );
    QueryResult queryResult =
        await qlClient.query(QueryOptions(document: gql("""
mutation {
  resetpassword(){
    email
    areakey
  }
}
""")));
  }

  TextEditingController _emailCon = TextEditingController();
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GraphQLProvider(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/school_bg.png'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: size.height / 60,
                // ),
                SizedBox(
                  width: size.width / 1.05,
                  height: size.height / 1.25,
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
                          Text(
                            'Reset Password',
                            style: TextStyle(
                                fontFamily: 'latoBold',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: mainTextColor),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          Container(
                            height: size.height / 8,
                            width: size.width / 4,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/school_logo_1.png'),
                                //fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'School Name',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: blackTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          Container(
                            height: size.height / 15,
                            width: size.width / 1.35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Customize the border radius
                            ),
                            child: TextFormField(
                              cursorColor: mainTextColor,
                              controller: _emailCon,
                              keyboardType: TextInputType.emailAddress,
                              showCursor: true,
                              style: const TextStyle(fontSize: 20.0),
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Color(0xffA2A2A2)),
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  'Email address is required in order to reset',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 13,
                                  color: errorRedColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'your password',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 13,
                                  color: errorRedColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 30,
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
                                resetPassword();
                                // Get.to(ActivatedAccount());
                              },
                              child: Text('Send Reset Password Link',
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
      ),
    );
  }
}
