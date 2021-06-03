import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:me_talk/src/blocs/bloc_dashboard/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/beauty_page.dart';
import 'package:me_talk/src/ui/pages/community/community_page.dart';
import 'package:me_talk/src/ui/pages/home_page/address_search_screen.dart';
import 'package:me_talk/src/ui/pages/profile/generateNotification.dart';
import 'package:me_talk/src/ui/pages/home_page/home_page.dart';

import 'package:me_talk/src/ui/pages/review/review_page.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/firebase_ops/fcm.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "Dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardBloc dashboardBloc = DashboardBloc();
  int _currentIndex = 0;
  int typeId = 0;
  Location _locationService = new Location();
  bool _permission = false;
  Widget homeActor, beautyActor, reviewActor, communityActor;
  Map<String, Widget> mapActors;
  double latitude, longitude;
  String error;
  String currentLocation = "";
  TextEditingController controller;

  TextStyle optionStyle = TextStyle(
    fontSize: 30,
    //fontWeight: FontWeight.bold
  );
  final List<Widget> _children = <Widget>[
    HomePage(),
    BeautyPage(),
    ReviewPage(),
    CommunityPage(),
//    Container(
//      color: ColorsHelper.whiteColor(),
//      child: Center(child: Text(StringHelper.coming_soon)),
//    ),
//    Container(
//      color: ColorsHelper.whiteColor(),
//      child: Center(child: Text(StringHelper.coming_soon)),
//    ),
//    Container(
//      color: ColorsHelper.whiteColor(),
//      child: Center(child: Text(StringHelper.coming_soon)),
//    ),
    // ReviewPage(),
    // CommunityPage(),
    // MagazinePage(),
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLogin;

  @override
  void dispose() {
    dashboardBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    checkIfLogin();
    mapActors = {
      "home1": FlareActor(
        'assets/Home.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "home",
      ),
      "home2": FlareActor(
        'assets/Home_Off.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "homeOff",
      ),
//      "beauty1": FlareActor(
//        'assets/beautyBlue.flr',
//        alignment: Alignment.center,
//        fit: BoxFit.cover,
//        animation: "beautyBlue",
//      ),
      "beauty1": FlareActor(
        'assets/Beauty_borderstofill.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "beauty2times",
      ),
      "beauty2": FlareActor(
        'assets/Beauty_unsel.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "beautyOff",
      ),
      "review1": FlareActor(
        'assets/Review.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "review",
      ),
      "review2": FlareActor(
        'assets/Review_Off.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "reviewOff",
      ),
      "community1": FlareActor(
        'assets/Community.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "community",
      ),
      "community2": FlareActor(
        'assets/Community_Off.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "communityOff",
      )
    };
    homeActor = mapActors['home1'];
    beautyActor = mapActors['beauty2'];
    reviewActor = mapActors['review2'];
    communityActor = mapActors['community2'];

    super.initState();
    checkData();
    new Future.delayed(const Duration(microseconds: 100), () {
      getCurrentLocation();
    });
    //   Timer.periodic(Duration(seconds: 3), (Timer t) => _playSuccessAnimation(animation: 'home1time', controls: controlsHome));
  }

  Future<bool> onBackPress() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    if (!Fcm.alreadyInited) Fcm.getInstance().chatNotification();

    return WillPopScope(
      onWillPop: onBackPress,
      child: Stack(children: <Widget>[
        dashboardBody(),
        _currentIndex == 0
            ? Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: WidgetHelper.setBlurEffect(Padding(
                  padding: EdgeInsets.only(top: Platform.isIOS ? 45 : 40),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              //color: Colors.black12,
                              height: 51,
                              width: 75,
                              padding: EdgeInsets.all(0),
                              child: FlareActor(
                                'assets/logo_chactor1.flr',
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                animation: "Logo",
                                //controller: controls,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Center(
                                  child: getTitleWidget(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  InkWell(
                                    child: Image.asset(
                                      ImageAssets.notification,
                                      width: 25.0,
                                      height: 25.0,
                                      fit: BoxFit.contain,
                                    ),
                                    onTap: () {
                                      Vibrate.feedback(FeedbackType.light);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenerateNotifications()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  //profile
                                  InkWell(
                                    child: Image.asset(
                                      ImageAssets.user_nav,
                                      width: 25.0,
                                      height: 25.0,
                                      fit: BoxFit.contain,
                                    ),
                                    onTap: () {
                                      Vibrate.feedback(FeedbackType.light);
                                      gotoProfile();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _currentIndex == 0
                            ? Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Divider(
                                  color: ColorsHelper.darkGrayColor(),
                                  height: 0,
                                  thickness: 0.5,
                                ),
                              )
                            : SizedBox(
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                )),
//            ClipRect(
//              child: BackdropFilter(
////                filter: _currentIndex == 0
////                    ?ImageFilter.blur(sigmaX: 10, sigmaY: 10)
////                    :ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                child: Material(
//                  color: Colors.white.withOpacity(0.92),
//                  //color: _currentIndex == 0 ?Colors.white.withOpacity(0.9):Colors.white.withOpacity(0.85),
//                  child: Padding(
//                    padding: EdgeInsets.only(top: Platform.isIOS ? 45 : 40),
//                    child: Container(
//                      height: 57,
//                      //color: Colors.blue,
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        //mainAxisAlignment: MainAxisAlignment.start,
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: 10),
//                            //color: Colors.black12,
//                            height: Platform.isIOS ? 51 : 62,
//                            width: Platform.isIOS ? 75 : 62,
//                            padding: EdgeInsets.all(0),
//                            child: FlareActor(
//                              'assets/logo_chactor1.flr',
//                              alignment: Alignment.center,
//                              fit: BoxFit.cover,
//                              animation: "Logo",
//                              //controller: controls,
//                            ),
//                          ),
//                          Expanded(
//                            child: Center(
//                              child: getTitleWidget(),
//                            ),
//                          ),
//                          (_currentIndex == 1 || _currentIndex == 2)?InkWell(
//                            child: Image.asset(
//                              ImageAssets.search,
//                              width: 25.0,
//                              height: 25.0,
//                              fit: BoxFit.contain,
//                            ),
//                            onTap: () {
//                              Vibrate.feedback(FeedbackType.light);
//                            },
//                          ):Text(''),
//                          SizedBox(
//                            width: 15,
//                          ),
//                          InkWell(
//                            child: Image.asset(
//                              ImageAssets.notification,
//                              width: 25.0,
//                              height: 25.0,
//                              fit: BoxFit.contain,
//                            ),
//                            onTap: () {
//                              Vibrate.feedback(FeedbackType.light);
//                            },
//                          ),
//                          SizedBox(
//                            width: 15,
//                          ),
//                          //profile
//                          InkWell(
//                            child: Image.asset(
//                              ImageAssets.user_nav,
//                              width: 25.0,
//                              height: 25.0,
//                              fit: BoxFit.contain,
//                            ),
//                            onTap: () {
//                              Vibrate.feedback(FeedbackType.light);
//                              gotoProfile();
//                            },
//                          ),
//                          SizedBox(
//                            width: 10,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            )
              )
            : SizedBox(
                height: 0,
              ),
      ]),
    );
  }

  Widget dashboardBody() {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        _children[_currentIndex],
        Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: .5, color: ColorsHelper.themeBlackColor()),
            )),
            height: 79.5,
            child: WidgetHelper.setBlurEffect(BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onTap: onTabTapped,
              // new
              currentIndex: _currentIndex,
              // new
              selectedFontSize: 8,
              unselectedFontSize: 8,
              unselectedItemColor: ColorsHelper.blackBgColor(),
              selectedItemColor: Colors.black,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                color: ColorsHelper.blackBgColor(),
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                //fontWeight: FontWeight.w700
              ),
              unselectedLabelStyle: TextStyle(
                color: Color(0xff767676),
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                //fontWeight: FontWeight.w700
              ),
              type: BottomNavigationBarType.fixed,
              items: [
                new BottomNavigationBarItem(
                  icon: Container(
                    width: 33,
                    height: 30,
                    child: homeActor,
                  ),
                  // Image.asset(ImageAssets.home_tab,
                  //     width: 20, height: 20, fit: BoxFit.contain),
                  title: Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(StringHelper.home_tab),
                  ),
                ),
                new BottomNavigationBarItem(
                  icon: Container(width: 30, height: 30, child: beautyActor),
                  title: Text(StringHelper.beauty_tab),
                ),
                new BottomNavigationBarItem(
                  icon: Container(width: 33, height: 30, child: reviewActor),
                  title: Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(StringHelper.review_tab),
                  ),
                ),
                new BottomNavigationBarItem(
                  icon: Container(width: 33, height: 30, child: communityActor),
                  title: Text(StringHelper.community_tab),
                ),
              ],
            ))
