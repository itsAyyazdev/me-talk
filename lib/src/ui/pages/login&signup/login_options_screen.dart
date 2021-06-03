// import 'dart:io';
// import 'package:device_info/device_info.dart';
// import 'package:flutter/material.dart';
// import 'package:me_talk/src/blocs/bloc_login_option/bloc.dart';
// import 'package:me_talk/src/res/colors.dart';
// import 'package:me_talk/src/res/fonts.dart';
// import 'package:me_talk/src/res/image_assets.dart';
// import 'package:me_talk/src/res/strings.dart';
// import 'package:flutter/services.dart';

// import 'email_login.dart';

// class LoginOptionsScreen extends StatefulWidget {
//   @override
//   _LoginOptionsScreenState createState() => _LoginOptionsScreenState();
// }

// class _LoginOptionsScreenState extends State<LoginOptionsScreen> {
//   List<String> logosLogin;
//   int socialID, socialTypeId, deviceType, countryID, cityId;
//   String email, name, avtar, deviceId, deviceToken;
//   bool isIOS;
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   TextEditingController emailController;
//   final formKey = GlobalKey<FormState>();
//   bool autoValidation;
//   final focus = FocusNode();
//   LoginOptionBloc loginOptionBloc;
//   @override
//   void initState() {
//     super.initState();
//     deviceToken = '';
//     logosLogin = [
//       ImageAssets.email,
//       ImageAssets.facebook,
//       ImageAssets.kakao,
//       ImageAssets.naver
//     ];
//     emailController = TextEditingController();
//     autoValidation = false;
//     loginOptionBloc = LoginOptionBloc(context);
//     initPlatformState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: ListView(
//         shrinkWrap: true,
//         children: <Widget>[
// //Logins buttons
//           Padding(
//             padding: const EdgeInsets.only(top: 30),
//             child: ListView.builder(
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               itemBuilder: getLoginItemView,
//               itemCount: logosLogin.length,
//             ),
//           ),
// //Skip button
//           Padding(
//             padding: const EdgeInsets.only(left: 100, right: 100),
//             child: RaisedButton(
//               onPressed: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (context) => HomeScreen()));
//               },
//               color: ColorsHelper.themeBlackColor(),
//               child: Text(
//                 StringHelper.str_skip,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget getLoginItemView(BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
//       child: Card(
//         child: InkWell(
//           onTap: () {
//             onItemClick(index);
//           },
//           child: Image.asset(
//             logosLogin[index],
//             width: MediaQuery.of(context).size.width - 90,
//             height: 40,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> initPlatformState() async {
//     IosDeviceInfo iosInfo;
//     AndroidDeviceInfo androidInfo;
//     try {
//       if (Platform.isAndroid) {
//         androidInfo = await deviceInfoPlugin.androidInfo;
//         deviceId = androidInfo.androidId;
//         isIOS = false;
//       } else if (Platform.isIOS) {
//         iosInfo = await deviceInfoPlugin.iosInfo;
//         deviceId = iosInfo.identifierForVendor;
//         isIOS = true;
//       }
//     } on PlatformException {}
//     print('deviceId $deviceId');
//   }

