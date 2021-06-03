import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/repository/profile_repository.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/models/businessDetailbeans.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import './bloc.dart';

class BusinessProfileBloc
    extends Bloc<BusinessProfileEvent, BusinessProfileState> {
  @override
  BusinessProfileState get initialState => InitialBusinessProfileState();

  getShopCategoryDetails(BuildContext context, int categoryProfileId) async {
    //LoadingWidget.startLoadingWidget(context);
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/business_category.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    ShopDetailsBeansData shopDetailsBeansData =
        ShopDetailsBeansData.fromJson(apiResponse.data);
        AppNavigator.launchShopProfile(context, shopDetailsBeansData);
    // await ShopDetailsRepository.shopDetailsApiCall(context, categoryProfileId)
    //     .then((onValue) {
    //   if (onValue != null) {
    //     AppNavigator.launchShopProfile(context, onValue);
    //   } else {}
    // });
  }

  Future addBusinessCategory(
      BuildContext context, int businessId, int categoryId) async {
    // LoadingWidget.startLoadingWidget(context);
    // await AddBusinessCategoryRepository.addBusinessCategoryApiCall(
    //         context, businessId, categoryId)
    //     .then((onValue) {
    //   if (onValue) {
    //     PopupDialogs.displayMessage(
    //         context, "Category added please reopen page");
    //     Navigator.of(context).pop();
    //     // checkBusinessInfo(context);
    //   } else {
    //     PopupDialogs.displayMessage(context, "Category not  added ");
    //   }
    // });
  }

  ProfileRepository profileRepository = ProfileRepository();
  BusinessDetailData businessDetailData;

  // Future checkBusinessInfo(BuildContext context) async {
  //   LoadingWidget.startLoadingWidget(context);
  //   await profileRepository
  //       .checkBusinessApiCall(context)
  //       .then((ApiResponse onValue) {
  //     //Request statue code - 0 - no request , 1 - already request exist, 2 - confirm request data send, 3- request rejected
  //     switch (onValue.requestStatus) {
  //       case 0:
  //         BusinessRequestPopup.openPopup(context);
  //         break;
  //       case 1:
  //         BusinessRequestPopup.requestPending(context, onValue.message);

  //         break;
  //       case 2:
  //         businessDetailData = BusinessDetailData.fromJson(onValue.data);
  //         Navigator.pushNamedAndRemoveUntil(context, BusinessProfile.routeName,
  //             ModalRoute.withName(BusinessProfile.routeName),
  //             arguments: businessDetailData);
  //         // AppNavigator.launchBusinessProfile(context, businessDetailData);
  //         break;
  //       case 3:
  //         BusinessRequestPopup.requestRejected(context, onValue.message);
  //         break;
  //       default:
  //         LoadingWidget.endLoadingWidget(context);
  //     }
  //   });
  // }

  @override
  Stream<BusinessProfileState> mapEventToState(
    BusinessProfileEvent event,
  ) async* {}
}
