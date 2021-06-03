import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/network/api.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/network/rest_client_new.dart';
import 'package:me_talk/src/models/categoryListbeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';

class RequestFormRepository {
  CategoryListData categoryListData = CategoryListData();
  Dio dio = Dio();

  Future<CategoryListData> requestFormApiCall(
      BuildContext context,Map<String, dynamic> requestData
      ) async {
    try {

      LoadingWidget.startLoadingWidget(context);

      final String autoToken = await SharePreferencesHelper()
          .getAccessToken(SharePreferencesHelper.Access_Token);

      String name = requestData['name'];
      String formTypeId  = requestData['entity_type_id'];
      String categoryID  = requestData['category_id'].toString();
      String address  = requestData['address'];
      String recommendCode  = requestData['recommend_code'];
      String latitude  = requestData['latitude'].toString();
      String longitude  = requestData['longitude'].toString();
      String email  = requestData['email'];
      String city  = requestData['city_id'];
      String stateName  = requestData['state_id'];
      String country  = requestData['country_id'];
      File portfoliopic  = requestData['best_portfolio'];
      File licencepic  = requestData['business_licence'];
      File identificationPic  = requestData['identification_card'];


      Map<String, dynamic> map = Map<String, dynamic>();

      if(formTypeId=='2'){
        map = {
          "name": name,
          "entity_type_id": formTypeId,
          "category_id": categoryID,
          "address": address,
          "latitude": latitude,
          "longitude": longitude,
          "email": email,
          "city_id": city,
          "state_id": stateName,
          "country_id": country,
          "recommend_code": recommendCode,
          "business_licence": licencepic != null
              ? await MultipartFile.fromFile(licencepic.path,
              filename: "licencepic.jpeg")
              : null,
          "interior_photo": identificationPic != null
              ? await MultipartFile.fromFile(identificationPic.path,
              filename: "identificationPic.jpeg")
              : null,
        };
      }else{
        map = {
          "name": name,
          "entity_type_id": formTypeId,
          "category_id": categoryID,
          "address": address,
          "latitude": latitude,
          "longitude": longitude,
          "email": email,
          "city_id": city,
          "state_id": stateName,
          "country_id": country,
          "recommend_code": recommendCode,
          "best_portfolio": portfoliopic != null
              ? await MultipartFile.fromFile(portfoliopic.path,
              filename: "portfoliopic.jpeg")
              : null,
          "business_licence": licencepic != null
              ? await MultipartFile.fromFile(licencepic.path,
              filename: "licencepic.jpeg")
              : null,
          "identification_card": identificationPic != null
              ? await MultipartFile.fromFile(identificationPic.path,
              filename: "identificationPic.jpeg")
              : null,
        };
      }

      FormData formData = new FormData.fromMap(map);

      ApiResponse apiResponse = await restClientNew.post(context, Api.BusinessRequest,
          body: formData,
          header: {"Authorization": "Bearer $autoToken"}
      );
      if (apiResponse.statusCode == 200) {
        categoryListData = CategoryListData.fromJson(apiResponse.data);
        LoadingWidget.endLoadingWidget(context);
        int count = 0;
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return categoryListData;
      } else {
        LoadingWidget.endLoadingWidget(context);
        int count = 0;
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
        PopupDialogs.displayMessageOnly(context, apiResponse.message);
        return null;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context);
      return null;
    }
  }
}
