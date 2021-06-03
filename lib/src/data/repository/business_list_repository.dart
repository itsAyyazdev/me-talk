import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/type_of_businessListbeans.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/popup_dialogs/token_expire_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class BusinessListRepository {
  static Future<List<BusinessListData>> businesslistApiCall(
      BuildContext context, String type) async {
    // int id = await SharePreferencesHelper.getInstant()
    //     .getInt(SharePreferencesHelper.Id);
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.CategoryList,
          body: {"type": type},
          header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        List<dynamic> list = apiResponse.data;
        List<BusinessListData> sendFinalList = [];
        for (var i = 0; i < list.length; i++) {
          sendFinalList.add(BusinessListData.fromJson(apiResponse.data[i]));
        }
        return sendFinalList;
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