//   // displayEmailDialog() {
//   //   showDialog<void>(
//   //       barrierDismissible: true,
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //           backgroundColor: Colors.white,
//   //           content: ListView(
//   //             shrinkWrap: true,
//   //             children: <Widget>[
//   //               Text(
//   //                 StringHelper.enter_email_social_login,
//   //                 textAlign: TextAlign.center,
//   //                 style: TextStyle(
//   //                     color: ColorsHelper.themeBlackColor(),
//   //                     fontSize: 14.0,
//   //                     fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
//   //               ),
//   //               Form(
//   //                 key: formKey,
//   //                 autovalidate: autoValidation,
//   //                 child: Padding(
//   //                   padding: const EdgeInsets.only(
//   //                       top: 5, left: 15, right: 15, bottom: 10),
//   //                   child: WidgetHelper.commonTextFormField(
//   //                       hint: StringHelper.hint_email,
//   //                       focusNode: focus,
//   //                       imageAssets: ImageAssets.email_icon,
//   //                       validation: CommonValidator.emailValidation,
//   //                       controller: emailController,
//   //                       textCapitalization: TextCapitalization.none,
//   //                       textInputType: TextInputType.emailAddress,
//   //                       save: (String value) {
//   //                         return email = value;
//   //                       }),
//   //                 ),
//   //               ),
//   //               Padding(
//   //                 padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
//   //                 child: Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                   children: <Widget>[
//   //                     InkWell(
//   //                       onTap: () {
//   //                         Navigator.of(context).pop();
//   //                       },
//   //                       child: Text(
//   //                         StringHelper.str_cancel_caps,
//   //                         textAlign: TextAlign.left,
//   //                         style: TextStyle(
//   //                             color: ColorsHelper.themeBlackColor(),
//   //                             fontSize: 14.0,
//   //                             fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
//   //                       ),
//   //                     ),
//   //                     InkWell(
//   //                       onTap: () {
//   //                         onSubmitClick();
//   //                       },
//   //                       child: Text(
//   //                         StringHelper.submit_caps,
//   //                         textAlign: TextAlign.left,
//   //                         style: TextStyle(
//   //                             color: ColorsHelper.themeBlackColor(),
//   //                             fontSize: 14.0,
//   //                             fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               )
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }

//   // void onSubmitClick() {
//   //   if (formKey.currentState.validate()) {
//   //     formKey.currentState.save();
//   //     Navigator.of(context).pop();
//   //     socialLoginApiCall(context);
//   //   } else {
//   //     setState(() {
//   //       autoValidation = true;
//   //     });
//   //   }
//   // }

//   void onItemClick(int index) {
//     if (index == 0) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => EmailLogin()));
//     } else if (index == 1) {
//       loginOptionBloc.getFacebookData();
//       //getFacebookData();
//     } else if (index == 2) {
//       // loginOptionBloc.getKakaoData();
//     } else if (index == 3) {
//       //loginOptionBloc.getNaverData();
//     }
//   }

//   // void checkSocialUserApiCall(BuildContext context) async {
//   //   CommonResponse _response = await DataManagerInheritedWidget.of(context)
//   //       .apiRepos
//   //       .checkSocialUserRequest(
//   //         context,
//   //         socialTypeId,
//   //         socialID,
//   //       );
//   //   if (_response.statusCode == 200) {
//   //     final Map<String, dynamic> profileData = _response.data;
//   //     email = profileData['email'];
//   //     socialLoginApiCall(context);
//   //   } else {
//   //     displayEmailDialog();
//   //   }
//   // }

//   // void socialLoginApiCall(BuildContext context) async {
//   //   deviceType = isIOS ? DeviceTypeID.IOS.index : DeviceTypeID.ANDROID.index;

//   //   LoginResponse _response = await DataManagerInheritedWidget.of(context)
//   //       .apiRepos
//   //       .socialLoginRequest(context, socialTypeId, socialID, email, name, avtar,
//   //           deviceId, deviceType, deviceToken, countryID, cityId);

//   //   if (_response.statusCode == 200) {
//   //     await SharePreferencesHelper.getInstant().setAccessToken(
//   //         SharePreferencesHelper.ACCESS_TOKEN, _response.data.token);

//   //     print(await SharePreferencesHelper()
//   //         .getAccessToken(SharePreferencesHelper.ACCESS_TOKEN));

//   //     await SharePreferencesHelper.getInstant()
//   //         .setBool(SharePreferencesHelper.IS_LOGIN, true);

//   //     await SharePreferencesHelper().setString(
//   //         SharePreferencesHelper.USER_DATA, jsonEncode(_response.data));
//   //     print(await SharePreferencesHelper()
//   //         .getString(SharePreferencesHelper.USER_DATA));

//   //     Navigator.pushReplacement(
//   //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
//   //   } else {
//   //     Utility.showAlertDialogCallBack(
//   //         context: context, message: _response.message);
//   //   }
//   // }
// }
