import 'dart:io';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:location/location.dart' as prefix;
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibrate/vibrate.dart';

class Permit {
  static const List<PermissionGroup> pg = [
    PermissionGroup.location,
    PermissionGroup.notification,
    PermissionGroup.storage
  ];
  static Future<bool> checkPermissions({bool pushOnIos = false}) async {
    for (var f in pg) {
      if (f == PermissionGroup.location) {
        bool loc = false;
        await prefix.Location().hasPermission().then((onValue){
          prefix.PermissionStatus status = onValue;
          loc =  status == prefix.PermissionStatus.GRANTED?true:false;
        });
        print("loc = $loc");
        if (loc)
          continue;
        else
          return false;
      } else
       if (f == PermissionGroup.notification && pushOnIos) continue;
      PermissionStatus permission =
          await PermissionHandler().checkPermissionStatus(f);
     
      if (permission != PermissionStatus.granted) return false;
    }
    return true;
  }
}

class AskPermission extends StatefulWidget {
  AskPermission({Key key}) : super(key: key);

  static const String routeName = "AskPermission";
  @override
  _AskPermissionState createState() => _AskPermissionState();
}

class _AskPermissionState extends State<AskPermission> {
  bool agreeAll = false;
  bool gpsRadio = false;
  Permit permit = Permit();
  bool storageRadio = false;
  bool pushRadio = false;
  static Future<bool> checkEveryPermission(PermissionGroup pgX) async {
    if (pgX == PermissionGroup.location)
      return prefix.PermissionStatus.GRANTED == await prefix.Location().hasPermission()?true:false;

    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(pgX);
    if (permission != PermissionStatus.granted) return false;

    return true;
  }

  @override
  void initState() {
    super.initState();
    fetchAllStatus();
  }

  fetchAllStatus({bool pushOnIos = false}) async {
    gpsRadio = prefix.PermissionStatus.GRANTED == await prefix.Location().hasPermission()?true:false;
    setState(() {});
    pushRadio = await checkEveryPermission(Permit.pg.elementAt(1));
    pushRadio = pushOnIos ? pushOnIos : pushRadio;   
    setState(() {});
    storageRadio = await checkEveryPermission(Permit.pg.elementAt(2));
    setState(() {});
    agreeAll = await Permit.checkPermissions(pushOnIos: pushOnIos);
    setState(() {});
  }

