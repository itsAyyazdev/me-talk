import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_catgory_list_view.dart';
import 'package:me_talk/src/ui/pages/home_page/before_aftre_view.dart';
import 'package:me_talk/src/ui/pages/review/hospital_review_list_view.dart';

class AllReviewTab extends StatefulWidget {
  bool isHome = false;
  bool isHospital = false;
  AllReviewTab({Key key, this.isHome, this.isHospital}) : super(key: key);
  @override
  _AllReviewTabState createState() => _AllReviewTabState();
}

class _AllReviewTabState extends State<AllReviewTab> {
  List<String> images = [
    'assets/images/Reviews/review-1.png',
    'assets/images/Reviews/review-2.png',
    'assets/images/Reviews/review-3.png',
    'assets/images/Reviews/review-4.png',
    'assets/images/Reviews/review-5.png',
    'assets/images/Reviews/review-6.png',
    'assets/images/Reviews/review-7.png',
    'assets/images/Reviews/review-8.png',
  ];

  int currentBeforeIndex;
  bool isPopularTab;

  @override
  void initState() {
    print("===IS HOME=== \n ${widget.isHome}");

    super.initState();
    currentBeforeIndex = 0;
    isPopularTab = true;
  }

  @override
  Widget build(BuildContext context) {
    //double margin = (Platform.isIOS ? 53.0 : 25.0 + (Platform.isIOS ? 75 : 62));
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          ListView(
            //padding: EdgeInsets.only(top: 54),
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Container(
                height: Platform.isIOS
                    ? MediaQuery.of(context).padding.top > 20 ? 94 : 124
                    : 114,
                color: Colors.white,
              ),
              Container(
                //color: Color(0xfff0f0f0),
                height: 54,
              ),
              Visibility(
                visible: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 33.0, right: 10.0, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            StringHelper.best_pick,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              //fontFamily: FontsHelper.fonts_HyGothic_regular
                            ),
                          ),
                          InkWell(
                            child: Image.asset(
                              ImageAssets.arrow_right,
                              width: 18.0,
                              height: 18.0,
                              fit: BoxFit.contain,
                            ),
                            onTap: () {
//                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EventListScreen(
//                                    isFromHomeTab: false,
//                                    eventCategory: '~',
//                                  )));
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 25, right: 25),
                      child: BeforeAfterView(
                        isBeauty: widget.isHome,
                        isHome: false,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 20, bottom: 70),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: getReviewList,
                  itemCount: 5,
                ),
              )
            ],
          ),
          Positioned(
            top: 136,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
                child: Material(
                  color: Color(0xfff0f0f0).withOpacity(0.85),
                  child: Container(
                    //color: Color(0xfff4f4f5),
                    height: 54,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPopularTab = true;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          StringHelper.popular_order,
                                          style: TextStyle(
                                            color: Color(0xff252C3E),
                                            fontSize: 10,
                                            //fontFamily: FontsHelper.fonts_medium
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                      child: Visibility(
                                        visible: isPopularTab,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Container(
                                            width: 75,
                                            height: 3,
                                            color: Color(0xff252C3E),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Image.asset(
                                    ImageAssets.pink_circle_sep,
                                    color: Color(0xff252C3E),
                                    width: 7,
                                    height: 7,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPopularTab = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          StringHelper.recent_order,
                                          style: TextStyle(
                                            color: Color(0xff252C3E),
                                            fontSize: 10,
                                            //fontFamily: FontsHelper.fonts_medium
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                      child: Visibility(
                                        visible: !isPopularTab,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Container(
                                            width: 75,
                                            height: 3,
                                            color: Color(0xff252C3E),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: InkWell(
                                onTap: () {
                                  // _displayDialog();
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 20, right: 10),
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            ImageAssets.category_review,
                                            //color: Colors.white,
                                            width: 14,
                                            height: 14,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            StringHelper.category_str,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              // fontFamily: FontsHelper.fonts_HyGothic_regular
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getReviewList(BuildContext context, int index) {
    return InkWell(
        onTap: () {},
        child: HospitalReviewListView(
          isShowReviewView: !widget.isHome,
          isHospitalDetailScreen: false,
          isHospital: widget.isHospital,
          index: index,
        ));
  }

  _displayDialog() {
    showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ShopCategoryListAlertView(
            categoryTypeId: "2",
          );
        });
  }
}
