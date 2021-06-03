import 'dart:async';
import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:me_talk/src/data/repository/profile_repository.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'api.dart';
import 'api_response.dart';

class RestClientNew {
  Dio _dio;
  ProfileRepository profileRepository;

  RestClientNew() {
    BaseOptions options = new BaseOptions(
      baseUrl: Api.BASE_URL,
    );
    _dio = Dio(options);
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<ApiResponse> get(BuildContext context, apiName,
      {body, Map<String, dynamic> header, Options option}) async {
    Map<String, dynamic> headers = HashMap();

//    final String autoToken = await SharePreferencesHelper()
//        .getAccessToken(SharePreferencesHelper.Access_Token);
//    headers['Authorization'] = 'Bearer $autoToken';

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);

      if (response.statusCode < 200 || response.statusCode > 400) {
        return ApiResponse(false, 'Server error please try again later!', null,
            null, null, null);
      }

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      return ApiResponse(false, 'Server error please try again later!', null,
          null, null, null);
    }
  }

  Future<ApiResponse> post(
    BuildContext context,
    apiName, {
    body,
    Map<String, dynamic> header,
    Options option,
  }) async {
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "post");
      option.headers = headers;
    }
    Response response;
    try {
      response = await _dio.request(
        apiName,
        data: body,
        options: option,
        onSendProgress: (int sent, int total) {
          print("Sent  = " +
              sent.toString() +
              " Left = " +
              (total - sent).toString());
        },
      );
      return ApiResponse.fromJson(response.data);
    } catch (e) {
      var error = e as DioError;
      if (error.response.statusCode == 401) {
        // doLogout(context);
        return ApiResponse(false, StringHelper.session_expired_please, null,null, error.response.statusCode, null);
      } else if (error.response.statusCode == 535) {
        return ApiResponse.fromJson(error.response.data);
      } else if (error.response.statusCode == 403) {
        return ApiResponse.fromJson(error.response.data);
      } else if (error.response.statusCode == 422) {
        return ApiResponse.fromJson(error.response.data);
      } else if (error.response.statusCode == 400) {
        return ApiResponse.fromJson(error.response.data);
      }else{
        return ApiResponse(false, 'Server error please try again later!', null,
            null, null, null);
      }
    }
  }

  Future<ApiResponse> put(BuildContext context, apiName,
      {body, Map<String, dynamic> header, Options option}) async {
    Map<String, dynamic> headers = HashMap();

//    final String autoToken = await SharePreferencesHelper()
//        .getAccessToken(SharePreferencesHelper.Access_Token);
//    headers['Authorization'] = 'Bearer $autoToken';

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "put");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);

      if (response.statusCode < 200 || response.statusCode > 400) {
        return ApiResponse(false, 'Server error please try again later!', null,
            null, null, null);
      }

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      var error = e as DioError;
      if (error.response.statusCode == 401) {
        // doLogout(context);
        //   AppNavigator.launchAuthFailedPage(context);
      }
      return ApiResponse(false, 'Server error please try again later!', null,
          null, null, null);
    }
  }

  void doLogout(BuildContext context) async {
    SharePreferencesHelper.getInstant()
        .setBool(SharePreferencesHelper.Is_Login, false);
    SharePreferencesHelper.getInstant().clearPreference();
    AppNavigator.launchLoginPage(context);
  }
}

final RestClientNew restClientNew = RestClientNew();
