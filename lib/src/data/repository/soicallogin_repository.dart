import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class SoicalLoginRepository {
  String deviceId;
  bool isIOS;
  Dio dio = Dio();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Future callFacebook(token, BuildContext context) async {
    int socialID, socialTypeId, deviceType, countryID, cityId;
    String email, name, avtar, deviceToken;
    final graphResponse = await dio.get(
        "https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=$token");
    print("here *******" + json.decode(graphResponse.data).toString());
    final Map<String, dynamic> profile = json.decode(graphResponse.data);
    socialTypeId = SocialLoginTypeId.FACEBOOK.index;
    socialID = int.parse(profile['id']);
    name = profile['name'];
    if (profile.containsKey('picture')) {
      avtar = profile['picture']['data']['url'];
    }
    if (profile.containsKey('email')) {
      email = profile['email'];
      print("Successfull");
      socialLoginApiCall(context, socialTypeId, socialID, email, name, avtar,
          deviceType, deviceToken, countryID, cityId);
    } else {
      print("UnSuccessfull");
      //checkSocialUserApiCall(context);
    }
  }

  Future<void> initPlatformState() async {
    IosDeviceInfo iosInfo;
    AndroidDeviceInfo androidInfo;
    try {
      if (Platform.isAndroid) {
        androidInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidInfo.androidId;
        isIOS = false;
      } else if (Platform.isIOS) {
        iosInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosInfo.identifierForVendor;
        isIOS = true;
      }
    } on Exception {}
    print('deviceId $deviceId');
  }

  void socialLoginApiCall(
      BuildContext context,
      int socialTypeId,
      int socialID,
      String email,
      String name,
      String avtar,
      int deviceType,
      dynamic deviceToken,
      int countryID,
      int cityId) async {
    await initPlatformState();
    deviceType = isIOS ? DeviceTypeID.IOS.index : DeviceTypeID.ANDROID.index;

    try {
      ApiResponse apiResponse =
          await restClientNew.post(context, Api.SOICAL_lOGIN, body: {
        "social_login_type_id": socialTypeId,
        "social_id": socialID,
        "email": email,
        "avatar": avtar,
        "device_id": deviceId,
        "device_type": deviceType,
        "device_token": deviceToken,
        "country_id": countryID,
        "city_id": cityId,
      });
      if (apiResponse.statusCode == 200) {
        print("LOGINED");
        await SharePreferencesHelper.getInstant().setAccessToken(
            SharePreferencesHelper.Access_Token, apiResponse.data.token);

        print(await SharePreferencesHelper()
            .getAccessToken(SharePreferencesHelper.Access_Token));

        await SharePreferencesHelper.getInstant()
            .setBool(SharePreferencesHelper.Is_Login, true);

        await SharePreferencesHelper().setString(
            SharePreferencesHelper.User_Name, jsonEncode(apiResponse.data));
        print(await SharePreferencesHelper()
            .getString(SharePreferencesHelper.User_Name));

        //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        
        // Utility.showAlertDialogCallBack(
        //     context: context, message: _response.message);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Future<> updateOnBoardStatus(
  //     BuildContext context) async {
  //   try {
  //     ApiResponse apiResponse = await restClientNew.put(
  //         context, Api.UPDATE_ON_BOARD_STATUS,
  //         body: onBoardStatus.toJson());

  //     if (apiResponse.status) {
  //       var data = apiResponse.data as Map<String, dynamic>;
  //       return OnBoardStatus.fromJson(data);
  //     } else {
  //       return Future.error(apiResponse.message);
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }
}
