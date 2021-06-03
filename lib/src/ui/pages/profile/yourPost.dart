import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/models/beautydatabeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/event_details_view.dart';
import 'package:me_talk/src/ui/pages/community/community_detail_page.dart';
import 'package:me_talk/src/ui/pages/community/forum_list_view.dart';
import 'package:me_talk/src/ui/pages/review/all_review_tab.dart';
import 'package:me_talk/src/ui/pages/review/hospital_review_list_view.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';
import 'dart:io';
import 'dart:ui';
class YourPost extends StatefulWidget {
  @override
  _YourPostState createState() => _YourPostState();
}

class _YourPostState extends State<YourPost> {
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            Positioned(
              top: 10,
              bottom: 0,
              left: 0,
              right: 0,
              child: DefaultTabController(
                length: 2,
                child: Container(
                  color: Colors.white,
                  child: Scaffold(
                    body: Stack(
                      children: <Widget>[
                        TabBarView(
                          children: [
                            _review(),
                            community(),
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

                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      //mainAxisAlignment: MainAxisAlignment.start,
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
                                              "Your post",
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
                                      indicatorColor: ColorsHelper
                                          .themeBlackColor(),
                                      isScrollable: false,
                                      //indicatorWeight: 3,
                                      indicator: UnderlineTabIndicator(
                                          borderSide: BorderSide(width: 3.0),
                                          insets: EdgeInsets.symmetric(
                                              horizontal: 5.0)),
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
                                            "Review",
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
                                            "Community",
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
                        ),
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

  Widget _review() {
    return Padding(

      padding: const EdgeInsets.only(
          left: 16, right: 16, top: 20),
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
      padding: EdgeInsets.only(top: index == 0 ? MediaQuery
          .of(context)
          .size
          .height * .13 : 0),
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

  Widget getForumView(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? MediaQuery
          .of(context)
          .size
          .height * .17 : 0),
      child: InkWell(
          onTap: () {
//            Navigator.push(context, MaterialPageRoute(
//                builder: (context) => CommunityDetailPage(isLogin: true,)));
            //Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityDetailPage(communityId:communityList[index].id ,isLogin: widget.isLogin,)));
          },
          child: ForumListView(
            communityListData: null, index: index, isSearch: false, pic: false,)
        //child: ForumListView(communityListData: communityList[index],index: index,isSearch: !isPopularTab)
      ),
    );
  }

  Widget community() {
    return
      Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: getForumView,
            itemCount: 15,
            //itemCount: communityList.length,
          ));
  }
}