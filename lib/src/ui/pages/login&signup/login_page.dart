import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_login_page/bloc.dart';
import 'package:me_talk/src/blocs/bloc_main/main_bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/firebase_ops/fcm.dart';
import 'package:vibrate/vibrate.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "LoginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MainBloc mainBloc;
  LoginPageBloc loginPageBloc = LoginPageBloc();

  Future<bool> onBackPress() {
    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    mainBloc = BlocProvider.of<MainBloc>(context);
  }

  @override
  void dispose() {
    mainBloc.close();
    super.dispose();
    loginPageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    if (!Fcm.alreadyInited) Fcm.getInstance().chatNotification();
    return WillPopScope(
      child: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => loginPageBloc,
          child: BlocBuilder(
            bloc: loginPageBloc,
            builder: (BuildContext context, LoginPageState state) {
              return loginPageBody();
            },
          ),
        ),
      ),
      onWillPop: onBackPress,
    );
  }

  Widget loginPageBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ColorsHelper.whiteColor(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//App Logo
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.75,left: 29),
//              width: double.infinity,
//              height: MediaQuery.of(context).size.height * 0.30,
              width: 175,
              height: 120,
              child: FlareActor(
                'assets/logo_chactor1.flr',
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "Logo",
                //controller: controls,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
            ),
//Login Button,
            Padding(
              padding: const EdgeInsets.only(left:77.0,right: 77),
              child: InkWell(
                onTap: (){
                  Vibrate.feedback(FeedbackType.light);
                  AppNavigator.launchEmailLogin(context);
                },
                child: Container(
                  height: 64,
                  decoration: new BoxDecoration(
                    color:ColorsHelper.blackBgColor(),
                    borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
//                    border: Border.all(
//                      width: 0.5,
//                      color: ColorsHelper.themeBlackColor(),
//                    ),
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.black.withOpacity(0.27),
//                        blurRadius: 4.0, // has the effect of softening the shadow
//                        //spreadRadius: 1.3, // has the effect of extending the shadow
//                        offset: Offset(
//                          0, // horizontal, move right 10
//                          1, // vertical, move down 10
//                        ),
//                      )
//                    ],
                  ),
                  child: Center(
                    child: Text(
                      StringHelper.login,
                      style: TextStyle(
                        color: ColorsHelper.whiteColor(),
                        fontSize: 20,
//                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                    fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ),
            ),
//            ButtonColor(
//              color: ColorsHelper.blackBgColor(),
//              child: Text(
//                StringHelper.login,
//                style: TextStyle(
//                  color: ColorsHelper.whiteColor(),
//                  fontSize: 20,
////                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
////                    fontWeight: FontWeight.w700
//                ),
//              ),
//              height: 65,
//              width: 221,
//              onPressed: () {
//                Vibrate.feedback(FeedbackType.light);
//                AppNavigator.launchEmailLogin(context);
//              },
//            ),
            SizedBox(
              height: 10,
            ),
//Register Button,
            Padding(
              padding: const EdgeInsets.only(left:77.0,right: 77),
              child: InkWell(
                onTap: (){
                  Vibrate.feedback(FeedbackType.light);
                  AppNavigator.launchRecommendCodePage(context);
                },
                child: Container(
                  height: 64,
                  decoration: new BoxDecoration(
                    color:Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                    border: Border.all(
                      width: 1,
                      color: ColorsHelper.blackBgColor(),
                    ),
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.black.withOpacity(0.27),
//                        blurRadius: 4.0, // has the effect of softening the shadow
//                        //spreadRadius: 1.3, // has the effect of extending the shadow
//                        offset: Offset(
//                          0, // horizontal, move right 10
//                          1, // vertical, move down 10
//                        ),
//                      )
//                    ],
                  ),
                  child: Center(
                    child: Text(
                      StringHelper.register,
                      style: TextStyle(
                        color: ColorsHelper.blackBgColor(),
                        fontSize: 20,
//                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                    fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ),
            ),
//            ButtonBlackBroder(
//              broderWidth: .5,
//              child: Text(
//                StringHelper.register,
//                style: TextStyle(
//                  color: ColorsHelper.themeBlackColor(),
//                  fontSize: 20,
////                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
////                    fontWeight: FontWeight.w700
//                ),
//              ),
//              height: 65,
//              width: 221,
//              onPressed: () {
//                Vibrate.feedback(FeedbackType.light);
//                AppNavigator.launchRecommendCodePage(context);
//              },
//            ),
            SizedBox(
              height: 58,
            ),
//Start without login Button,
            GestureDetector(
              onTap: () {
                AppNavigator.launchDashboard(context);
              },
              child: Column(
                children: <Widget>[
                  Text(
                    StringHelper.start_without_login,
                    style: TextStyle(
                        color: ColorsHelper.themeBlackColor(),
                        //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                        fontSize: 15),
                  ),
                  // Divider(
                  //   color: ColorsHelper.greyTextColor(),
                  //   indent: MediaQuery.of(context).size.width * 0.3,
                  //   endIndent: MediaQuery.of(context).size.width * 0.3,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
