import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/models/beautydatabeans.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import './bloc.dart';

class BeautyPageBloc extends HydratedBloc<BeautyPageEvent, BeautyPageState> {
  int categoryProfileId;
  BeautyData beautyData;
  @override
  BeautyPageState get initialState =>
      super.initialState ?? BeautyPageState(beautyData);

  getShopCategoryDetails(BuildContext context) async {
    // LoadingWidget.startLoadingWidget(context);
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/business_category.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    ShopDetailsBeansData shopDetailsBeansData =
        ShopDetailsBeansData.fromJson(apiResponse.data);
    AppNavigator.launchViewShopProfile(context, shopDetailsBeansData);
    // await ShopDetailsRepository.shopDetailsApiCall(context, categoryProfileId)
    //     .then((onValue) {
    //   if (onValue != null) {
    //     AppNavigator.launchViewShopProfile(context, onValue);
    //   } else {}
    // });
  }

  @override
  Stream<BeautyPageState> mapEventToState(
    BeautyPageEvent event,
  ) async* {
    if (event is GetBeautyPageData) {
      yield await getBeautyPageData(event.context);
    }
  }

  Future<BeautyPageState> getBeautyPageData(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/beauty_page.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    beautyData = BeautyData.fromJson(apiResponse.data);
    // await BeautyPageRepository.beautypageApiCall(context);
    return BeautyPageState(beautyData);
  }

  @override
  BeautyPageState fromJson(Map<String, dynamic> json) {
    beautyData = BeautyData.fromJson(json['beautypagedata']);
    return BeautyPageState(beautyData);
  }

  @override
  Map<String, dynamic> toJson(BeautyPageState state) {
    return {'beautypagedata': state.beautyData};
  }
}
