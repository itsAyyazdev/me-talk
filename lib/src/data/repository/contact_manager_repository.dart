import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/popup_dialogs/token_expire_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class ContactManagerRepository {
  static Future<bool> contactManagertApiCall(
      BuildContext context, String subject, String message) async {
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.CategoryList,
          body: {"subject": subject, "message": message},
          header: {"Authorization": "Bearer $accessToken"});
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
      return false;
      //return Future.error(e.toString());
    }
  }
}
