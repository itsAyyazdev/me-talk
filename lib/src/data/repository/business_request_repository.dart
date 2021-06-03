import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/popup_dialogs/token_expire_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class BusinessRequestRepository {
  static Future<bool> businessRequestApiCall(
      BuildContext context,
      String name,
      String address,
      int subCatId,
      int recommendedCode,
      String email,
      int requestId,
      double lat,
      double long,
      String cityName,
      String countryName,
      File portfoliopic,
      File licencepic,
      File identificationPic) async {
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    FormData formData = new FormData.fromMap({
      "name": name,
      "address": address,
      "category_id": subCatId,
      "recommend_code": recommendedCode ?? 0,
      "email": email,
      "entity_type_id": requestId,
      "latitude": lat,
      "longitude": long,
      "city_id": cityName,
      "country_id": countryName,
      "portfolio": portfoliopic != null
          ? await MultipartFile.fromFile(portfoliopic.path,
              filename: "portfoliopic.jpeg")
          : null,
      "licence": licencepic != null
          ? await MultipartFile.fromFile(licencepic.path,
              filename: "licencepic.jpeg")
          : null,
      "identification": identificationPic != null
          ? await MultipartFile.fromFile(identificationPic.path,
              filename: "identificationPic.jpeg")
          : null,
    });

    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.BusinessRequest,
          body: formData, header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        LoadingWidget.endLoadingWidget(context);
        return true;
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
        return false;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
    }
  }

  Future<bool> logoutApiCall(BuildContext context) async {
    int id = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Id);
    try {
      ApiResponse apiResponse =
          await restClientNew.post(context, Api.LOGOUT, body: {
        "user_id": id,
      });
      if (apiResponse.statusCode == 200) {
        return true;
      } else {
        if (apiResponse.statusCode == 401) {
          SharePreferencesHelper.getInstant()
              .setBool(SharePreferencesHelper.Is_Login, false);
          SharePreferencesHelper.getInstant().clearPreference();
          TokenExpirePopup.displayMessage(context, apiResponse.message);
        } else {
          PopupDialogs.displayMessage(context, apiResponse.message);
        }
        return false;
      }
    } catch (e) {
      return null;
    }
  }
}