  agreeAllFunction() async {
    for (PermissionGroup x in Permit.pg) {
      if (x == PermissionGroup.location) {
        bool loc = false;
        await prefix.Location().hasPermission().then((onValue){
          prefix.PermissionStatus status = onValue;
          loc =  status == prefix.PermissionStatus.GRANTED?true:false;
        });
        print("loc = $loc");
        if (!loc) await PermissionHandler().requestPermissions([x]);
      }
      PermissionStatus permission =
          await PermissionHandler().checkPermissionStatus(x);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler().requestPermissions([x]);
        if (x == PermissionGroup.notification && Platform.isAndroid)
          showSettings();
      }
    }
 fetchAllStatus( pushOnIos: Platform.isIOS ? true : false);
  }

  showSettings() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                StringHelper.pleaseGotoSetting,
              ),
              actions: <Widget>[
                RaisedButton(
                  child: Text(StringHelper.gotoSetting,
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () => PermissionHandler().openAppSettings(),
                ),
                RaisedButton(
                  child: Text(StringHelper.done,
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(
        //color: ColorsHelper.themeBlackColor(),
        color: agreeAll? ColorsHelper.blackBgColor():Colors.white,
        child: SafeArea(
          left: false,
          right: false,
          top: false,
          bottom: true,
          child: Scaffold(
            backgroundColor: ColorsHelper.whiteColor(),
            body: Center(
              child: ScrollConfiguration(
                  behavior: ListViewScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Container(
                      //height: MediaQuery.of(context).size.height / 1.09,
                      padding: EdgeInsets.only(bottom: 62),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 27),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 41,
                                ),
                                Text(
                                  StringHelper.welcome,
                                  style: TextStyle(
                                      fontSize: 20,
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.04,
                                ),
                                Container(
                                  //width: MediaQuery.of(context).size.width * 0.7,
                                  child: Text(
                                    StringHelper.start_beautiful_life,
                                    style: TextStyle(
                                        fontSize: 20,
                                        //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.066,
                                ),
                                //agree all row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      //color:Colors.black12,
//                                      width: MediaQuery.of(context).size.height * 0.1,
//                                      height: MediaQuery.of(context).size.height * 0.13,
                                      width: 86,
                                      height: 65,
                                      child: FlareActor(
                                        'assets/logo_chactor1.flr',
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover,
                                        animation: "Logo",
                                        //controller: controls,
                                      ),
                                    ),
                                    Text(
                                      StringHelper.agree_all,
                                      style: TextStyle(
                                          fontSize: 15,
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        agreeAllFunction();
                                      },
                                      child: Image.asset(
                                        agreeAll
                                            ? ImageAssets.black_check
                                            : ImageAssets.black_uncheck,
                                        height: 32,
                                        width: 32,
                                        fit: BoxFit.contain,
                                        //width: MediaQuery.of(context).size.height * 0.05,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: ColorsHelper.blackBgColor(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24,right: 27),                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.042,
                                ),
                                //gps radio row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          StringHelper.gps_agreement,
                                          style: TextStyle(
                                              fontSize: 15,
                                              //fontFamily: FontsHelper.fonts_HyGothic_regular
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (!gpsRadio)
                                          await prefix.Location().requestPermission();
                                         fetchAllStatus();
                                      },
                                      child: Image.asset(
                                        gpsRadio
                                            ? ImageAssets.black_check
                                            : ImageAssets.black_uncheck,
                                        height: 32,
                                        width: 32,
                                        fit: BoxFit.contain,
                                        //width: MediaQuery.of(context).size.height * 0.05,
                                      ),
                                    ),
                                  ],
                                ),
                                //push notification check
                                Padding(
                                  padding: const EdgeInsets.only(top: 47,bottom: 47),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        StringHelper.notification_agreement,
                                        style: TextStyle(
                                            fontSize: 15,
                                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                                        ),
                                      ),
                                      InkWell(
                                        onTap: ()async{
                                          if (!pushRadio) {
                                            if (Platform.isAndroid)
                                              showSettings();
                                            else {
                                              Future.delayed(Duration(milliseconds: 71),
                                                      () async {
                                                    await PermissionHandler()
                                                        .requestPermissions(
                                                        [Permit.pg.elementAt(1)]);
                                                  });
                                            }
                                          }
                                          fetchAllStatus(
                                              pushOnIos: Platform.isIOS ? true : false);
                                        },
                                        child: Image.asset(
                                          pushRadio
                                              ? ImageAssets.black_check
                                              : ImageAssets.black_uncheck,
                                          height: 32,
                                          width: 32,
                                          fit: BoxFit.contain,
                                          //width: MediaQuery.of(context).size.height * 0.05,
                                        ),
                                      ),
//                                      IconButton(
//                                        onPressed: () async {
//                                          if (!pushRadio) {
//                                            if (Platform.isAndroid)
//                                              showSettings();
//                                            else {
//                                            Future.delayed(Duration(milliseconds: 71),
//                                                  () async {
//                                                await PermissionHandler()
//                                                    .requestPermissions(
//                                                        [Permit.pg.elementAt(1)]);
//                                              });
//                                            }
//                                          }
//                                          fetchAllStatus(
//                                              pushOnIos: Platform.isIOS ? true : false);
//                                        },
//                                        padding: EdgeInsets.zero,
//                                        icon: Image.asset(
//                                          pushRadio
//                                              ? ImageAssets.black_check
//                                              : ImageAssets.black_uncheck,
//                                    height: 32,
//                                    width: 32,
//                                          fit: BoxFit.contain,
//                                          //width: MediaQuery.of(context).size.height * 0.05,
//                                        ),
//                                      ),
                                    ],
                                  ),
                                ),
                                // storage condition check
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      StringHelper.storage_agreement,
                                      style: TextStyle(
                                          fontSize: 15,
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (!storageRadio)
                                          await PermissionHandler()
                                              .requestPermissions(
                                                  [Permit.pg.elementAt(2)]);

                                        fetchAllStatus();
                                      },
                                      child: Image.asset(
                                        storageRadio
                                            ? ImageAssets.black_check
                                            : ImageAssets.black_uncheck,
                                        height: 32,
                                        width: 32,
                                        fit: BoxFit.contain,
                                         //width: MediaQuery.of(context).size.height * 0.05,
                                      ),
                                    ),
                                  ],
                                ),
                                //More button
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          AppNavigator.launchAggreementScreen(context);
                                        },
                                        child: Text(StringHelper.see_agreement_detail,
                                            style: TextStyle(
                                                //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                                //decoration: TextDecoration.underline,
                                                color:ColorsHelper.grey71TextColor(),
                                                fontSize: 15))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            //start button
            bottomNavigationBar: agreeAll ? Container(
              color: ColorsHelper.blackBgColor(),
              height: Platform.isIOS ? 65 : 65,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Vibrate.feedback(FeedbackType.light);
                    launchLoginOrDashboardPage();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:10,left: 25,right: 25,bottom: 10),
                      child: Text(
                        StringHelper.understood_agreement,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ):Text(''),
          ),
        ),
      ),
    );
  }

  void launchLoginOrDashboardPage() async {
    bool isLogin = await SharePreferencesHelper.getInstant()
        .getBool(SharePreferencesHelper.Is_Login);
    if (!agreeAll) {
      PopupDialogs.displayMessageOnly(context, StringHelper.please_allow_all);
    } else {
      Navigator.pop(context);
      if (isLogin) {
        AppNavigator.launchDashboard(context);
      } else {
        AppNavigator.launchLoginPage(context);
      }
    }
  }
}
