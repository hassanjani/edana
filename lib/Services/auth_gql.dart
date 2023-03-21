String signinMutation = """
mutation {
  initiateLogin(
    email: "oliver.g@nymonsolutions.com"
    password: "Edana+"
    rememberMe: false
    inviteOperationId: null
  ) 
  {
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
    pendingTcConfirmation
    tcConfirmationToken
    termsConditions
    {
      id
      name
      content
    }
  }
}
""";

String signupMutation = """
mutation Register(\$email:String!, \$password:String!,\$name:String!,\$fcmToken:String){
  register(email:\$email,password:\$password,name:\$name,fcmToken:\$fcmToken){
    error{
      message
    }
    id
    token
  }
}
""";
String resetPasswordMutation='''
mutation ResetPassword(\$email:String!)
resetPassword(email:\$email){
  success
  message
}
''';
