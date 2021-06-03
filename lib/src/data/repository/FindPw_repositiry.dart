import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/CommonMsgDisplayResponsebeans.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';

class FindPWRepository {

  CommonMsgDisplayResponse commonData = CommonMsgDisplayResponse();
  Dio dio = Dio();

  Future<bool> findPWApiCall(
      BuildContext context,String phone,String password
      ) async {
    try {
      LoadingWidget.startLoadingWidget(context);
      ApiResponse apiResponse = await restClientNew.post(context, Api.FORGOT_PASSWORD,
          body: {
            "phone": phone,
            "password": password,
          });
      if (apiResponse.statusCode == 200) {
        LoadingWidget.endLoadingWidget(context);
        int count = 0;
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return true;
      } else {
        LoadingWidget.endLoadingWidget(context);
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return true;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
    }
  }

}