//          ClipRect(
//            child: BackdropFilter(
//              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
//              child: BottomNavigationBar(
//                backgroundColor: Colors.white.withOpacity(0.85),
//                elevation: 0,
//                onTap: onTabTapped,
//                // new
//                currentIndex: _currentIndex,
//                // new
//                selectedFontSize: 8,
//                unselectedFontSize: 8,
//                unselectedItemColor: ColorsHelper.blackBgColor(),
//                selectedItemColor: Colors.black,
//                showUnselectedLabels: true,
//                selectedLabelStyle: TextStyle(
//                  color: ColorsHelper.blackBgColor(),
//                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                  //fontWeight: FontWeight.w700
//                ),
//                unselectedLabelStyle: TextStyle(
//                  color: Color(0xff767676),
//                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                  //fontWeight: FontWeight.w700
//                ),
//                type: BottomNavigationBarType.fixed,
//                items: [
//                  new BottomNavigationBarItem(
//                    icon: Container(width: 33, height: 30, child: homeActor,),
//                    // Image.asset(ImageAssets.home_tab,
//                    //     width: 20, height: 20, fit: BoxFit.contain),
//                    title: Padding(
//                      padding: EdgeInsets.only(top: 2),
//                      child: Text(StringHelper.home_tab),
//                    ),
//                  ),
//                  new BottomNavigationBarItem(
//                    icon: Container(width: 30, height: 30, child: beautyActor),
//                    title: Text(StringHelper.beauty_tab),
//                  ),
//                  new BottomNavigationBarItem(
//                    icon: Container(width: 33, height: 30, child: reviewActor),
//                    title: Padding(
//                      padding: EdgeInsets.only(top: 2),
//                      child: Text(StringHelper.review_tab),
//                    ),
//                  ),
//                  new BottomNavigationBarItem(
//                    icon:
//                        Container(width: 33, height: 30, child: communityActor),
//                    title: Text(StringHelper.community_tab),
//                  ),
//                ],
//              ),
//            ),
//          )

            ),
      ],
    );
  }

  void onTabTapped(int index) {
    buttonTap(index);
    setState(() {
      _currentIndex = index;
    });
  }

  buttonTap(int index) {
    setState(() {
      switch (index) {
        case 0:
          Vibrate.feedback(FeedbackType.light);
          homeActor = mapActors['home1'];
          beautyActor = mapActors['beauty2'];
          reviewActor = mapActors['review2'];
          communityActor = mapActors['community2'];
          break;
        case 1:
          Vibrate.feedback(FeedbackType.light);
          homeActor = mapActors['home2'];
          beautyActor = mapActors['beauty1'];
          reviewActor = mapActors['review2'];
          communityActor = mapActors['community2'];
          break;
        case 2:
          Vibrate.feedback(FeedbackType.light);
          homeActor = mapActors['home2'];
          beautyActor = mapActors['beauty2'];
          reviewActor = mapActors['review1'];
          communityActor = mapActors['community2'];
          break;
        case 3:
          Vibrate.feedback(FeedbackType.light);
          homeActor = mapActors['home2'];
          beautyActor = mapActors['beauty2'];
          reviewActor = mapActors['review2'];
          communityActor = mapActors['community1'];
          break;
      }
      setState(() {});
    });
  }

  void checkIfLogin() async {
    /* isLogin = await SharePreferencesHelper.getInstant()
        .getBool(SharePreferencesHelper.Is_Login);
*/
    isLogin = true;
  }

  void gotoProfile() async {
    if (isLogin) {
      AppNavigator.launchProfilePage(context);
    } else {
      AppNavigator.launchLoginPage(context);
    }
  }

  Widget getTitleWidget() {
    return InkWell(
      onTap: () {
        if (_currentIndex == 0) {
          print("Location Tap");
          print("$currentLocation=====");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddressSearchScreen()),
          );
        }
      },
      child: getTitleView(),
    );

    /* if (_currentIndex == 0) {
      return Text(
        currentLocation,
      );
    } else if (_currentIndex == 1) {
      return Text(
        StringHelper.beauty_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    } else if (_currentIndex == 2) {
      return Text(
        StringHelper.review_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    } else if (_currentIndex == 3) {
      typeId = 3;
      return Text(
        StringHelper.community_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    } else {
      return Text(
        StringHelper.magazine_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    }
    */
  }

  Widget getTitleView() {
    if (_currentIndex == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(currentLocation,
              style: TextStyle(
                color: ColorsHelper.themeBlackColor(),
                fontSize: 15.0,
                //fontFamily: FontsHelper.fonts_HyGothic_regular,
              )),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 13,
            width: 13,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: ColorsHelper.pinkDropDown(),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } else if (_currentIndex == 1) {
      return Text(
        StringHelper.beauty_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          //fontFamily: FontsHelper.fonts_HyGothic_regular,
        ),
      );
    } else if (_currentIndex == 2) {
      return Text(
        StringHelper.review_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          //fontFamily: FontsHelper.fonts_HyGothic_regular,
        ),
      );
    } else {
      return Container(
        height: 31,
        width: MediaQuery.of(context).size.width - 200,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.07),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(
                    ImageAssets.search_box_icon,
                    width: 17,
                    height: 17,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 250,
                  //color: Colors.black12,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    //textAlign: TextAlign.center,
                    controller: controller,
                    cursorColor: Color(0xff403F3F),
                    //textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 16),
                      hintText: StringHelper.community_search_hint,

                      ///suffix: IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
                      //suffixIcon: Icon(Icons.clear),
                    ),
                    style: TextStyle(
                      color: Color(0xff403F3F),
                      fontSize: 10.0,
                    ),
                    onSubmitted: (String searchWord) {
                      if (searchWord.length > 0) {
//                        if(widget.typeId==3){
//                          searchApiCall(searchWord);
//                        }
                      }
                    },
                  ),
                )
              ],
            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 10,right: 10),
