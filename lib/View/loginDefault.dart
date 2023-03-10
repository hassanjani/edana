import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edana/Controller/AuthProvider.dart';
import 'package:edana/View/schoolLoginOTP.dart';
import 'package:edana/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'resetPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownItems = [
      'School 1',
      'School 2',
      '+ Activate another Site',
    ];
    String? selectedValue;
    final _formKey = GlobalKey<FormState>();

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                height: size.height / 60,
              ),
              SizedBox(
                width: size.width / 1.05,
                height: size.height / 1.15,
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
                        // SizedBox(
                        //   height: size.height / 50,
                        // ),
                        Text(
                          'Login',
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
                              image:
                                  AssetImage('assets/images/school_logo_1.png'),
                              //fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        Column(
                          children: [
                            Container(
                              height: size.height / 15,
                              width: size.width / 1.35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    16.0), // Customize the border radius
                              ),
                              child: DropdownButtonFormField2(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                                isExpanded: false,
                                hint: const Text(
                                  'School 1',
                                  style: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 16,
                                      color: Color(0xff323232)),
                                ),
                                items: dropdownItems
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontFamily: 'latoRegular',
                                                fontSize: 16,
                                                color: Color(0xffA2A2A2)),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'School 1';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  //Do something when changing the item if you want.
                                },
                                onSaved: (value) {
                                  selectedValue = value.toString();
                                },
                                buttonStyleData: const ButtonStyleData(
                                    // height: 120,
                                    //padding: EdgeInsets.only(left: 20, right: 10),
                                    ),
                                iconStyleData: const IconStyleData(
                                  icon: ImageIcon(
                                    AssetImage("assets/images/dropdown.png"),
                                    color: Color(0xffA2A2A2),
                                    size: 24,
                                  ),
                                  iconSize: 30,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 60,
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
                              child: TextField(
                                controller: emailControler,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 16,
                                      color: Color(0xffA2A2A2)),
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 60,
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
                              child: TextField(
                                controller: passwordControler,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'latoRegular',
                                      fontSize: 16,
                                      color: Color(0xffA2A2A2)),
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 50,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 240,
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
                              width: size.width / 60,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Remain Logged In',
                                style: TextStyle(
                                    fontFamily: 'latoBold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff363636)),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 8,
                            ),
                            GestureDetector(
                              onTap: (() {
                                Get.to(
                                  () => const ResetPassword(),
                                  fullscreenDialog: false,
                                  popGesture: true,
                                  transition: Transition.noTransition,
                                );
                              }),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot Password?',
                                  style: TextStyle(
                                      fontFamily: 'latoBold',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: appBarColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 50,
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
                              final String email = emailControler.text;
                              final String password = passwordControler.text;

                              Provider.of<AuthProvider>(context, listen: false)
                                  .initiateLogin(context, email, password,
                                      (bool check, String msg) {
                                if (check) {
                                  Get.to(
                                    () => const SchoolLoginOTP(),
                                    fullscreenDialog: false,
                                    popGesture: true,
                                    transition: Transition.noTransition,
                                  );
                                }
                              });
                              // Get.to(
                              //   () => const LoginSchoolBGImage(),
                              //   fullscreenDialog: false,
                              //   popGesture: true,
                              //   transition: Transition.noTransition,
                              // );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'latoSemiBold',
                                  fontSize: 18,
                                  color: whiteTextColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Text(
                          'Access to this site is monitored by Edsecure,',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 14,
                              color: lightGreyTextColor),
                        ),
                        Text(
                          'unauthorized access attempts will be tracked.',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 14,
                              color: lightGreyTextColor),
                        ),
                        SizedBox(
                          height: size.height / 100,
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
                          height: size.height / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 14,
                                  color: appBarColor),
                            ),
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 14,
                                  color: appBarColor),
                            ),
                            Text(
                              'Terms of Use',
                              style: TextStyle(
                                  fontFamily: 'latoRegular',
                                  fontSize: 14,
                                  color: appBarColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height / 55,
                        ),
                        Text(
                          '©Copyright 2021 Edana Pty. Ltd.',
                          style: TextStyle(
                              fontFamily: 'latoRegular',
                              fontSize: 14,
                              color: greyTextColor),
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
    );
  }

  // void initiateLogin() async {
  //   // final String url = 'https://client2.ed-space.net/api/graphql';
  //   final String url = 'https://client1.ed-space.net/api/graphql';
  //   final String email = emailControler.text;
  //   final String password = passwordControler.text;
  //
  //   final GraphQLClient client = GraphQLClient(
  //     cache: GraphQLCache(),
  //     link: HttpLink(url),
  //   );
  //
  //   final MutationOptions options = MutationOptions(
  //     document: gql('''
  //     mutation {
  //       initiateLogin(
  //         email: "$email"
  //         password: "$password"
  //         rememberMe: false
  //         inviteOperationId: null
  //       ) {
  //         user {
  //           id
  //           fullName
  //           firstName
  //           lastName
  //           middleName
  //           titleId
  //           gender
  //           photoUrl
  //           photoFileId
  //           tenantId
  //           organisationGroupId
  //           isStudent
  //           isStaff
  //         }
  //         pendingEmailConfirmation
  //         pendingMobileConfirmation
  //         pendingTcConfirmation
  //         tcConfirmationToken
  //         termsConditions {
  //           id
  //           name
  //           content
  //         }
  //       }
  //     }
  //   '''),
  //   );
  //
  //   final QueryResult result = await client.mutate(options);
  //
  //   print(result.toString());
  //
  //   if (result.data != null) {
  //     LoginDataModel loginDataModel = LoginDataModel.fromMap(result.data!);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('otp sent to email'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //
  //     Get.to(
  //       () => const SchoolLoginOTP(),
  //       fullscreenDialog: false,
  //       popGesture: true,
  //       transition: Transition.noTransition,
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Login Failed'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   }
  //
  //   if (result.hasException) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(result.exception.toString()),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //
  //     print(result.exception.toString());
  //   } else {
  //     print(result.data.toString());
  //   }
  // }
}
