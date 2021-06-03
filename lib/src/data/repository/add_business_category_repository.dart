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

class AddBusinessCategoryRepository {
  static Future<bool> addBusinessCategoryApiCall(
      BuildContext context, int businessId, int categoryId) async {
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.AddBusinessCategory,
          body: {"business_id": businessId, "category_id": categoryId},
          header: {"Authorization": "Bearer $accessToken"});
      if (apiResponse.statusCode == 200) {
        // LoadingWidget.endLoadingWidget(context);
        return true;
      } else {
        // LoadingWidget.endLoadingWidget(context);
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
      //  LoadingWidget.endLoadingWidget(context);
      PopupDialogs.displayMessage(context, "Server error");
      return null;
    }
  }

  static Future<bool> updateShopDetailsApiCall(
      BuildContext context,
      int categoryProfileId,
      File thumnail,
      String address,
      String city,
      double latitude,
      double longitude,
      List<File> mainPhotoListPic,
      int discount,
      String activateName,
      String shopName,
      String specialOf) async {
    String accessToken = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Access_Token);
    List uploadImages = [];
    if (mainPhotoListPic != null) {
      for (var i = 0; i < mainPhotoListPic.length; i++) {
        uploadImages.add(await MultipartFile.fromFile(mainPhotoListPic[i].path,
            filename: "mainPhotoListPic$i.jpeg"));
      }
    }

    FormData formData = new FormData.fromMap({
      "category_profile_id": categoryProfileId,
      "thumbnail": thumnail != null
          ? await MultipartFile.fromFile(thumnail.path,
              filename: "thumnail.jpeg")
          : null,
      "address": address ?? null,
      "city": city ?? null,
      "latitude": latitude ?? null,
      "longitude": longitude ?? null,
      "discount": discount ?? null,
      "active_name": activateName ?? null,
      "shop_name": shopName ?? null,
      "specialty": specialOf ?? null,
      "slider_img": mainPhotoListPic != null ? uploadImages : null,
    });
    try {
      ApiResponse apiResponse = await restClientNew.post(
          context, Api.CategoryDetails,
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
}