//              child: InkWell(
//                onTap: (){
////                  controller.clear();
////                  searchList.clear();
////                  setState(() {});
//                },
//                child: Image.asset(
//                  ImageAssets.search_close,
//                  width: 15,
//                  height: 15,
//                  fit: BoxFit.contain,
//                ),
//              ),
//            ),
          ],
        ),
      );
    }

    /*if (_currentIndex == 0) {
      return Text(
        currentLocation,
      );
    } else if (_currentIndex == 1) {
      return Text(
        StringHelper.beauty_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    } else if (_currentIndex == 2) {
      return Text(
        StringHelper.review_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    } else if (_currentIndex == 3) {
      typeId = 3;
      return Text(
        StringHelper.community_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    } else {
      return Text(
        StringHelper.magazine_title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
        ),
      );
    }*/
  }

  checkData() async {
    // String data = await SharePreferencesHelper.getInstant()
    //     .getString(SharePreferencesHelper.User_Data);
    // loginData = User.fromJson(jsonDecode(data));
    // int id = await SharePreferencesHelper.getInstant()
    //     .getInt(SharePreferencesHelper.Id);
    // String userName = await SharePreferencesHelper.getInstant()
    //     .getString(SharePreferencesHelper.User_Name);
    // String userEmail = await SharePreferencesHelper.getInstant()
    //     .getString(SharePreferencesHelper.User_Email);
    // int phoneNo = await SharePreferencesHelper.getInstant()
    //     .getInt(SharePreferencesHelper.Phone_No);
    // String password = await SharePreferencesHelper.getInstant()
    //     .getString(SharePreferencesHelper.Password);
    // int phoneCode = await SharePreferencesHelper.getInstant()
    //     .getInt(SharePreferencesHelper.Phone_Code);
    // String avatar = await SharePreferencesHelper.getInstant()
    //     .getString(SharePreferencesHelper.Avatar);
    // bool isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // print(id.toString() +
    //     "\n " +
    //     userName +
    //     " \n" +
    //     userEmail +
    //     " \n" +
    //     phoneNo.toString() +
    //     " \n" +
    //     password +
    //     " \n" +
    //     phoneCode.toString() +
    //     "\n " +
    //     avatar +
    //     " \n" +
    //     isLogin.toString() +
    //     " \n");
  }

  void getCurrentLocation() async {
    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        location = await _locationService.getLocation();
        if (location != null) {
          SharePreferencesHelper.getInstant()
              .setDouble(SharePreferencesHelper.LATITUDE, location.latitude);
          SharePreferencesHelper.getInstant()
              .setDouble(SharePreferencesHelper.LONGITUDE, location.longitude);
          latitude = await SharePreferencesHelper.getInstant()
              .getDouble(SharePreferencesHelper.LATITUDE);
          longitude = await SharePreferencesHelper.getInstant()
              .getDouble(SharePreferencesHelper.LONGITUDE);
          print("Permission: $latitude");
          print("Permission: $longitude");
          final List<Placemark> placeMarks =
              await Geolocator().placemarkFromCoordinates(latitude, longitude);

          if (placeMarks != null && placeMarks.isNotEmpty) {
            currentLocation = placeMarks[0].locality;
            setState(() {});
          }
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          location = await _locationService.getLocation();
          latitude = location.latitude;
          longitude = location.longitude;
        }
      }
    } catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }
  }
}
