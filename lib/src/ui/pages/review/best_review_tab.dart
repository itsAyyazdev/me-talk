import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_catgory_list_view.dart';
import 'package:me_talk/src/ui/pages/home_page/before_aftre_view.dart';

import 'hospital_review_list_view.dart';

class BestReviewTab extends StatefulWidget {
  @override
  _BestReviewTabState createState() => _BestReviewTabState();
}

class _BestReviewTabState extends State<BestReviewTab> {
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
    // TODO: implement initState
    super.initState();
    currentBeforeIndex = 0;
    isPopularTab = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Visibility(
                  visible: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(StringHelper.reCommanded,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  //fontFamily: FontsHelper.fonts_HyGothic_regular
                                )),
                            InkWell(
                              child: Image.asset(
                                ImageAssets.arrow_right,
                                width: 20.0,
                                height: 20.0,
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
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: BeforeAfterView(
                          isHome: false,
                          isBeauty: false,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: ColorsHelper.themeBlackColor(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
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
                                  child: Text(
                                    StringHelper.popular_order,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: isPopularTab,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      width: 80,
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Image.asset(
                                ImageAssets.pink_circle_sep,
                                color: Colors.white,
                                width: 10,
                                height: 10,
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
                                  child: Text(
                                    StringHelper.recent_order,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !isPopularTab,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      width: 80,
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                _displayDialog();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 10),
                                  child: Text(
                                    StringHelper.custom_part_caps,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
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
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: getReviewList,
                    itemCount: 3,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getReviewList(BuildContext context, int index) {
    return InkWell(
        onTap: () {},
        child: HospitalReviewListView(
          isShowReviewView: false,
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
