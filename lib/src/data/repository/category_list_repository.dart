import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/categoryListbeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class CategoryListApiRepository {
  CategoryListData categoryListData = CategoryListData();
  Dio dio = Dio();

  Future<CategoryListData> categoryListApiCall(
      BuildContext context,String categoryId
      ) async {
    try {
      LoadingWidget.startLoadingWidget(context);
      final String autoToken = await SharePreferencesHelper()
          .getAccessToken(SharePreferencesHelper.Access_Token);
      ApiResponse apiResponse = await restClientNew.post(context, Api.CategoryList,
          body: {"category_type_id": categoryId,},
          header: {"Authorization": "Bearer $autoToken"}
      );
      if (apiResponse.statusCode == 200) {
        categoryListData = CategoryListData.fromJson(apiResponse.data);
        LoadingWidget.endLoadingWidget(context);
        return categoryListData;
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
