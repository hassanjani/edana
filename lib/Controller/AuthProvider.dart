import 'package:edana/Model/LoginDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthProvider extends ChangeNotifier {
  User? user;
  LoginDataModel? loginDataModel;

  void initiateLogin(BuildContext context, String email, String password,
      Function callback) async {
    // final String url = 'https://client2.ed-space.net/api/graphql';
    final String url = 'https://client1.ed-space.net/api/graphql';

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(url),
    );

    final MutationOptions options = MutationOptions(
      document: gql('''
      mutation {
        initiateLogin(
          email: "$email"
          password: "$password"
          rememberMe: false
          inviteOperationId: null
        ) {
          user {
            id
            fullName
            firstName
            lastName
            middleName
            titleId
            gender
            photoUrl
            photoFileId
            tenantId
            organisationGroupId
            isStudent
            isStaff
          }
          pendingEmailConfirmation
          pendingMobileConfirmation
          pendingTcConfirmation
          tcConfirmationToken
          termsConditions {
            id
            name
            content
          }
        }
      }
    '''),
    );

    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.data != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('otp sent to email'),
          duration: Duration(seconds: 3),
        ),
      );

      callback(true, "");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Failed'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    if (result.hasException) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.exception.toString()),
          duration: Duration(seconds: 3),
        ),
      );

      print(result.exception.toString());
    } else {
      print(result.data.toString());
    }
  }

  void validateOtp(BuildContext context, String otp, Function callback) async {
    // final String url = 'https://client2.ed-space.net/api/graphql';
    final String url = 'https://client1.ed-space.net/api/graphql';

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(url),
    );

    final MutationOptions options = MutationOptions(
      document: gql('''
      mutation {
  continueLogin(
    emailConfirmationToken: "$otp"
    mobileConfirmationToken: null
    personId: ""
    inviteOperationId: null
    passwordResetOperationId: null
  ) {
    user 
    {
      id
      fullName
      firstName
      lastName
      middleName
      titleId
      gender
      photoUrl
      photoFileId
      tenantId
      organisationGroupId
      isStudent
      isStaff
      __typename
    }
    pendingEmailConfirmation
    pendingMobileConfirmation
    termsConditions {
      id
      name
      content
      __typename
    }
  }
}
'''),
    );

    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.data != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful'),
          duration: Duration(seconds: 3),
        ),
      );
      loginDataModel = LoginDataModel.fromMap(result.data!);

      callback(true, "");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('otp incorrect'),
          duration: Duration(seconds: 3),
        ),
      );
      callback(false, "");
    }

    if (result.hasException) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.exception.toString()),
          duration: Duration(seconds: 3),
        ),
      );

      print(result.exception.toString());
    } else {
      print(result.data.toString());
    }
  }
}
