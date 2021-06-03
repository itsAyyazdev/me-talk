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

class UploadPortfolioPicRepository {
  static Future<bool> uploadPortfolioPicApiCall(BuildContext context,
      int categoryProfileId, List<File> portfoliopic) async {
    print(portfoliopic.length);
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    List uploadImages = [];
    if (portfoliopic != null) {
      for (var i = 0; i < portfoliopic.length; i++) {
        uploadImages.add(await MultipartFile.fromFile(portfoliopic[i].path,
            filename: "portfoliopic$i.jpeg"));
      }
    }

    FormData formData = new FormData.fromMap(
        {"category_profile_id": categoryProfileId, "gallary": uploadImages});

    try {
      ApiResponse apiResponse = await restClientNew.post(
        context,
        Api.Upload_Portfolio_Pics,
        body: formData,
        header: {"Authorization": "Bearer $accessToken"},
      );
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
}
