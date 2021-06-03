import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_request/event_category_list_screen.dart';
import 'package:me_talk/src/ui/pages/home_page/event_details_view.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

class EventTab extends StatefulWidget {
  @override
  _EventTabState createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  bool isGrid = false;
  bool isList = true;
  bool isMore = true;
  bool isBack = false;
  int currentSelectedCategory = 0;
  List<String> categoryList = [
    'Eye',
    'Nose',
    'Cheekbone',
    'Eye',
    'Nose',
    'Cheekbone',
    'Eye',
    'Nose',
    'Cheekbone'
  ];
  List<String> arrEvent = [
    'assets/images/beauty/hospital_event/event1.png',
    'assets/images/beauty/hospital_event/event2.png',
    'assets/images/beauty/hospital_event/event3.png',
    'assets/images/beauty/hospital_event/event4.png',
    'assets/images/beauty/hospital_event/event5.png',
    'assets/images/beauty/hospital_event/event6.png',
    'assets/images/beauty/hospital_event/event7.png',
    'assets/images/beauty/hospital_event/event8.png',
    'assets/images/beauty/hospital_event/event9.png',
    'assets/images/beauty/hospital_event/event10.png',
    'assets/images/beauty/hospital_event/event11.png',
    'assets/images/beauty/hospital_event/event12.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: <Widget>[
          Container(
            //height: MediaQuery.of(context).padding.top > 20 ?93:123,
            height: Platform.isIOS
                ? MediaQuery.of(context).padding.top > 20 ? 93 : 123
                : 108,
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 42.0, left: 13, right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        isGrid
                            ? 'Around you Best (distance)'
                            : "Around you random(distance)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          //fontFamily: FontsHelper.fonts_HyGothic_regular,
                        ),
                      ),
                      isGrid
                          ? Text('')
                          : InkWell(
                              child: Image.asset(
                                ImageAssets.arrow_right,
                                width: 12.0,
                                height: 19.0,
                                fit: BoxFit.contain,
                              ),
                              onTap: () {},
                            ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isList,
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 1.25,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 9,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              onCellItemClick(index);
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19.0,
                                    top: 10,
                                    bottom: 12),
                                child: Column(
                                  children: <Widget>[
                                    EventDetailsView(
                                      index: index,
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Visibility(
                    visible: isMore,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75.0, right: 75.0),
                      child: InkWell(
                        onTap: () {
                          isGrid = true;
                          isList = false;
                          isMore = false;
                          isBack = true;
                          setState(() {});
                          Vibrate.feedback(FeedbackType.light);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                offset: Offset(0, 3),
                                color: Colors.black.withOpacity(0.30),
                              )
                            ],
                            color: ColorsHelper.themeBlackColor(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 5.0),
                                child: Text(
                                  StringHelper.seeMoreDistance,
                                  style: TextStyle(
                                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                      fontSize: 14,
                                      color: ColorsHelper.whiteColor()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, bottom: 3.0),
                                child: Text(
                                  ".  .  .",
                                  style: TextStyle(
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                      color: ColorsHelper.whiteColor(),
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isGrid,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      if (index % 2 == 0) {
                        return _buildCarousel(context, index ~/ 2);
                      } else {
                        return Container(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
//                  child: Container(
//                    height: 365,
//                    child: Padding(
//                      padding: const EdgeInsets.only(top: 0, bottom: 10),
//                      child: new GridView.builder(
////              padding: EdgeInsets.all(0),
//                        scrollDirection: Axis.horizontal,
//                        itemCount: 9,
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                            crossAxisCount: 3, childAspectRatio: 0.38),
//                        itemBuilder: (BuildContext context, int index) {
//                          return Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 19.0, right: 19.0, bottom: 10),
//                              child: EventDetailsView(
//                                index: index,
//                              ));
//                        },
//                      ),
//                    ),
//                  ),
                ),
                Padding(
                  padding: isGrid
                      ? EdgeInsets.only(top: 0.0, left: 13, right: 13)
                      : EdgeInsets.only(top: 70.0, left: 22, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        isGrid
                            ? 'Around you random(distance)'
                            : 'All are random',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          //fontFamily: FontsHelper.fonts_HyGothic_regular,
                        ),
                      ),
                      isGrid
                          ? Text('')
                          : InkWell(
                              child: Image.asset(
                                ImageAssets.arrow_right,
                                width: 18.0,
                                height: 18.0,
                                fit: BoxFit.contain,
                              ),
                              onTap: () {},
                            ),
                    ],
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Container(
                    //height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 50),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 9,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              onCellItemClick(index);
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19.0,
                                    top: 10,
                                    bottom: 10),
                                child: Column(
                                  children: <Widget>[
                                    EventDetailsView(
                                      index: index,
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 139.0),
        child: InkWell(
          onTap: () {
            print("click");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventCategoryListScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38.0),
            child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: WidgetHelper.customBoxDecorationWithShadow(
                  ColorsHelper.themeBlackColor(),
                  ColorsHelper.whiteColor(),
                  Colors.black,
                  0,
                  15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //icon
                  Image.asset(
                    ImageAssets.category_for_review,
                    width: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //select part
                  Text(
                    StringHelper.SelectPart,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 13.0,
                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isBack,
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0, bottom: 100),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 57,
              width: 58,
              child: FloatingActionButton(
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Image.asset(
                    ImageAssets.floatingBack,
                    height: 28,
                    width: 18,
                  ),
                ),
                onPressed: () {
                  print("FloatingActionButton");
                  isGrid = false;
                  isList = true;
                  isMore = true;
                  isBack = false;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      )
    ]);
  }

  void onCellItemClick(int index) async {
    print('Row $index');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    //12: number of item in event list
    //3: number of item display per page
    int division = 9 ~/ 3;
    int reminder = (9 % 3);
    int pageLenght = reminder == 0 ? division : division + 1;
    return SizedBox(
      // you may want to use an aspect ratio here for tablet support
      height: 339.0,
      child: PageView.builder(
        pageSnapping: true,
        itemCount: pageLenght,
        // store this controller in a State to save the carousel scroll position
        controller: PageController(
          viewportFraction: 0.79,
        ),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, itemIndex, reminder, division);
        },
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int index, int reminder, int division) {
    int itemIndex = index * 3;
    List<Widget> item = [];
    if (reminder != 0 && index == division) {
      if (reminder == 1) {
        item.add(
          EventDetailsView(
            index: itemIndex,
          ),
        );
      } else {
        item.add(
          EventDetailsView(
            index: itemIndex,
          ),
        );
        item.add(SizedBox(
          height: 23,
        ));
        item.add(
          EventDetailsView(
            index: itemIndex + 1,
          ),
        );
      }
    } else {
      item.add(
        EventDetailsView(
          index: itemIndex,
        ),
      );
      item.add(SizedBox(
        height: 23,
      ));
      item.add(
        EventDetailsView(
          index: itemIndex + 1,
        ),
      );
      item.add(SizedBox(
        height: 23,
      ));
      item.add(
        EventDetailsView(
          index: itemIndex + 2,
        ),
      );
    }
    return Container(
      transform: Matrix4.translationValues(-25.0, 0, 0),
      child: Column(
        children: item,
      ),
    );
  }

  Widget getCategoryListView(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        currentSelectedCategory = index;
        print(categoryList[index]);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          categoryList[index],
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: currentSelectedCategory == index
                ? ColorsHelper.pinkStarFillColor()
                : Colors.black87,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
