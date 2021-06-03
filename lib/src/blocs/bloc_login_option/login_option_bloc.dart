import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_kakao_login/flutter_kakao_login.dart';
//import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:me_talk/src/data/repository/soicallogin_repository.dart';
import './bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:dio/dio.dart';

class LoginOptionBloc extends Bloc<LoginOptionEvent, LoginOptionState> {
  final BuildContext context;
  SoicalLoginRepository soicalLoginRepository = SoicalLoginRepository();
  List<String> logosLogin;
  int socialID, socialTypeId, deviceType, countryID, cityId;
  String email, name, avtar, deviceId, deviceToken;
  bool isIOS;
  var dio = Dio();

  LoginOptionBloc(this.context);
  void getFacebookData() async {
    final facebookLogin = FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    final result = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        soicalLoginRepository.callFacebook(token, context);
        break;
      case FacebookLoginStatus.cancelledByUser:
        //_showCancelledMessage();
        break;
      case FacebookLoginStatus.error:
        //_showErrorOnUI(result.errorMessage);
        break;
    }
  }

  // void getKakaoData() async {
  //   FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
  //   final KakaoLoginResult result = await kakaoSignIn.logIn();
  //   switch (result.status) {
  //     case KakaoLoginStatus.loggedIn:
  //       final KakaoLoginResult rslt = await kakaoSignIn.getUserMe();
  //       if (rslt != null && rslt.status != KakaoLoginStatus.error) {
  //         final KakaoAccountResult account = rslt.account;
  //         socialTypeId = SocialLoginTypeId.KAKAO.index;
  //         socialID = int.parse(account.userID);
  //         name = account.userNickname;
  //         if (account.userProfileImagePath != null) {
  //           avtar = account.userProfileImagePath;
  //         }
  //         if (account.userEmail != null && account.userEmail != '') {
  //           email = account.userEmail;
  //           soicalLoginRepository.socialLoginApiCall(
  //               context,
  //               socialTypeId,
  //               socialID,
  //               email,
  //               name,
  //               avtar,
  //               deviceType,
  //               deviceToken,
  //               countryID,
  //               cityId);
  //         } else {
  //           // checkSocialUserApiCall(context);
  //         }
  //       }
  //       break;
  //     case KakaoLoginStatus.loggedOut:
  //       //_updateMessage('LoggedOut by the user.');
  //       break;
  //     case KakaoLoginStatus.error:
  //       // Utility.showToast(context, result.errorMessage);
  //       break;
  //   }
  // }

  // void getNaverData() async {
  //   final NaverLoginResult result = await FlutterNaverLogin.logIn();
  //   socialTypeId = SocialLoginTypeId.NAVER.index;
  //   socialID = int.parse(result.account.id);
  //   name = result.account.name;
  //   if (result.account.profileImage != null) {
  //     avtar = result.account.profileImage;
  //   }
  //   if (result.account.email != null) {
  //     email = result.account.email;
  //     soicalLoginRepository.socialLoginApiCall(context, socialTypeId, socialID,
  //         email, name, avtar, deviceType, deviceToken, countryID, cityId);
  //   } else {
  //     // displayEmailDialog();
  //     // FocusScope.of(context).requestFocus(focus);
  //   }
  //   //NaverAccessToken res = await FlutterNaverLogin.currentAccessToken;
  //   //print(res.accessToken);
  // }

  //   void socialLoginApiCall(BuildContext context) async {
  //   deviceType = isIOS ? DeviceTypeID.IOS.index : DeviceTypeID.ANDROID.index;

  //   LoginResponse _response = await DataManagerInheritedWidget.of(context)
  //       .apiRepos
  //       .socialLoginRequest(context, socialTypeId, socialID, email, name, avtar,
  //           deviceId, deviceType, deviceToken, countryID, cityId);

  //   if (_response.statusCode == 200) {
  //     await SharePreferencesHelper.getInstant().setAccessToken(
  //         SharePreferencesHelper.ACCESS_TOKEN, _response.data.token);

  //     print(await SharePreferencesHelper()
  //         .getAccessToken(SharePreferencesHelper.ACCESS_TOKEN));

  //     await SharePreferencesHelper.getInstant()
  //         .setBool(SharePreferencesHelper.IS_LOGIN, true);

  //     await SharePreferencesHelper().setString(
  //         SharePreferencesHelper.USER_DATA, jsonEncode(_response.data));
  //     print(await SharePreferencesHelper()
  //         .getString(SharePreferencesHelper.USER_DATA));

  //     // Navigator.pushReplacement(
  //     //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else {
  //     // Utility.showAlertDialogCallBack(
  //     //     context: context, message: _response.message);
  //   }
  // }

  @override
  LoginOptionState get initialState => InitialLoginOptionState();

  @override
  Stream<LoginOptionState> mapEventToState(
    LoginOptionEvent event,
  ) async* {}
}
