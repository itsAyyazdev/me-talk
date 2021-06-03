import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/CommonMsgDisplayResponsebeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class LogoutApiRepository {

  CommonMsgDisplayResponse commonData = CommonMsgDisplayResponse();
  Dio dio = Dio();

  Future<bool> logoutApiCall(
      BuildContext context,String phone,String password
      ) async {
    try {
      LoadingWidget.startLoadingWidget(context);
      String token = await SharePreferencesHelper.getInstant()
          .getString(SharePreferencesHelper.Access_Token);
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
      };
      ApiResponse apiResponse = await restClientNew.post(context, Api.LOGOUT, header:headers);
      if (apiResponse.statusCode == 200) {
        LoadingWidget.endLoadingWidget(context);
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return null;
      } else {
        LoadingWidget.endLoadingWidget(context);
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return null;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
    }
  }

}
