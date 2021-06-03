import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/home_page/before_aftre_view.dart';
import 'package:me_talk/src/ui/pages/home_page/city_selection_screen.dart';

import 'hospital_review_list_view.dart';

class SuggestReviewTab extends StatefulWidget {
  @override
  _SuggestReviewTabState createState() => _SuggestReviewTabState();
}

class _SuggestReviewTabState extends State<SuggestReviewTab> {
  List<String> images = [
    ImageAssets.bg7,
    ImageAssets.bg8,
    ImageAssets.bg9,
    ImageAssets.bg10,
    ImageAssets.bg11,
    ImageAssets.bg12,
    ImageAssets.bg13,
    ImageAssets.bg14,
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
                            Text(
                              StringHelper.reCommanded,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: FontsHelper.fonts_regular),
                            ),
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
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
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: isPopularTab,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: SizedBox(
                                      width: 80,
                                      child: Divider(
                                        color: ColorsHelper.themeColor(),
                                        height: 2,
                                      ),
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
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
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
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !isPopularTab,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: SizedBox(
                                      width: 80,
                                      child: Divider(
                                        color: ColorsHelper.themeColor(),
                                        height: 2,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => CitySelectionScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: ColorsHelper.themeColor(),
                                    width: 0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 5, right: 5),
                              child: Text(
                                StringHelper.city_custom_part,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
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
}
