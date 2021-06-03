import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:me_talk/src/res/colors.dart';

import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/home_page/city_selection_screen.dart';
import 'package:me_talk/src/ui/pages/home_page/event_details_view.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

import 'event_detail_screen.dart';
import 'event_list_screen.dart';
import 'recommended_list_view.dart';
import 'select_part_event_screen.dart';

class AllEventPage extends StatefulWidget {
  @override
  _AllEventPageState createState() => _AllEventPageState();
}

class _AllEventPageState extends State<AllEventPage> {
  List<String> tagList = [
    'Nowadays popular events section',
    'Many reviews events section',
    'Most popular events section',
    'Recent events section',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: WidgetHelper.customBoxDecorationWithShadow(
                    ColorsHelper.blackBGColor(),
                    Colors.white,
                    Colors.black,
                    0,
                    0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectPartScreen()));
                        },
                        child: Container(
                          decoration:
                              WidgetHelper.customBoxDecorationWithShadow(
                                  ColorsHelper.themeBlackColor(),
                                  Colors.white,
                                  Colors.black,
                                  0,
                                  15),
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          height: 31,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 5, bottom: 5),
                              child: Text(
                                StringHelper.SelectPart,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    //fontFamily: FontsHelper.fonts_HyGothic_regular
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => CitySelectionScreen(
                                    isFromReviewList: false,
                                  )));
                        },
                        child: Container(
                          decoration:
                              WidgetHelper.customBoxDecorationWithShadow(
                                  Colors.white,
                                  ColorsHelper.themeBlackColor(),
                                  Colors.black,
                                  0.5,
                                  15),
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          height: 31,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 5, bottom: 5),
                              child: Text(
                                StringHelper.SelectCity,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: ColorsHelper.themeBlackColor(),
                                    fontSize: 13.0,
                                    //fontFamily: FontsHelper.fonts_HyGothic_regular
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView(
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
                                    //fontFamily: FontsHelper.fonts_HyGothic_regular
                                ),
                              ),
                              InkWell(
                                child: Image.asset(
                                  ImageAssets.arrow_right,
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.contain,
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EventListScreen(
                                                isFromHomeTab: false,
                                                eventCategory: '~',
                                              )));
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 230,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 15.0, right: 15.0),
                            child: new ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 9,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      onRecommendedItemClick(index);
                                    },
                                   // child: RecommendedListView()
                                    );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SectionTableView(
                        sectionCount: tagList.length,
                        numOfRowInSection: (section) {
                          return 1;
                        },
                        cellAtIndexPath: (section, row) {
                          return getCategoryCellView(context, section, row);
                        },
                        headerInSection: (section) {
                          return InkWell(
                              onTap: () {
                                onHeaderItemClick(section);
                              },
                              child: getCategoryHeaderView(context, section));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getCategoryHeaderView(BuildContext context, int section) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                tagList[section],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    //fontFamily: FontsHelper.fonts_HyGothic_regular
                ),
              ),
              InkWell(
                child: Image.asset(
                  ImageAssets.arrow_right,
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getCategoryCellView(BuildContext context, int section, int row) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 345,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: new GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.38),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    onCellItemClick(section, index);
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 10, bottom: 10),
                      child: EventDetailsView()),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  void onHeaderItemClick(int section) async {
    print('Header $section');
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }

  void onRecommendedItemClick(int index) {
    print('Row $index');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }
}
