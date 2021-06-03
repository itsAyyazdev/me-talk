import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/models/profileupdatebeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/popup_dialogs/token_expire_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class ProfileRepository {
  LoginData loginData = LoginData();
  Future<ProfileUpdateData> profileUpdateApiCall(
      BuildContext context,
      File avatar,
      String name,
      String phoneNo,
      int gender,
      int language) async {
    int id = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Id);
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    int phoneCode = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Phone_Code);
    FormData formData = new FormData.fromMap({
      "user_id": id,
      "avatar": avatar != null
          ? await MultipartFile.fromFile(avatar.path, filename: "avatar.jpeg")
          : null,
      "name": name ?? null,
      "phone_number":
          phoneNo != null ? phoneNo.split(phoneCode.toString())[1] : null,
      "phone_code": phoneCode ?? null,
      "gender": gender ?? null,
      "language": language ?? null
    });

    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.PROFILE_UPDATE,
          body: formData, header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        return ProfileUpdateData.fromJson(apiResponse.data);
      } else {
        if (apiResponse.statusCode == 401) {
          SharePreferencesHelper.getInstant()
              .setBool(SharePreferencesHelper.Is_Login, false);
          SharePreferencesHelper.getInstant().clearPreference();
          TokenExpirePopup.displayMessage(context, apiResponse.message);
        } else {
          PopupDialogs.displayMessage(context, apiResponse.message);
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ApiResponse> checkBusinessApiCall(BuildContext context) async {
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.CHECK_BUSINESS_INFO,
          header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        LoadingWidget.endLoadingWidget(context);
        return apiResponse;
      } else {
        LoadingWidget.endLoadingWidget(context);
        if (apiResponse.statusCode == 401) {
          SharePreferencesHelper.getInstant()
              .setBool(SharePreferencesHelper.Is_Login, false);
          SharePreferencesHelper.getInstant().clearPreference();
          TokenExpirePopup.displayMessage(context, apiResponse.message);
        } else {
          PopupDialogs.displayMessage(context, apiResponse.message);
        }
        return null;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
    }
  }

  Future<bool> logoutApiCall(BuildContext context) async {
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    try {
      ApiResponse apiResponse = await restClientNew.post(context, Api.LOGOUT,
          header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        return true;
      } else {
        PopupDialogs.displayMessage(context, apiResponse.message);
        return false;
      }
    } catch (e) {
      return null;
    }
  }

  Future<LoginData> updateProfileApiCall(
    BuildContext context,
    String name,
    File avatar,
    String gender,
    int phoneNo,
    String mail,
  ) async {
    int id = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Id);
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    int phoneCode = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Phone_Code);
    FormData formData = new FormData.fromMap({
      "user_id": id,
      "avatar": avatar != null
          ? await MultipartFile.fromFile(avatar.path, filename: "avatar.jpeg")
          : null,
      "display_name": name ?? null,
      "phone_number": phoneNo != null ? phoneNo : null,
      "phone_code": phoneCode ?? null,
      "gender": gender ?? null,
      "email": mail ?? null,
    });

    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.PROFILE_EDIT,
          body: formData, header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        loginData = LoginData.fromJson(apiResponse.data);
        SharePreferencesHelper.getInstant().setString(
            SharePreferencesHelper.User_Data, jsonEncode(apiResponse.data));
        Navigator.of(context).pop();
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return loginData;
//        return ProfileData.fromJson(apiResponse.data);
      } else {
        if (apiResponse.statusCode == 401) {
          SharePreferencesHelper.getInstant()
              .setBool(SharePreferencesHelper.Is_Login, false);
          SharePreferencesHelper.getInstant().clearPreference();
          TokenExpirePopup.displayMessageOnly(context, apiResponse.message);
        } else {
          PopupDialogs.displayMessageOnly(context, apiResponse.message);
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
