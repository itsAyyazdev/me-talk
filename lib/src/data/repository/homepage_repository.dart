import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/HomePageDatabeans.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/popup_dialogs/token_expire_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class HomePageRepository {
  Future<HomePageData> homepageApiCall(
    BuildContext context,
  ) async {
    int id = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Id);
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    try {
      ApiResponse apiResponse =
          await restClientNew.post(context, Api.HOMEPAGE, body: {
        "user_id": id,
      }, header: {
        "Authorization": "Bearer $accessToken"
      });
      if (apiResponse.statusCode == 200) {
        // HomePageData homePageData = HomePageData();
        // homePageData = HomePageData.fromJson(apiResponse.data);
        return HomePageData.fromJson(apiResponse.data);
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
      //return Future.error(e.toString());
    }
  }
}
