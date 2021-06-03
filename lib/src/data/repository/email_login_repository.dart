import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class EmailLoginRepository {
  LoginData loginData = LoginData();
  String deviceId;
  int deviceType;
  bool isIOS;
  String firebaseTokan;
  Dio dio = Dio();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<LoginData> emailLoginApiCall(
    BuildContext context,
  ) async {
    try {
//      final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//      await _firebaseMessaging.getToken().then((token) {
//        firebaseTokan = token;
//      });
      LoadingWidget.startLoadingWidget(context);
      String email = await SharePreferencesHelper.getInstant()
          .getString(SharePreferencesHelper.User_Email);
      String password = await SharePreferencesHelper.getInstant()
          .getString(SharePreferencesHelper.Password);
      ApiResponse apiResponse = await restClientNew.post(context, Api.LOGIN,
          body: {
            "email": email,
            "password": password,
            //"firebase_tokan": firebaseTokan
          });
      if (apiResponse.statusCode == 200) {
        loginData = LoginData.fromJson(apiResponse.data);
        String token  = apiResponse.data['token'].toString();
        SharePreferencesHelper.getInstant().setAccessToken(
            SharePreferencesHelper.Access_Token,token);
//        SharePreferencesHelper.getInstant().setString(
//            SharePreferencesHelper.User_Data, apiResponse.data['user'].toString());
        SharePreferencesHelper.getInstant().setString(
            SharePreferencesHelper.User_Data, jsonEncode(apiResponse.data));
        SharePreferencesHelper.getInstant()
            .setBool(SharePreferencesHelper.Is_Login, true);
        return loginData;
      } else {
        LoadingWidget.endLoadingWidget(context);
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return null;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
      //return Future.error(e.toString());
    }
  }
}
