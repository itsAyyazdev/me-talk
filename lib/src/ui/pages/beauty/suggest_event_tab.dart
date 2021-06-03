import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_request/event_category_list_screen.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

import 'event_details_view.dart';
import 'event_list_screen.dart';
import 'recommended_list_view.dart';


class SuggestEventTab extends StatefulWidget {
  @override
  _SuggestEventTabState createState() => _SuggestEventTabState();
}

class _SuggestEventTabState extends State<SuggestEventTab> {
  final List<String> tagList = [
    'Nowadays popular events section',
    'Many review events section',
    'Most popular events section',
    'Recent post events section',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
//                height: MediaQuery.of(context).padding.top > 20 ?91:121,
                height: Platform.isIOS
                    ? MediaQuery.of(context).padding.top > 20 ? 91 : 121
                    : 108,
                color: Colors.white,
              ),
              Visibility(
                visible: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 45.0, left: 13.0, right: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            StringHelper.reCommanded,
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
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => EventListScreen(
//                                              isFromHomeTab: false,
//                                              eventCategory: '~',
//                                            )));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 193,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, left: 13.0, right: 13.0),
                        child: new ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            return RecommendedListView(index: index);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
//                  Visibility(
//                    visible: true,
//                    child: Padding(
//                      padding: const EdgeInsets.only(top: 50),
//                      child: SizedBox(
//                        height: 345,
//                        child: SectionTableView(
//                          sectionCount: tagList.length,
//                          numOfRowInSection: (section) {
//                            return 1;
//                          },
//                          cellAtIndexPath: (section, row) {
//                            return InkWell(
//                                onTap: () {
//                                  onCellItemClick(section, row);
//                                },
//                                child: getCategoryCellView(context, section, row));
//                          },
//                          headerInSection: (section) {
//                            return InkWell(
//                                onTap: () {
//                                  onHeaderItemClick(section);
//                                },
//                                child: getCategoryHeaderView(context, section));
//                          },
//                        ),
//                      ),
//                    ),
//                  ),
              Visibility(
                visible: true,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 0),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tagList.length,
                  shrinkWrap: true,
                  //physics: ScrollPhysics(),
                  itemBuilder: getCategoryHeaderView,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 143.0),
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
        ],
      ),
    );
  }

  Widget getCategoryHeaderView(BuildContext context, int section) {
    return Column(
      children: <Widget>[
//        Divider(
//          color: Colors.black26,
//          height: 0.7,
//        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 25, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                tagList[section],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
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
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        getCategoryCellView(context, section)
//        ListView.builder(
//          shrinkWrap: true,
//          itemCount: 1,
//          physics: NeverScrollableScrollPhysics(),
//          padding: EdgeInsets.only(bottom:25),
//          itemBuilder: (BuildContext context, int index) {
//            if (index % 2 == 0) {
//              return _buildCarousel(context, index ~/ 2);
//            } else {
//              return Container(
//                color: Colors.black,
//              );
//            }
//          },
//        ),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    //12: number of item in event list
    //3: number of item display per page
    int division = 9 ~/ 3;
    int reminder = (9 % 3);
    int pageLenght = reminder == 0 ? division : division + 1;
    return SizedBox(
      // you may want to use an aspect ratio here for tablet support
      height: 345.0,
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
          height: 10,
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
        height: 10,
      ));
      item.add(
        EventDetailsView(
          index: itemIndex + 1,
        ),
      );
      item.add(SizedBox(
        height: 10,
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

  Widget getCategoryCellView(BuildContext context, int section) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 330,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: new GridView.builder(
//              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.37),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 20.0, bottom: 20),
                    child: EventDetailsView(
                      index: index,
                    ));
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  void onHeaderItemClick(int section) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventListScreen(
                  isFromHomeTab: false,
                  eventCategory: tagList[section],
                )));
  }

  void onCellItemClick(int section, int row) async {
    print('Header $section  Row $row');
  }


}
