import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/findiddatabeans.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';

class FindIDPageRepository {
  FindIDData loginData = FindIDData();
  Dio dio = Dio();

  Future<bool> findIdApiCall(
      BuildContext context,String phone
      ) async {
    try {
      LoadingWidget.startLoadingWidget(context);
      ApiResponse apiResponse = await restClientNew.post(context, Api.FORGOT_EMAIL,
          body: {
            "phone": phone,
          });
      if (apiResponse.statusCode == 200) {
        LoadingWidget.endLoadingWidget(context);
        Navigator.pop(context);
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return true;
      } else {
        LoadingWidget.endLoadingWidget(context);
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return false;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
    }
  }
}
