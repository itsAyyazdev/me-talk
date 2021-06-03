import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/registerdatabeans.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class RegisterRepository {
  RegisterData registerData = RegisterData();
  String deviceId;
  int deviceType;
  bool isIOS;
  String firebaseTokan;
  Dio dio = Dio();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

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
  }

  Future<bool> registerUserApiCall(BuildContext context,String phone, String phoneCode) async {
    await initPlatformState();
    deviceType = isIOS ? DeviceTypeID.IOS.index : DeviceTypeID.ANDROID.index;

//    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//    await _firebaseMessaging.getToken().then((token) {
//      firebaseTokan = token;
//    });

    String email = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.User_Email);
    String gender = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Gender);
    String password = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Password);
    String userName = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.User_Name);
    int recommendCode = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Recommend_Code);
    //int phoneCode = await SharePreferencesHelper.getInstant()
        //.getInt(SharePreferencesHelper.Phone_Code);
    try {
      print(email +
          "\n " +
          password +
          " \n" +
          phone.split(phoneCode.toString())[1] +
          " \n" +
          userName +
          " \n" +
          deviceId +
          " \n" +
          deviceType.toString()+
          " \n" +
          phoneCode.toString()+
          " \n" +
          gender.toString()
      );
      ApiResponse apiResponse =
          await restClientNew.post(context, Api.REGISTER, body: {
        "email": email,
        "password": password,
        "phone": phone.split(phoneCode.toString())[1],
        "name": userName,
        "device_id": deviceId,
        "device_type_id": deviceType,
        //"recommended_code": recommendCode,
        "phone_code": phoneCode,
            "gender": gender,
      });
      if (apiResponse.statusCode == 200) {
        print("Success sign in");
        //PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return true;
      } else {
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        print("failed sign in");
        return false;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
