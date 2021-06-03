import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/repository/profile_repository.dart';
import 'package:me_talk/src/models/businessDetailbeans.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/models/profileupdatebeans.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  File selectedFilePath;
  int socialLoginType;
  var imageSource;
  ProfileRepository profileRepository = ProfileRepository();
  ProfileUpdateData profileUpdateData;
  LoginData loginData;
  BusinessDetailData businessDetailData;

  bool isLogin;
  FirebaseAuth _auth = FirebaseAuth.instance;

  BehaviorSubject<bool> isProfileUpdated = BehaviorSubject<bool>();
  Observable<bool> get isProfileUpdatedHere {
    return isProfileUpdated.stream;
  }

  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is SetProfilePic) {
      //  _imagePicker(event.context);
    }
  }

  void dispose() {
    isProfileUpdated.close();
  }

  void imagePicker(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (builder) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Wrap(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      StringHelper.str_choose_from,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          //fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.camera,
                      color: Colors.black,
                    ),
                    title: Text(
                      StringHelper.str_camera,
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _onCameraClick(context);
                    }),
                ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                    title: Text(
                      StringHelper.str_gallery,
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _onGalleryClick(context);
                    }),
              ],
            ),
          );
        });
  }

  Future _onCameraClick(BuildContext context) async {
    selectedFilePath = null;
    imageSource = ImageSource.camera;
    Navigator.pop(context);
    try {
      var filePath = await ImagePicker.pickImage(source: imageSource);
      print("You selected camera image : " + filePath.path);
      // Navigator.pop(context);
      selectedFilePath = filePath;
      if (selectedFilePath != null) {
        isProfileUpdated.sink.add(true);
//        profileRepository
//            .profileUpdateApiCall(
//                context, selectedFilePath, null, null, null, null)
//            .then((onValue) {
//          if (onValue != null) {
//            profileUpdateData = onValue;
//            SharePreferencesHelper.getInstant().setString(
//                SharePreferencesHelper.Avatar, profileUpdateData.avatar);
//            isProfileUpdated.sink.add(true);
//          }
//        });
      }
    } on Exception {}
  }

  Future _onGalleryClick(BuildContext context) async {
    selectedFilePath = null;
    imageSource = ImageSource.gallery;
    Navigator.pop(context);
    try {
      var filePath = await ImagePicker.pickImage(source: imageSource);
      print("You selected gallery image : " + filePath.path);
      selectedFilePath = filePath;
      if (selectedFilePath != null) {
        isProfileUpdated.sink.add(true);
        // profileRepository
        //     .profileUpdateApiCall(
        //         context, selectedFilePath, null, null, null, null)
        //     .then((onValue) {
        //   if (onValue != null) {
        //     profileUpdateData = onValue;
        //     SharePreferencesHelper.getInstant().setString(
        //         SharePreferencesHelper.Avatar, profileUpdateData.avatar);
        //     isProfileUpdated.sink.add(true);
        //   }
        // });
      }
    } on Exception {}
  }

  void updateProfile(
    BuildContext context,
    String name,
    File avatar,
    String gender,
    int phoneNo,
    String mail,
  ) {
    profileRepository
        .updateProfileApiCall(context, name, avatar, gender, phoneNo, mail)
        .then((onValue) {
      if (onValue != null) {
        loginData = onValue;
        //Navigator.of(context).pop();
      }
    });
  }

  void updateName(BuildContext context, String name) {
    profileRepository
        .profileUpdateApiCall(context, null, name, null, null, null)
        .then((onValue) {
      if (onValue != null) {
        profileUpdateData = onValue;
        SharePreferencesHelper.getInstant().setString(
            SharePreferencesHelper.User_Name, profileUpdateData.name);
        isProfileUpdated.sink.add(true);
        Navigator.of(context).pop();
      }
    });
  }

  void updateGender(BuildContext context, int number) {
    profileRepository
        .profileUpdateApiCall(context, null, null, null, number, null)
        .then((onValue) {
      if (onValue != null) {
        profileUpdateData = onValue;
        SharePreferencesHelper.getInstant()
            .setInt(SharePreferencesHelper.Gender, profileUpdateData.gender);
        isProfileUpdated.sink.add(true);
      }
    });
  }

  void updatelanguage(BuildContext context, int number) {
    profileRepository
        .profileUpdateApiCall(context, null, null, null, null, number)
        .then((onValue) {
      if (onValue != null) {
        profileUpdateData = onValue;
        SharePreferencesHelper.getInstant().setInt(
            SharePreferencesHelper.Language, profileUpdateData.language);
        isProfileUpdated.sink.add(true);
      }
    });
  }

  Future checkBusinessInfo(BuildContext context) async {
    //LoadingWidget.startLoadingWidget(context);
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/check_business_request.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    businessDetailData = BusinessDetailData.fromJson(apiResponse.data);
    AppNavigator.launchBusinessProfile(context, businessDetailData);
    // await profileRepository
    //     .checkBusinessApiCall(context)
    //     .then((ApiResponse onValue) {
    //   //Request statue code - 0 - no request , 1 - already request exist, 2 - confirm request data send, 3- request rejected
    //   switch (onValue.requestStatus) {
    //     case 0:
    //       BusinessRequestPopup.openPopup(context);
    //       break;
    //     case 1:
    //       BusinessRequestPopup.requestPending(context, onValue.message);

    //       break;
    //     case 2:
    //       businessDetailData = BusinessDetailData.fromJson(onValue.data);
    //       AppNavigator.launchBusinessProfile(context, businessDetailData);
    //       break;
    //     case 3:
    //       BusinessRequestPopup.requestRejected(context, onValue.message);
    //       break;
    //     default:
    //       LoadingWidget.endLoadingWidget(context);
    //   }
    // });
  }

  Future logoutAction(BuildContext context) async {
    isLogin = await SharePreferencesHelper.getInstant()
        .getBool(SharePreferencesHelper.Is_Login);
    if (isLogin) {
//      _auth.currentUser().then((user) {
//        if (user != null) {
//          _auth.signOut();
//        }
//      });
      SharePreferencesHelper.getInstant()
          .setBool(SharePreferencesHelper.Is_Login, false);
      profileRepository.logoutApiCall(context).then((onValue) {
        if (onValue) {
          SharePreferencesHelper.getInstant().clearPreference();
          AppNavigator.launchLoginPage(context);
        } else {}
      });
    } else {
//      _auth.currentUser().then((user) {
//        if (user != null) {
//          _auth.signOut();
//        }
//      });
      SharePreferencesHelper.getInstant()
          .setBool(SharePreferencesHelper.Is_Login, false);
      SharePreferencesHelper.getInstant().clearPreference();
      AppNavigator.launchLoginPage(context);
    }
  }
}
