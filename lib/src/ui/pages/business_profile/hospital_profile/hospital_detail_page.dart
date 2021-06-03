import 'dart:io';

import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/silver_header_delegate.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

import 'hospital_doctor_tab.dart';
import 'hospital_event_tab.dart';
import 'hospital_info_tab.dart';
import 'hospital_review_tab.dart';

class HospitalDetailPage extends StatefulWidget {
  @override
  _HospitalDetailPageState createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage>
    with SingleTickerProviderStateMixin<HospitalDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: Platform.isIOS
                                ? MediaQuery.of(context).padding.top > 20 ? EdgeInsets.only(top: 50):EdgeInsets.only(top: 80):EdgeInsets.only(top: 60),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(top: 5, bottom: 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.16),
                                            //spreadRadius: 0.5,
                                            blurRadius: 30,
                                            offset: Offset(3, 3))
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      child: Image.asset(
                                        ImageAssets.hospital1,
                                        width: MediaQuery.of(context).size.width - 154,
                                        height: MediaQuery.of(context).size.width - 154-17,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Hospital Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                //fontFamily: FontsHelper.fonts_semibold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Location, City',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 11.0,
                                //fontFamily: FontsHelper.fonts_regular
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 4,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 48,left: 10,right: 10),
                            child: Container(
                              height: 30,
                              child: TabBar(
                                indicatorColor: ColorsHelper.themeBlackColor(),
                                //isScrollable: true,
                                //indicatorWeight: 2,
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(width: 2.0),
                                    insets: EdgeInsets.symmetric(horizontal: 20.0)),
                                unselectedLabelColor: Colors.black,
                                unselectedLabelStyle: TextStyle(
                                  color: ColorsHelper.darkBlackColor(),
                                  fontSize: 11.0,
                                  //fontFamily: FontsHelper.fonts_regular
                                ),
                                labelColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: ColorsHelper.darkBlackColor(),
                                  fontSize: 11.0,
                                  //fontFamily: FontsHelper.fonts_regular
                                ),
                                tabs: [
                                  Tab(
                                    text: StringHelper.info_title,
                                  ),
                                  Tab(
                                    text: StringHelper.event_title,
                                  ),
                                  Tab(
                                    text: StringHelper.review_tab,
                                  ),
                                  Tab(
                                    text: StringHelper.doctor_title,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1000,
                            child: TabBarView(
                              children: [
                                HospitalInfoTab(),
                                HospitalEventTab(),
                                HospitalReviewTab(isShopReview: false,),
                                //HospitalGradeTab(),
                                HospitalDoctorTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
//                  NestedScrollView(
//                    headerSliverBuilder:
//                        (BuildContext context, bool innerBoxIsScrolled) {
//                      return <Widget>[
//                        SliverAppBar(
//                          expandedHeight: 395.0,
//                          elevation: 0,
//                          floating: false,
//                          pinned: true,
//                          leading: IconButton(
//                            padding: const EdgeInsets.all(0),
//                            icon: Image.asset(
//                              ImageAssets.back_arrow,
//                              width: 19.0,
//                              height: 19.0,
//                              fit: BoxFit.contain,
//                            ),
//                            onPressed: () {
//                              Vibrate.feedback(FeedbackType.light);
//                              Navigator.of(context).pop();
//                            },
//                          ),
//                          actions: <Widget>[
//                            Row(
//                              children: <Widget>[
//                                InkWell(
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                      boxShadow: [
//                                        BoxShadow(
//                                            color: Colors.black.withOpacity(0.16),
//                                            blurRadius: 6,
//                                            offset: Offset(0, 3))
//                                      ],
//                                      borderRadius: BorderRadius.all(
//                                        Radius.circular(10),
//                                      ),
//                                      border: Border.all(color: ColorsHelper.blackBgColor(),width: 1),
//                                      color: Colors.white,
//                                    ),
//                                    height: 27,
//                                    width:77,
//                                    child: Center(
//                                      child: Text(
//                                        StringHelper.report,
//                                        textAlign: TextAlign.center,
//                                        overflow: TextOverflow.ellipsis,
//                                        maxLines: 1,
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 15.0,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                  onTap: () {
//                                    Vibrate.feedback(FeedbackType.light);
//                                  },
//                                ),
//                              ],
//                              mainAxisSize: MainAxisSize.min,
//                            ),
//                            Padding(
//                              padding:
//                                  const EdgeInsets.only(left: 10.0, right: 25.0),
//                              child: InkWell(
//                                child: Image.asset(
//                                  ImageAssets.notification,
//                                  width: 24.0,
//                                  height: 24.0,
//                                  fit: BoxFit.contain,
//                                ),
//                                onTap: () {
//                                  Vibrate.feedback(FeedbackType.light);
//                                },
//                              ),
//                            ),
//                          ],
//                          flexibleSpace: FlexibleSpaceBar(
//                            centerTitle: true,
//                            background: Column(
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.only(top: 50),
//                                  child: SizedBox(
//                                    width: MediaQuery.of(context).size.width,
//                                    child: Center(
//                                      child: Padding(
//                                        padding:
//                                            EdgeInsets.only(top: 5, bottom: 30),
//                                        child: Container(
//                                          decoration: BoxDecoration(
//                                            boxShadow: [
//                                              BoxShadow(
//                                                  color: Colors.black.withOpacity(0.16),
//                                                  //spreadRadius: 0.5,
//                                                  blurRadius: 30,
//                                                  offset: Offset(3, 3))
//                                            ],
//                                          ),
//                                          child: ClipRRect(
//                                            borderRadius: BorderRadius.all(
//                                                Radius.circular(10)),
//                                            child: Image.asset(
//                                              ImageAssets.hospital1,
//                                              width: MediaQuery.of(context).size.width - 154,
//                                              height: MediaQuery.of(context).size.width - 154-17,
//                                              fit: BoxFit.cover,
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.only(top: 20),
//                                  child: Text(
//                                    'Hospital Name',
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 16.0,
//                                      //fontFamily: FontsHelper.fonts_semibold
//                                    ),
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.only(top: 5),
//                                  child: Text(
//                                    'Location, City',
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                      color: Colors.black54,
//                                      fontSize: 11.0,
//                                      //fontFamily: FontsHelper.fonts_regular
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                        SliverPersistentHeader(
//                          delegate: SliverAppBarDelegate(
//                            TabBar(
//                              indicatorColor: ColorsHelper.themeBlackColor(),
//                              //isScrollable: true,
//                              //indicatorWeight: 2,
//                              indicator: UnderlineTabIndicator(
//                                  borderSide: BorderSide(width: 2.0),
//                                  insets: EdgeInsets.symmetric(horizontal: 25.0)),
//                              unselectedLabelColor: Colors.black,
//                              unselectedLabelStyle: TextStyle(
//                                color: ColorsHelper.darkBlackColor(),
//                                fontSize: 11.0,
//                                //fontFamily: FontsHelper.fonts_regular
//                              ),
//                              labelColor: Colors.black,
//                              labelStyle: TextStyle(
//                                color: ColorsHelper.darkBlackColor(),
//                                fontSize: 11.0,
//                                //fontFamily: FontsHelper.fonts_regular
//                              ),
//                              tabs: [
//                                Tab(
//                                  text: StringHelper.info_title,
//                                ),
//                                Tab(
//                                  text: StringHelper.event_title,
//                                ),
//                                Tab(
//                                  text: StringHelper.review_tab,
//                                ),
//                                Tab(
//                                  text: StringHelper.doctor_title,
//                                ),
//                              ],
//                            ),
//                            15,
//                          ),
//                          pinned: true,
//                        ),
//                      ];
//                    },
//                    body: TabBarView(
//                      children: [
//                        HospitalInfoTab(),
//                        HospitalEventTab(),
//                        HospitalReviewTab(isShopReview: false,),
//                        //HospitalGradeTab(),
//                        HospitalDoctorTab(),
//                      ],
//                    ),
//                  ),
                    ),
                  ],
                ),
                Container(
                  height: 98,
                  color: Colors.white,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 44),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Image.asset(
                            ImageAssets.back_arrow,
                            width: 19.0,
                            height: 19.0,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.16),
                                        blurRadius: 6,
                                        offset: Offset(0, 3))
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(color: ColorsHelper.blackBgColor(),width: 1),
                                  color: Colors.white,
                                ),
                                height: 27,
                                width:77,
                                child: Center(
                                  child: Text(
                                    StringHelper.report,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: ColorsHelper.blackBgColor(),
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 25.0),
                              child: InkWell(
                                child: Image.asset(
                                  ImageAssets.notification,
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                                onTap: () {
                                  Vibrate.feedback(FeedbackType.light);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    //color: Colors.black.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 25, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
//                      InkWell(
//                        onTap: (){
//
//                        },
//                        child: Container(
//                          decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white, ColorsHelper.themeBlackColor(), Colors.black, 0.5, 5),
//                          width: MediaQuery.of(context).size.width/2-40,
//                          height: 45,
//                          child: Center(
//                            child: Padding(
//                              padding: const EdgeInsets.only(left: 8,right: 8,top: 10,bottom:10),
//                              child: Text(
//                                StringHelper.str_call,
//                                textAlign: TextAlign.center,
//                                overflow: TextOverflow.ellipsis,
//                                maxLines: 1,
//                                style: TextStyle(
//                                    color: Colors.black,
//                                    fontSize: 14.0,
//                                  fontFamily: FontsHelper.fonts_medium
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: ColorsHelper.themeBlackColor(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.72),
                                      blurRadius: 6,
                                      offset: Offset(3, 3),
                                    )
                                  ]),
                              width: MediaQuery.of(context).size.width - 30,
                              height: 46,
                              //color: ColorsHelper.themeBlackColor(),
                              child: Center(
                                child: Text(
                                  StringHelper.request_to_ask,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
