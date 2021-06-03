import 'dart:io';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/review/write_review.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

import 'all_review_tab.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    double margin =
        (Platform.isIOS ? 99.0 : 25.0 + (Platform.isIOS ? 75 : 62));
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: DefaultTabController(
                length: 2,
                child: Container(
                  color: Colors.white,
                  child: Scaffold(
//                    appBar: PreferredSize(
//                      preferredSize: MediaQuery.of(context).size.height == 667
//                          ? Size.fromHeight(30)
//                          : Size.fromHeight(5),
//                      child: Container(
//                        color: Colors.white,
//                        child: Column(
//                          children: <Widget>[
//                            TabBar(
//                              indicatorColor: ColorsHelper.themeBlackColor(),
//                              isScrollable: false,
//                              //indicatorWeight: 3,
//                              indicator: UnderlineTabIndicator(
//                                  borderSide: BorderSide(width: 3.0),
//                                  insets: EdgeInsets.symmetric(horizontal: 55.0)),
//                              //indicatorSize: TabBarIndicatorSize.label,
//                              unselectedLabelColor: Colors.black,
//                              unselectedLabelStyle: TextStyle(
//                                color: Colors.black,
//                                fontSize: 13.0,
//                                //fontFamily: FontsHelper.fonts_HyGothic_regular
//                              ),
//                              labelColor: Colors.black,
//                              labelStyle: TextStyle(
//                                color: Colors.black,
//                                fontSize: 13.0,
//                                //fontFamily: FontsHelper.fonts_HyGothic_regular
//                              ),
//                              tabs: [
////                        Tab(text: StringHelper.surgery_best,),
////                        //Tab(text: StringHelper.beauty_page_suggest_tab,),
//                                Tab(
//                                  text: StringHelper.beauty_title,
//                                ),
//                                Tab(
//                                  text: StringHelper.surgery_str,
//                                ),
//                              ],
//                            ),
//                            Divider(
//                              color: Colors.black45,
//                              height: 0,
//                              thickness: 0.5,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                    body: Stack(
                      children: <Widget>[
                        TabBarView(
                          children: [
                            AllReviewTab(
                              isHome: false,
                              isHospital: false,
                            ),
                            AllReviewTab(
                              isHome: true,
                              isHospital: true,
                            ),
//                BestReviewTab(),
                            //SuggestReviewTab(),
                            //BeautyShopReviewTab(),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: WidgetHelper.setBlurEffect(Container(
                            padding: const EdgeInsets.only(top: 44),
                            //color: Colors.white.withOpacity(0.6),
                            //height: 38,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 57,
                                  //color: Colors.blue,
                                  child: Row(
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
                                        child: Center(
                                          child: Text(
                                            StringHelper.review_title,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              //fontFamily: FontsHelper.fonts_HyGothic_regular,
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
                                          Vibrate.feedback(FeedbackType.light);
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
                                          Vibrate.feedback(FeedbackType.light);
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TabBar(
                                    indicatorColor: ColorsHelper.themeBlackColor(),
                                    isScrollable: false,
                                    //indicatorWeight: 3,
                                    indicator: UnderlineTabIndicator(
                                        borderSide: BorderSide(width: 3.0),
                                        insets: EdgeInsets.symmetric(horizontal: 55.0)),
                                    //indicatorSize: TabBarIndicatorSize.label,
                                    unselectedLabelColor: Colors.black,
                                    unselectedLabelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                    ),
                                    labelColor: Colors.black,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                    ),
                                    tabs: [
                                      Container(
                                        child: Text(
                                          StringHelper.beauty_title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text(
                                          StringHelper.surgery_str,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black45,
                                  height: 0,
                                  thickness: 0.5,
                                ),
                              ],
                            ),
                          ))
//                          ClipRect(
//                            child: BackdropFilter(
//                              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
//                              child: Material(
//                                color: Colors.white.withOpacity(0.8),
//                                child: Container(
//                                  padding: const EdgeInsets.only(top: 12),
//                                  //color: Colors.white.withOpacity(0.6),
//                                  height: 36,
//                                  child: Column(
//                                    children: <Widget>[
//                                      TabBar(
//                                        indicatorColor: ColorsHelper.themeBlackColor(),
//                                        isScrollable: false,
//                                        //indicatorWeight: 3,
//                                        indicator: UnderlineTabIndicator(
//                                            borderSide: BorderSide(width: 3.0),
//                                            insets: EdgeInsets.symmetric(horizontal: 55.0)),
//                                        //indicatorSize: TabBarIndicatorSize.label,
//                                        unselectedLabelColor: Colors.black,
//                                        unselectedLabelStyle: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 13.0,
//                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
//                                        ),
//                                        labelColor: Colors.black,
//                                        labelStyle: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 13.0,
//                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
//                                        ),
//                                        tabs: [
//                                          Container(
//                                            child: Text(
//                                              StringHelper.beauty_title,
//                                              style: TextStyle(
//                                                color: Colors.black,
//                                                fontSize: 13.0,
//                                                //fontFamily: FontsHelper.fonts_HyGothic_regular
//                                              ),
//                                            ),
//                                            margin: EdgeInsets.only(
//                                              bottom: 6,
//                                            ),
//                                          ),
//                                          Container(
//                                            child: Text(
//                                              StringHelper.surgery_str,
//                                              style: TextStyle(
//                                                color: Colors.black,
//                                                fontSize: 13.0,
//                                                //fontFamily: FontsHelper.fonts_HyGothic_regular
//                                              ),
//                                            ),
//                                            margin: EdgeInsets.only(
//                                              bottom: 6,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                      Divider(
//                                        color: Colors.black45,
//                                        height: 0,
//                                        thickness: 0.5,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100, right: 20),
          child: SizedBox(
            height: 43,
            width: 43,
            child: FloatingActionButton(
              onPressed: () {
                //_displayDialog();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WriteReview()));

              },
              elevation: 0,
              child: Image.asset(
                ImageAssets.pencil_icon,
                width: 21,
                height: 21,
                fit: BoxFit.cover,
              ),
              backgroundColor: ColorsHelper.darkBlackColor(),
            ),
          ),
        )
      ],
    );
  }

  void gotoProfile() async {
    AppNavigator.launchLoginPage(context);
  }

  _displayDialog() {
    showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              contentPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black26, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 0.5,
                                    blurRadius: 4,
                                    offset: Offset(0, 1))
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2 - 78,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 8, bottom: 8),
                                child: Text(
                                  StringHelper.surgery_str,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsHelper.pinkStarFillColor(),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black26, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 4,
                                      offset: Offset(0, 1))
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 2 - 78,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8, bottom: 8),
                                  child: Text(
                                    StringHelper.beauty_title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorsHelper.pinkStarFillColor(),
                                        fontSize: 14.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset: Offset(0, 1))
                          ],
                        ),
                        width: MediaQuery.of(context).size.width - 78,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 8),
                            child: Text(
                              StringHelper.str_cancel,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsHelper.pinkStarFillColor(),
                                  fontSize: 14.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
