import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/event_detail_screen.dart';
import 'package:me_talk/src/ui/pages/beauty/event_details_view.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

import 'dart:ui';

class HistoryRequest extends StatefulWidget {
  HistoryRequest({this.body});

  final int body;

  @override
  _HistoryRequestState createState() => _HistoryRequestState();
}

class _HistoryRequestState extends State<HistoryRequest> {
  List<String> images = [
    ImageAssets.beauty_event1,
    ImageAssets.beauty_event2,
    ImageAssets.beauty_event3,
    ImageAssets.beauty_event4,
    ImageAssets.beauty_event5,
    ImageAssets.beauty_event6,
    ImageAssets.beauty_event7,
    ImageAssets.beauty_event8,
    ImageAssets.beauty_event9,
    ImageAssets.beauty_event10,
//    ImageAssets.beauty_event11,
//    ImageAssets.beauty_event12,
  ];

  Widget build(BuildContext context) {
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
                          children: [_requestBeauty(), _requestHistory()],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              widget.body == 0
                                                  ? "Request"
                                                  : widget.body == 1
                                                      ? "Booking"
                                                      : widget.body == 2
                                                          ? "Visit"
                                                          : "Complete",
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
                                      indicatorColor:
                                          ColorsHelper.themeBlackColor(),
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
                                            "Hospital",
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

  void gotoProfile() async {
    AppNavigator.launchLoginPage(context);
  }

  Widget _beautycard(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          top: index == 0 ? 130 : 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: 94,
                height: 90,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                  SizedBox(
//                    height: 3,
//                  ),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'shop name',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular,
                        //fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'active user name',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular,
                        //fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Location',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsHelper.black60Color(),
                        fontSize: 10.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'speciality of',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsHelper.pinkStarFillColor(),
                        fontSize: 12.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .25,
            ),
            Text(
              '18.0 Km',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorsHelper.yellowDistanceColor(),
                fontSize: 12.0,
                //fontFamily: FontsHelper.fonts_HyGothic_regular,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _requestBeauty() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 10,
        // scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return _beautycard(index);
        },
      ),
    );
  }

  Widget _requestHistory() {
    return Container(
      margin: EdgeInsets.only(top: 140, left: 20, right: 20),
      height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: 34),
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            SizedBox(
              height: 10,
            ),
            EventDetailsView(index: index)
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
                              fontSize: 9,
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
}

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
