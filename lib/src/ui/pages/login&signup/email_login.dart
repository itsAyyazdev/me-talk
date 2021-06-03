import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_email_login/bloc_email_login.dart';
import 'package:me_talk/src/blocs/bloc_email_login/email_page_state.dart';
import 'package:me_talk/src/res/colors.dart';

import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';

import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class EmailLogin extends StatefulWidget {
  static const String routeName = "EmailLogin";
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  EmailLoginBloc emailLoginBloc;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController, passwordController;

  FocusNode fnodeEmail = FocusNode();
  FocusNode fnodePassword = FocusNode();
  String email, password;
  bool isSaveID, isSavePw;

  @override
  void initState() {
    super.initState();

    isSaveID = false;
    isSavePw = false;

    getSavedData();

    emailLoginBloc = EmailLoginBloc();
    emailController = TextEditingController(text: email ?? '');
    passwordController = TextEditingController(text: password ?? '');

    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });

    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    emailLoginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorsHelper.whiteColor(),
                elevation: 0,
                leading: IconButton(
                  icon: Image.asset(
                    ImageAssets.back_arrow,
                    width: 19.0,
                    height: 19.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    Navigator.of(context).pop();
                  },
                ),
                centerTitle: true,
                title: Container(
                  //  margin: const EdgeInsets.only(top: 45, bottom: 15),
                  width: MediaQuery.of(context).size.height *
                      (Platform.isIOS ? 0.15 : 0.12),
                  height: MediaQuery.of(context).size.height *
                      (Platform.isIOS ? 0.11 : 0.10),
                  child: FlareActor(
                    'assets/logo_chactor.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    animation: "Logo",
                    //controller: controls,
                  ),
                ),
              ),
              backgroundColor: ColorsHelper.whiteColor(),
              body: BlocProvider(
                create: (BuildContext context) => emailLoginBloc,
                child: BlocBuilder(
                  bloc: emailLoginBloc,
                  builder: (BuildContext context, EmailPageState state) {
                    return Container(
                        color: ColorsHelper.whiteColor(),
                        child: emailLoginBody());
                  },
                ),
              ),
            )));
  }

  Widget emailLoginBody() {
    return Column(
      children: <Widget>[
//App logo
//        Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          //crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[//
//            IconButton(
//              icon: Image.asset(
//                ImageAssets.back_arrow,
//                width: 20.0,
//                height: 20.0,
//                fit: BoxFit.contain,
//              ),
//              onPressed: () {
//                Vibrate.feedback(FeedbackType.light);
//                Navigator.of(context).pop();
//              },
//            ),
//            Row(
//              children: <Widget>[
//                Container(
//                  margin: const EdgeInsets.only(top: 45, bottom: 15),
//                  width: MediaQuery.of(context).size.height * 0.1,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: FlareActor(
//                    'assets/logo_chactor.flr',
//                    alignment: Alignment.center,
//                    fit: BoxFit.cover,
//                    animation: "Logo",
//                    //controller: controls,
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//App bar
//        Card(
//          elevation: 0.0,
//          shape: null,
//          margin: EdgeInsets.all(0),
//          child: Stack(
//            children: <Widget>[
//              Container(
//                color: Colors.transparent,
//                alignment: Alignment.center,
//                height: 50,
//                width: double.infinity,
//              ),
//              IconButton(
//                icon: Image.asset(
//                  ImageAssets.back_arrow,
//                  width: 20.0,
//                  height: 20.0,
//                  fit: BoxFit.contain,
//                ),
//                onPressed: () {
//                  Vibrate.feedback(FeedbackType.light);
//                  Navigator.of(context).pop();
//                },
//              )
//            ],
//          ),
//        ),
//        SizedBox(
//          height: 25,
//        ),
//Body
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
//                Container(
//                    alignment: Alignment.center,
//                    width: double.infinity,
//                    child: Text(
//                      StringHelper.e_mail_login,
//                      style: TextStyle(
//                          color: ColorsHelper.themeBlackColor(),
//                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                          fontWeight: FontWeight.w700,
//                          fontSize: 25),
//                    )),
                SizedBox(
                  height: 55,
                ),
                formField(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget formField() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.162),
      child: Form(
        key: formKey,
        autovalidate: emailLoginBloc.autoValidation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Type Email
            commonTextFormField(
                hint: StringHelper.type_email,
                imageAssets: null,
                validation: CommonValidator.emailValidation,
                controller: emailController,
                textCapitalization: TextCapitalization.none,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: fnodeEmail,
                nextFocusNode: fnodePassword,
                save: (String value) {
                  return email = value;
                }),
            SizedBox(
              height: 45,
            ),
            //password
            commonTextFormField(
                hint: StringHelper.type_PW,
                validation: CommonValidator.passValidation,
                controller: passwordController,
                textCapitalization: TextCapitalization.none,
                textInputType: TextInputType.text,
                obscureText: true,
                focusNode: fnodePassword,
                nextFocusNode: null,
                textInputAction: TextInputAction.done,
                save: (String value) {
                  return password = value;
                }),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.5),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 72,
                    child: Text(
                      StringHelper.save_ID,
                      style: TextStyle(
                        fontSize: 15,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Vibrate.feedback(FeedbackType.light);
                      if (!isSaveID) {
                        if (email != null && email.isNotEmpty) {
                          isSaveID = true;
                          SharePreferencesHelper.getInstant().setString(
                              SharePreferencesHelper.Saved_Email, email);
                        }
                      } else {
                        isSaveID = false;
                        SharePreferencesHelper.getInstant().setString(
                            SharePreferencesHelper.Saved_Email, null);
                      }
                      setState(() {});
                    },
                    child: Image.asset(
                      isSaveID
                          ? ImageAssets.black_check
                          : ImageAssets.black_uncheck,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                      //width: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ),
                ],
              ),
            ),
//push notification check
            Padding(
              padding: const EdgeInsets.only(left: 10.5, top: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 72,
                    child: Text(
                      StringHelper.save_PW,
                      style: TextStyle(
                        fontSize: 15,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Vibrate.feedback(FeedbackType.light);
                      if (!isSavePw) {
                        if (password != null && password.isNotEmpty) {
                          isSavePw = true;
                          SharePreferencesHelper.getInstant().setString(
                              SharePreferencesHelper.Saved_PW, password);
                        }
                      } else {
                        isSavePw = false;
                        SharePreferencesHelper.getInstant()
                            .setString(SharePreferencesHelper.Saved_PW, null);
                      }
                      setState(() {});
                    },
                    child: Image.asset(
                      isSavePw
                          ? ImageAssets.black_check
                          : ImageAssets.black_uncheck,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                      //width: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //Login
            InkWell(
              onTap: () {
                Vibrate.feedback(FeedbackType.light);
                AppNavigator.launchDashboard(context);
//                SharePreferencesHelper.getInstant().setString(
//                    SharePreferencesHelper.User_Email, emailController.text);
//                SharePreferencesHelper.getInstant().setString(
//                    SharePreferencesHelper.Password, passwordController.text);
//
//                emailLoginBloc.onLoginClick(formKey, context).then((onValue) {
//                  if (onValue) {
//                    //AppNavigator.launchEmailLogin(context);
//                  } else {
//                    setState(() {});
//                  }
//                });
              },
              child: Container(
                height: 39,
                width: MediaQuery.of(context).size.width - 112,
                decoration: new BoxDecoration(
                  color: ColorsHelper.blackBgColor(),
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  border: Border.all(
                    width: 1,
                    color: ColorsHelper.greyTextColor(),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6.0, // has the effect of softening the shadow
                      //spreadRadius: 1.3, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        3, // vertical, move down 10
                      ),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    StringHelper.login,
                    style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 20,
                      //fontFamily: FontsHelper.fonts_medium
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Find ID
                  InkWell(
                    onTap: () {
                      Vibrate.feedback(FeedbackType.light);
                      AppNavigator.launchFindIDPage(context, true);
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          StringHelper.find_ID,
                          style: TextStyle(
                            color: ColorsHelper.greyTextColor(), fontSize: 15,
                            //fontFamily: FontsHelper.fonts_medium
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Divider(
                            color: ColorsHelper.greyTextColor(),
                            height: 0,
                            thickness: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //Find PW
                  InkWell(
                    onTap: () {
                      Vibrate.feedback(FeedbackType.light);
                      AppNavigator.launchFindIDPage(context, false);
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          StringHelper.find_PW,
                          style: TextStyle(
                            color: ColorsHelper.greyTextColor(), fontSize: 15,
                            //fontFamily: FontsHelper.fonts_medium
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.17,
                          child: Divider(
                            color: ColorsHelper.greyTextColor(),
                            height: 0,
                            thickness: 1,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget commonTextFormField(
      {String hint,
      String imageAssets,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      int maxLength = 100,
      obscureText = false,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction textInputAction,
      String save(String val)}) {
    return Container(
      height: 30,
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLines: maxLine,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        controller: controller,
        keyboardType: textInputType,
        validator: validation,
        cursorColor: ColorsHelper.themeBlackColor(),
        style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
        obscureText: obscureText,
        onSaved: save,
        focusNode: focusNode,
        onFieldSubmitted: (str) => nextFocusNode != null
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : null,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD9D9D9), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.themeBlackColor()),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: ColorsHelper.txtHintEditText(), fontSize: 15,
            //fontFamily: FontsHelper.fonts_medium
          ),
        ),
      ),
    );
  }

  void loginAPICall() async {
//    LoginResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .login(context,email,password);
//
//    if (_response.statusCode==200) {
//      await SharePreferencesHelper.getInstant().setAccessToken(
//          SharePreferencesHelper.ACCESS_TOKEN,_response.data.token);
//      await SharePreferencesHelper.getInstant().setBool(SharePreferencesHelper.IS_LOGIN, true);
//      await SharePreferencesHelper().setString(
//          SharePreferencesHelper.USER_DATA, jsonEncode(_response.data));
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
  }

  void getSavedData() async {
    String strEmail = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Saved_Email);
    String strPass = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Saved_PW);

    if (strEmail != null && strEmail.isNotEmpty) {
      email = strEmail;
      emailController.text = strEmail;
      isSaveID = true;
    }

    if (strPass != null && strPass.isNotEmpty) {
      password = strPass;
      passwordController.text = strPass;
      isSavePw = true;
    }

    setState(() {});
  }
}
