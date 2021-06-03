import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:me_talk/src/data/repository/category_list_repository.dart';
import 'package:me_talk/src/models/categoryListbeans.dart';
import './bloc.dart';

class TypeOfBusinessBloc
    extends HydratedBloc<TypeOfBusinessEvent, TypeOfBusinessState> {
  CategoryListData businessListCategory ;
  CategoryListApiRepository categoryListApiRepository = CategoryListApiRepository();
  @override
  TypeOfBusinessState get initialState =>
      TypeOfBusinessState(businessListCategory);

  @override
  Stream<TypeOfBusinessState> mapEventToState(
    TypeOfBusinessEvent event,
  ) async* {
    if (event is GetBusinessListData) {
      yield await getCategoryListData(event.context,event.type);
    }
  }

  Future<TypeOfBusinessState> getCategoryListData(BuildContext context,String categoryType) async {
    businessListCategory = await categoryListApiRepository.categoryListApiCall(context,categoryType);
    return  TypeOfBusinessState(businessListCategory);
  }

  @override
  TypeOfBusinessState fromJson(Map<String, dynamic> json) {
    businessListCategory = CategoryListResponses.fromJson(json).data;
    return TypeOfBusinessState(businessListCategory);
  }

  @override
  Map<String, dynamic> toJson(TypeOfBusinessState state) {
    return {'homedatapagedata': state.businessListCategory};
  }

  /*Future<TypeOfBusinessState> getBusinessListData(
      BuildContext context, String type) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/shop_business_list.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    List<dynamic> list = apiResponse.data;
    List<BusinessListData> sendFinalList = [];
    for (var i = 0; i < list.length; i++) {
      sendFinalList.add(BusinessListData.fromJson(apiResponse.data[i]));
    }
    print(sendFinalList);
    return TypeOfBusinessState(sendFinalList);
  }

  @override
  TypeOfBusinessState fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['businessListCategory'];
    businessListCategory = [];
    for (var i = 0; i < list.length; i++) {
      businessListCategory.add(BusinessListData.fromJson(json[i]));
    }
    return TypeOfBusinessState(businessListCategory);
  }

  @override
  Map<String, dynamic> toJson(TypeOfBusinessState state) {
    print(" In to json " + state.businessListCategory.toString());
    return {'businessListCategory': state.businessListCategory};
  }*/

}
