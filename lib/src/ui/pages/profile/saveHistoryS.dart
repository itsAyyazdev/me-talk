import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/beauty/event_details_view.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_portfolio_page.dart';
import 'package:me_talk/src/ui/pages/community/community_detail_page.dart';
import 'package:me_talk/src/ui/pages/community/forum_list_view.dart';
import 'package:me_talk/src/ui/pages/review/hospital_review_list_view.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';
import 'dart:io';
import 'activateHistory.dart';

class SavedHistory extends StatefulWidget {
  @override
  _SavedHistoryState createState() => _SavedHistoryState();
}

class _SavedHistoryState extends State<SavedHistory>
    with SingleTickerProviderStateMixin {
  bool isUpdatedDataTalk, isUpdatedDataSurgery, isUpdatedDataAnonymity;
  bool isLogin = false;
  List<String> imagesBeauty = [
    ImageAssets.imog1,
    ImageAssets.imog2,
    ImageAssets.imog3,
    ImageAssets.imog4,
    ImageAssets.imog5,
    ImageAssets.imog6,
    ImageAssets.imog7,
    ImageAssets.imog8,
    ImageAssets.imog9,
    ImageAssets.imog10,
    ImageAssets.imog11,
    ImageAssets.imog12,
    ImageAssets.imog13,
    ImageAssets.imog14,
    ImageAssets.imog15,
  ];

  final List<Container> communityTabs = <Container>[
    Container(
      child: Text(
        "Portfolio",
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
        'Hospital',
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
        'Review',
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
        'Community',
        style: TextStyle(
          color: Colors.black,
          fontSize: 11.0,
          //fontFamily: FontsHelper.fonts_HyGothic_regular
        ),
      ),
      margin: EdgeInsets.only(bottom: 10),
    ),
  ];
  TabController controller;
  TextEditingController txtController;
  @override
  void initState() {
    // TODO: implement initState
    isUpdatedDataTalk = isUpdatedDataSurgery = isUpdatedDataAnonymity = false;
    controller = TabController(vsync: this, length: communityTabs.length);
    //controller.addListener(_setActiveTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double margin = (Platform.isIOS ? 99.0 : 25.0 + (Platform.isIOS ? 75 : 62));
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
                length: 4,
                child: Container(
                  color: Colors.white,
                  //padding: EdgeInsets.only(top: margin),
                  child: Scaffold(
                    body: Stack(
                      children: <Widget>[
                        TabBarView(
                          controller: controller,
                          children: [
                            portfolio(),
                            _hospital(),
                            _review(),
                            community()
                          ],
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: WidgetHelper.setBlurEffect(Container(
                              padding: const EdgeInsets.only(top: 44),
                              //height: 38,
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
                                        IconButton(
                                          icon: Image.asset(
                                            ImageAssets.back_arrow,
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.contain,
                                          ),
                                          onPressed: () {
                                            Vibrate.feedback(
                                                FeedbackType.light);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        Expanded(
                                          child: Center(
                                              child: Text(
                                            'Save History',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
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
                                          },
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        //profile

                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TabBar(
                                      indicatorColor:
                                          ColorsHelper.themeBlackColor(),
                                      controller: controller,
                                      isScrollable: false,
                                      //indicatorWeight: 2,
                                      indicator: UnderlineTabIndicator(
                                          borderSide: BorderSide(width: 3.0),
                                          insets: EdgeInsets.symmetric(
                                              horizontal: 5.0)),
                                      unselectedLabelColor: Colors.black,
                                      unselectedLabelStyle: TextStyle(
                                          color: Colors.black, fontSize: 12.0
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
                                          ),
                                      labelColor: Colors.black,
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 12.0
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular),
                                          ),
                                      onTap: (int currentIndex) {
                                        print(currentIndex);
                                      },
                                      tabs: communityTabs,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorsHelper.dividerGreyColor(),
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ],
                              ),
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _hospital() {
    return Container(
      margin: EdgeInsets.only(top: 140, left: 20),
      height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 12,
        padding: EdgeInsets.only(bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            SizedBox(height: 10),
            EventDetailsView(
              index: index,
            ),
          ]);
        },
      ),
    );
  }

  Widget historyCard(int index) {
    return Padding(
        padding: EdgeInsets.only(
            top: index == 0 ? MediaQuery.of(context).size.height * .15 : 0),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .30,
                height: MediaQuery.of(context).size.height * .12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    index == 0
                        ? ImageAssets.beauty_event1
                        : index == 1
                            ? ImageAssets.beauty_event3
                            : ImageAssets.beauty_event2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text("location. Hospital name",
                        style: TextStyle(
                            color: ColorsHelper.blackBgColor(),
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text("Rear Great Breast(title)",
                        style: TextStyle(
                            color: ColorsHelper.blackBgColor(), fontSize: 14)),
                  ),
                  Container(
                    child: Text("will be ok after opreation (subtitle)",
                        style: TextStyle(
                            color: ColorsHelper.blackBgColor(), fontSize: 9)),
                  ),
                  IconTheme(
                    data: IconThemeData(
                      color: ColorsHelper.pinkStarFillColor(),
                      size: 10,
                    ),
                    child: StarDisplay(value: 3),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text(
                        "32%",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelper.blueTextColor()),
                      ),
                      Text("3300USD",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorsHelper.blackBgColor())),
                      Text("500USD",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: ColorsHelper.blackBGColor())),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ));
  }

  Widget getForumView(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(
          top: index == 0 ? MediaQuery.of(context).size.height * .17 : 0),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommunityDetailPage(
                          isLogin: true,
                        )));
            //Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityDetailPage(communityId:communityList[index].id ,isLogin: widget.isLogin,)));
          },
          child: ForumListView(
            communityListData: null,
            index: index,
            isSearch: false,
            pic: false,
          )
          //child: ForumListView(communityListData: communityList[index],index: index,isSearch: !isPopularTab)
          ),
    );
  }

  Widget community() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: getForumView,
          itemCount: 15,
          //itemCount: communityList.length,
        ));
  }

  Widget portfolio() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new GridView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 20),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 15,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemBuilder: getFollowingBeautyView,
      ),
    );
  }

  Widget getFollowingBeautyView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: InkWell(
        onTap: () {
          Vibrate.feedback(FeedbackType.light);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopPortfolioPage()),
          );
        },
        child: Image.asset(
          imagesBeauty.elementAt(index),
          //height: 55,
          // width: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _review() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: getReviewList,
        itemCount: 5,
      ),
    );
  }

  Widget getReviewList(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(
          top: index == 0 ? 120 : 0),
      child: InkWell(
          onTap: () {},
          child: HospitalReviewListView(
            isShowReviewView: false,
            isHospitalDetailScreen: false,
            isHospital: true,
            index: index,
          )),
    );
  }
}
