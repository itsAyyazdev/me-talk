import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_catgory_list_view.dart';

import 'hospital_review_list_view.dart';

class BeautyShopReviewTab extends StatefulWidget {
  @override
  _BeautyShopReviewTabState createState() => _BeautyShopReviewTabState();
}

class _BeautyShopReviewTabState extends State<BeautyShopReviewTab> {
  bool isPopularTab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          isShowReviewView: true,
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
