import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/repository/shop_details_repository.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import './bloc.dart';

class ViewShopProfileBloc
    extends Bloc<ViewShopProfileEvent, ViewShopProfileState> {
  bool result;
  @override
  ViewShopProfileState get initialState => InitialViewShopProfileState();

  Future<ShopDetailsBeansData> getShopCategoryDetails(
      BuildContext context, int categoryProfileId) async {
    ShopDetailsBeansData shopDetailsBeansData;
    LoadingWidget.startLoadingWidget(context);
    await ShopDetailsRepository.shopDetailsApiCall(context, categoryProfileId)
        .then((onValue) {
      if (onValue != null) {
        shopDetailsBeansData = onValue;
      } else {
        shopDetailsBeansData = null;
      }
    });
    return shopDetailsBeansData;
  }

  Future<bool> followBusiness(
      BuildContext context, int categoryProfileId) async {
    await ShopDetailsRepository.followBusinessApiCall(
            context, categoryProfileId)
        .then((onValue) {
      result = onValue;
    });
    return result;
  }

  Future<bool> unFollowBusiness(
      BuildContext context, int categoryProfileId) async {
    await ShopDetailsRepository.unFollowBusinessApiCall(
            context, categoryProfileId)
        .then((onValue) {
      result = onValue;
    });
    return result;
  }

  @override
  Stream<ViewShopProfileState> mapEventToState(
    ViewShopProfileEvent event,
  ) async* {}
}
