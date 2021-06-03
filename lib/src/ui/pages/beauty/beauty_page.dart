import 'dart:io';
import 'dart:ui';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:me_talk/src/blocs/bloc_beauty_page/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/beautyplaces_tab.dart';
import 'package:me_talk/src/ui/pages/profile/generateNotification.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';
import 'event_tab.dart';
import 'suggest_event_tab.dart';

class BeautyPage extends StatefulWidget {
  @override
  _BeautyPageState createState() => _BeautyPageState();
}

class _BeautyPageState extends State<BeautyPage> {
  BeautyPageBloc beautyPageBloc = BeautyPageBloc();
  double currentScreenWidth = 0;
  PageController pageController = new PageController();
  List<Widget> arrWidget = [];

  @override
  void initState() {
    super.initState();
    beautyPageBloc.add(GetBeautyPageData(context));
    new Future.delayed(const Duration(microseconds: 1), () {});
  }

  @override
  void dispose() {
    super.dispose();
    beautyPageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    double margin =
        (Platform.isIOS ? 104.0 : 25.0 + (Platform.isIOS ? 75 : 62));
    beautyPageBloc.add(GetBeautyPageData(context));
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          top: -0,
          bottom: 0,
          left: 0,
          right: 0,
          child: DefaultTabController(
              length: 3,
              child: BlocProvider(
                create: (BuildContext context) => beautyPageBloc,
                child: BlocBuilder(
                  bloc: beautyPageBloc,
                  builder: (BuildContext context, BeautyPageState state) {
                    if (state.beautyData != null) {
                      return Container(
                        color: Colors.white,
                        //color: Colors.indigo,
                        padding: EdgeInsets.only(top: 0),
                        child: Scaffold(
                          body: Stack(
                            children: <Widget>[
                              TabBarView(
                                children: [
                                  BeautyPlacesTab(
                                    contextx: context,
                                    beautyData: state.beautyData,
                                  ),
                                  EventTab(),
//                        Container()
                                  SuggestEventTab(),
//                        AllEventPage()
                                ],
                              ),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: WidgetHelper.setBlurEffect(Container(
                                    padding: const EdgeInsets.only(top: 44),
                                    //height: 33,
                                    child: Container(
                                      //color: Colors.black12,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 57,
                                            //color: Colors.blue,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
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
                                                  child: Center(
                                                    child: Text(
                                                      StringHelper.beauty_title,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  child: Image.asset(
                                                    ImageAssets.search,
                                                    width: 25.0,
                                                    height: 25.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  onTap: () {
                                                    Vibrate.feedback(
                                                        FeedbackType.light);
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                InkWell(
                                                  child: Image.asset(
                                                    ImageAssets.notification,
                                                    width: 25.0,
                                                    height: 25.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  onTap: () {
                                                    Vibrate.feedback(
                                                        FeedbackType.light);
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
                                                    Vibrate.feedback(
                                                        FeedbackType.light);
                                                    gotoProfile();
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: TabBar(
                                              isScrollable: false,
                                              indicatorPadding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .29,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .29,
                                                  top: 0,
                                                  bottom: 0),
                                              indicatorColor: ColorsHelper
                                                  .themeBlackColor(),
                                              indicatorWeight: 3,
                                              unselectedLabelColor:
                                                  Colors.black,
                                              unselectedLabelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                                //fontWeight: FontWeight.w500
                                              ),
                                              labelColor: Colors.black,
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                              ),
                                              tabs: [
                                                Container(
                                                  child: Text(
                                                    StringHelper.beauty_places,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                                    ),
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                ),
                                                Container(
                                                  child: Text(
                                                    StringHelper.surgery_event,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                                    ),
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                ),
                                                Container(
                                                  child: Text(
                                                    StringHelper.surgery_best,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                                    ),
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: ColorsHelper.darkGrayColor(),
                                            height: 0,
                                            thickness: 0.5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )))
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: SpinKitCircle(
                          color: ColorsHelper.themeBlackColor(),
                          size: 50.0,
                        ),
                      );
                    }
                  },
                ),
              )),
        ),
      ],
    );
  }

  void gotoProfile() async {
    AppNavigator.launchProfilePage(context);
  }
}
