import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'homePage.dart';

class ConditionsBox extends StatefulWidget {
  const ConditionsBox({Key? key}) : super(key: key);

  @override
  State<ConditionsBox> createState() => _ConditionsBoxState();
}

class _ConditionsBoxState extends State<ConditionsBox> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                  height: size.height / 1.55,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'ABC Academy Term of Use',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'latoSemiBold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: blackTextColor),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: RichText(
                              text: TextSpan(
                                text: 'OVERVIEW',
                                style: TextStyle(
                                    fontFamily: 'latoRegular',
                                    fontSize: 13,
                                    color: blackTextColor),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: size.height / 120,
                          // ),
                          ListTile(
                            title: Text(
                              'This website is operated by Columbia Academy.'
                              'Throughout the site, the terms '
                              '“we”, “us” and “our” refer to Columbia'
                              'Academy. Columbia Academy offers this website,'
                              'including all information, tools and services available '
                              'from this site to you, the user, conditioned upon your '
                              'acceptance of all terms, conditions, policies and notices stated here.'
                              'By visiting our site and/ or purchasing something from us, you engage in our '
                              '“Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), ',
                              //'These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.Any new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.Our store is hosted on Columbia Academy Inc. They provide us with the online e-commerce platform that allows us to sell our products and services to you.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'latoRegular',
                                fontSize: 15,
                              ),
                            ),
                          ),
                          // Center(
                          //   child: SizedBox(
                          //     height: size.height / 3,
                          //     child: const Expanded(
                          //       child: SingleChildScrollView(
                          //         scrollDirection: Axis.vertical,
                          //         child: Text(
                          //           'This website is operated by Columbia Academy.'
                          //           'Throughout the site, the terms '
                          //           '“we”, “us” and “our” refer to Columbia'
                          //           'Academy. Columbia Academy offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.By visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.Any new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.Our store is hosted on Columbia Academy Inc. They provide us with the online e-commerce platform that allows us to sell our products and services to you.',
                          //           style: TextStyle(
                          //             fontFamily: 'latoRegular',
                          //             fontSize: 15,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: CheckboxListTile(
                                title: Text(
                                    "I agree fully with the above conditions"),
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              )

                              // child: Row(
                              //   //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Container(
                              //       width:
                              //           20.0, // Customize the width of the OTP text field
                              //       height:
                              //           20.0, // Customize the height of the OTP text field
                              //       decoration: BoxDecoration(
                              //         //color: Colors.grey,
                              //
                              //         border: Border.all(
                              //             color: Color(0xff979797), width: 2.5),
                              //
                              //         borderRadius: BorderRadius.circular(
                              //             4.0), // Customize the border radius
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: size.width / 30,
                              //     ),
                              //     RichText(
                              //       text: TextSpan(
                              //         text:
                              //             'I agree fully with the above conditions',
                              //         style: TextStyle(
                              //             fontFamily: 'latoBold',
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.bold,
                              //             color: blackTextColor),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              ),
                          SizedBox(
                            height: size.height / 40,
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
                                  () => const HomePage(),
                                  fullscreenDialog: false,
                                  popGesture: true,
                                  transition: Transition.noTransition,
                                );
                              },
                              child: Text('Proceed with Login',
                                  style: TextStyle(
                                      fontFamily: 'latoSemiBold',
                                      fontSize: 18,
                                      color: whiteTextColor)),
                            ),
                          ),
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
