import 'package:edana/DbHelper/cache_helper.dart';

class AppConstants {
  static const String BUILD_DATE = '30.09.2022';

  // static const String BASE_URL =
  //     'http://192.168.18.37/scrap-station/public/index.php/';

  static String BASE_URL = 'https://client2.ed-space.net/api';
  String registrationUrl =
      "https://emsglobal.ed-space.net/utilities/api-EDSO.cfm";

  static init() async {
    dynamic temp = await CacheHelper.getData(key: MobileAPI);
    if (temp != null) {
      BASE_URL = temp;
    }
  }

  // alphanumeric and &%=
  // static final VALID_INPUT_EMAIL = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final VALID_INPUT_EMAIL = RegExp(r'^[a-zA-Z0-9@._]+');
  static final VALID_INPUT = RegExp(r'^[a-zA-Z0-9_ ]+');
  static final VALID_INPUT_COMMENT = RegExp(r'^[a-zA-Z0-9_ @.?,]+');
  static final VALID_INPUT_NO = RegExp(r'^[0-9]+');

  // // sharePreference
  static const String ContactProductUID = 'ContactProductUniqueID';
  static const String LicenseName = 'ValidTo';
  static const String Product = 'Product';
  static const String MobileAPI = 'MobileAPI';
  static const String URL = 'URL';
  static const String Logo = 'Logo';
  static const String LogoRGB = 'LogoRGB';
  static const String CountryCode = 'CountryCode';

  static const String IS_LOGGED_IN = 'isLoggedin';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String CURRENCY = 'currency';

  //Language
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
}
