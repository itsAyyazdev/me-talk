import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:me_talk/src/data/repository/homepage_repository.dart';
import 'package:me_talk/src/models/HomePageDatabeans.dart';
import './bloc.dart';

class HomepageBloc extends HydratedBloc<HomepageEvent, HomepageState> {
  HomePageData homePageData;
  HomePageRepository homePageRepository = HomePageRepository();
  @override
  HomepageState get initialState =>
      super.initialState ?? HomepageState(homePageData);

  @override
  Stream<HomepageState> mapEventToState(
    HomepageEvent event,
  ) async* {
    if (event is GetHomePageData) {
      yield await getHomePageData(event.context);
    }
  }

  Future<HomepageState> getHomePageData(BuildContext context) async {
     homePageData = await homePageRepository.homepageApiCall(context);
    return  HomepageState(homePageData);
  }

  @override
  HomepageState fromJson(Map<String, dynamic> json) { 
    homePageData = HomePageData.fromJson(json['homepagedata']);
    return HomepageState(homePageData);
  }

  @override
  Map<String, dynamic> toJson(HomepageState state) {
    return {'homepagedata': state.homePageData};
  }
}
