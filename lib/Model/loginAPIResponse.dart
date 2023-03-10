// To parse this JSON data, do
//
//     final loginApiResponse = loginApiResponseFromJson(jsonString);

import 'dart:convert';

LoginApiResponse loginApiResponseFromJson(String str) => LoginApiResponse.fromJson(json.decode(str));

String loginApiResponseToJson(LoginApiResponse data) => json.encode(data.toJson());

class LoginApiResponse {
    LoginApiResponse({
        required this.data,
    });

    Data data;

    factory LoginApiResponse.fromJson(Map<String, dynamic> json) => LoginApiResponse(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.tenantInfo,
    });

    TenantInfo tenantInfo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tenantInfo: TenantInfo.fromJson(json["tenantInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "tenantInfo": tenantInfo.toJson(),
    };
}

class TenantInfo {
    TenantInfo({
        required this.logoFileId,
        this.appLoginBgImgId,
        required this.tenantId,
        required this.isAdminTenant,
        required this.loginPageMessage,
        required this.siteName,
        required this.typename,
    });

    String logoFileId;
    dynamic appLoginBgImgId;
    int tenantId;
    bool isAdminTenant;
    String loginPageMessage;
    String siteName;
    String typename;

    factory TenantInfo.fromJson(Map<String, dynamic> json) => TenantInfo(
        logoFileId: json["logoFileId"],
        appLoginBgImgId: json["appLoginBgImgId"],
        tenantId: json["tenantId"],
        isAdminTenant: json["isAdminTenant"],
        loginPageMessage: json["loginPageMessage"],
        siteName: json["siteName"],
        typename: json["__typename"],
    );

    Map<String, dynamic> toJson() => {
        "logoFileId": logoFileId,
        "appLoginBgImgId": appLoginBgImgId,
        "tenantId": tenantId,
        "isAdminTenant": isAdminTenant,
        "loginPageMessage": loginPageMessage,
        "siteName": siteName,
        "__typename": typename,
    };
}