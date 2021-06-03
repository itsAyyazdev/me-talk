import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/repository/post_info_repository.dart';
import 'package:me_talk/src/models/postinfobeans.dart';
import './bloc.dart';

class PostInfoBloc extends Bloc<PostInfoEvent, PostInfoState> {
  @override
  PostInfoState get initialState => InitialPostInfoState();

  Future<PostInfoBeansData> getPostInfo(
      BuildContext context, int postId) async {
    PostInfoBeansData postInfoBeansData;
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/post_detail.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    postInfoBeansData = PostInfoBeansData.fromJson(apiResponse.data);
    // await PostInfoRepository.postInfoApiCall(context, postId).then((onValue) {
    //   if (onValue != null) {
    //     postInfoBeansData = onValue;
    //   } else {
    //     postInfoBeansData = null;
    //   }
    // });
    return postInfoBeansData;
  }

  Future<bool> getDeletePostInfo(BuildContext context, int postId) async {
    bool result;
    await PostInfoRepository.postInfoDeleteApiCall(context, postId)
        .then((onValue) {
      result = onValue;
    });
    return result;
  }

  @override
  Stream<PostInfoState> mapEventToState(
    PostInfoEvent event,
  ) async* {}
}
