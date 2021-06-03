import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper {
  static SharePreferencesHelper sharePreferenceHelper;
  static const String User_Data = 'user_data';
  static const String Id = 'id';
  static const String User_Name = 'user_Name';
  static const String User_Email = 'user_Email';
  static const String Saved_Email = 'save_Email';
  static const String Saved_PW = 'save_pw';
  static const String Phone_No = 'phone_no';
  static const String Password = 'password';
  static const String Recommend_Code = 'recommend_code';
  static const String Phone_Code = 'phone_code';
  static const String Avatar = 'avatar';
  static const String Gender = 'Gender';
  static const String Language = 'Language';
  static const String Country_Data = 'countryData';
  static const String Is_Login = 'is_login';
  static const String Access_Token = 'access_Token';
  static const String Type_of_business = "type_of_business";
  static const String Business_Id = "Business_Id";
  static const String CITY_NAME = 'cityname';
  static const String STATE_NAME = 'statename';
  static const String COUNTRY_NAME = 'countryname';
  static const String COUNTRY_ID = 'countryId';
  static const String COUNTRY_CODE = 'countryCode';
  static const String CITY_ID = 'countryId';
  static const String STATE_ID = 'countryId';
  static const String LATITUDE = 'latitude';
  static const String LONGITUDE = 'longitude';
  static const String editedMobileNumber = 'editedMobileNumber';
  static const String editedMobileCode = 'editedMobileCode';

  static SharePreferencesHelper getInstant() {
    if (sharePreferenceHelper == null) {
      sharePreferenceHelper = new SharePreferencesHelper();
    }
    return sharePreferenceHelper;
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? null;
  }

  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getAccessToken(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  setAccessToken(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? null;
  }

  setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? null;
  }

  setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
