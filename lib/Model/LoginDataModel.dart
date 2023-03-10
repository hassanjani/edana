// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromMap(jsonString);

import 'dart:convert';

class LoginDataModel {
  LoginDataModel({
    required this.continueLogin,
  });

  ContinueLogin continueLogin;

  factory LoginDataModel.fromJson(String str) =>
      LoginDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginDataModel.fromMap(Map<String, dynamic> json) => LoginDataModel(
        continueLogin: ContinueLogin.fromMap(json["continueLogin"]),
      );

  Map<String, dynamic> toMap() => {
        "continueLogin": continueLogin.toMap(),
      };
}

class ContinueLogin {
  ContinueLogin({
    required this.user,
    required this.pendingEmailConfirmation,
    required this.pendingMobileConfirmation,
    required this.termsConditions,
  });

  User user;
  bool pendingEmailConfirmation;
  bool pendingMobileConfirmation;
  List<dynamic> termsConditions;

  factory ContinueLogin.fromJson(String str) =>
      ContinueLogin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContinueLogin.fromMap(Map<String, dynamic> json) => ContinueLogin(
        user: User.fromMap(json["user"]),
        pendingEmailConfirmation: json["pendingEmailConfirmation"],
        pendingMobileConfirmation: json["pendingMobileConfirmation"],
        termsConditions:
            List<dynamic>.from(json["termsConditions"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "pendingEmailConfirmation": pendingEmailConfirmation,
        "pendingMobileConfirmation": pendingMobileConfirmation,
        "termsConditions": List<dynamic>.from(termsConditions.map((x) => x)),
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.titleId,
    required this.gender,
    required this.photoUrl,
    required this.photoFileId,
    required this.tenantId,
    required this.organisationGroupId,
    required this.isStudent,
    required this.isStaff,
    required this.typename,
  });

  String id;
  String fullName;
  String firstName;
  String lastName;
  dynamic middleName;
  int titleId;
  String gender;
  dynamic photoUrl;
  dynamic photoFileId;
  int tenantId;
  int organisationGroupId;
  bool isStudent;
  bool isStaff;
  String typename;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        titleId: json["titleId"],
        gender: json["gender"],
        photoUrl: json["photoUrl"],
        photoFileId: json["photoFileId"],
        tenantId: json["tenantId"],
        organisationGroupId: json["organisationGroupId"],
        isStudent: json["isStudent"],
        isStaff: json["isStaff"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fullName": fullName,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "titleId": titleId,
        "gender": gender,
        "photoUrl": photoUrl,
        "photoFileId": photoFileId,
        "tenantId": tenantId,
        "organisationGroupId": organisationGroupId,
        "isStudent": isStudent,
        "isStaff": isStaff,
        "__typename": typename,
      };
}
