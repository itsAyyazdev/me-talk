import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_profile/hospital_profile/hospital_detail_page.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

import 'event_review_list_view.dart';

class EventDetailScreen extends StatefulWidget {
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  List<String> eventDetail = [
    ImageAssets.event_detail_1,
    ImageAssets.event_detail_2,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        elevation: 0,
//        title: Text(
//          'HOSPITAL NAME',
//          textAlign: TextAlign.center,
//          style: TextStyle(
//            color: Colors.black,
//            fontSize: 15.0,
//            //fontFamily: FontsHelper.fonts_HyGothic_regular
//          ),
//        ),
//        leading: IconButton(
//          padding: const EdgeInsets.all(0),
//          icon: Image.asset(
//            ImageAssets.back_arrow,
//            width: 19.0,
//            height: 19.0,
//            fit: BoxFit.contain,
//          ),
//          onPressed: () {
//            Vibrate.feedback(FeedbackType.light);
//            Navigator.of(context).pop();
//          },
//        ),
//        actions: <Widget>[
//          InkWell(
//            child: Image.asset(
//              ImageAssets.share,
//              width: 27.0,
//              height: 27.0,
//              fit: BoxFit.contain,
//            ),
//            onTap: () {
//              Vibrate.feedback(FeedbackType.light);
//            },
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 10.0, right: 15.0),
//            child: InkWell(
//              child: Image.asset(
//                ImageAssets.notification,
//                width: 24.0,
//                height: 24.0,
//                fit: BoxFit.contain,
//              ),
//              onTap: () {
//                Vibrate.feedback(FeedbackType.light);
//              },
//            ),
//          ),
//        ],
//      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          top: false,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: 102,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.35),
                                        //spreadRadius: 0.5,
                                        blurRadius: 16,
                                        offset: Offset(3, 3))
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset(
                                    ImageAssets.beauty_event4,
                                    width: MediaQuery.of(context).size.width - 180,
                                    height:
                                        MediaQuery.of(context).size.width - 180 - 8,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 44, left: 20, right: 20, bottom: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HospitalDetailPage()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.16),
                                                  blurRadius: 6,
                                                  offset: Offset(0, 3))
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 17,
                                            child: Container(
                                              width: 34.0,
                                              height: 34.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        ImageAssets.hospital1)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'HOSPITAL NAME',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  shadows: [
                                                    Shadow(
                                                      offset: Offset(0.0, 3.0),
                                                      blurRadius: 6.0,
                                                      color: Colors.black
                                                          .withOpacity(0.16),
                                                    )
                                                  ],
                                                  fontSize: 15.0,
                                                  //fontFamily: FontsHelper.fonts_Poppins_Medium
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 2.0),
                                                child: Text(
                                                  'LOCATION, CITY',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    shadows: [
                                                      Shadow(
                                                        offset: Offset(0.0, 3.0),
                                                        blurRadius: 6.0,
                                                        color: Colors.black
                                                            .withOpacity(0.16),
                                                      )
                                                    ],
                                                    color: ColorsHelper
                                                        .grey71TextColor(),
                                                    fontSize: 11.0,
                                                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                      ImageAssets.arrow_right,
                                      width: 15.0,
                                      height: 15.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: ColorsHelper.grey71TextColor(),
                              height: 0,
                              thickness: 0.3,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                //color: Colors.black12,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    //mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Best surgery(Title)',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(0.0, 3.0),
                                                  blurRadius: 6.0,
                                                  color: Colors.black
                                                      .withOpacity(0.16),
                                                )
                                              ],
                                              fontSize: 20.0,
                                              //fontFamily: FontsHelper.fonts_Poppins_Medium
                                            ),
                                          ),
                                          tags(
                                              context: context,
                                              tags: 'nose,best,hashtag'),
                                          Text(
                                            '2019.07.25 ~ 2019.09.25',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(0.0, 3.0),
                                                  blurRadius: 6.0,
                                                  color: Colors.black
                                                      .withOpacity(0.16),
                                                )
                                              ],
                                              color: Colors.black,
                                              fontSize: 12.0,
                                              //fontFamily: FontsHelper.fonts_Poppins_Medium
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 51,
                                        width: 56,
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.asset(
                                                ImageAssets.heart_gray,
                                                width: 55,
                                                height: 55,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  '12',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    //fontFamily: FontsHelper.f
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.black26,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Image.asset(
                                                ImageAssets.down_arrow,
                                                width: 14,
                                                height: 14,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, right: 15),
                                                child: Text(
                                                  '49%',
                                                  style: TextStyle(
                                                    shadows: [
                                                      Shadow(
                                                        offset: Offset(0.0, 3.0),
                                                        blurRadius: 6.0,
                                                        color: Colors.black
                                                            .withOpacity(0.16),
                                                      )
                                                    ],
                                                    color: ColorsHelper
                                                        .pinkStarFillColor(),
                                                    fontSize: 15,
                                                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 65,
                                                height: 21,
//                                          color: Colors.red,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional.center,
                                                  children: <Widget>[
                                                    Text(
                                                      '2950 USD',
                                                      style: TextStyle(
                                                        shadows: [
                                                          Shadow(
                                                            offset:
                                                                Offset(0.0, 3.0),
                                                            blurRadius: 6.0,
                                                            color: Colors.black
                                                                .withOpacity(0.16),
                                                          )
                                                        ],
                                                        color: ColorsHelper
                                                            .grey71TextColor(),
                                                        fontSize: 12,
                                                        // fontFamily: FontsHelper.fonts_Poppins_Medium
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 8.0,
                                                                right: 8.0),
                                                        child: Divider(
                                                          color: ColorsHelper
                                                              .blackBgColor(),
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text(
                                              '1490 USD',
                                              maxLines: 5,
                                              style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(0.0, 3.0),
                                                    blurRadius: 6.0,
                                                    color: Colors.black
                                                        .withOpacity(0.16),
                                                  )
                                                ],
                                                color: Colors.black,
                                                fontSize: 17,
                                                //fontFamily: FontsHelper.fonts_Poppins_Medium
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Image.asset(
                                              ImageAssets.korean_icon,
                                              width: 44,
                                              height: 44,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  '9.5',
                                                  style: TextStyle(
                                                    shadows: [
                                                      Shadow(
                                                        offset: Offset(0.0, 3.0),
                                                        blurRadius: 6.0,
                                                        color: Colors.black
                                                            .withOpacity(0.16),
                                                      )
                                                    ],
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(top: 5),
                                                  child: WidgetHelper
                                                      .showStarRatingView(
                                                          rating: 5, size: 21),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Column(
                            children: <Widget>[
//                          Divider(
//                            color: ColorsHelper.greyTextColor(),
//                            //height: 1,
//                            thickness: 1,
//                          ),
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: ScrollPhysics(),
                                  itemBuilder: getImagesView,
                                  itemCount: eventDetail.length,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 20, left: 63, right: 63),
                                child: Text(
                                  StringHelper.str_costs_may_vary,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 6.0,
                                        color: Colors.black.withOpacity(0.16),
                                      )
                                    ],
                                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                                  ),
                                ),
                              ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 20,bottom: 10),
//                          child: Text(
//                            StringHelper.str_event_grade,
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 16,
//                                fontFamily: FontsHelper.fonts_medium),
//                          ),
//                        ),
                              Padding(
                                padding: const EdgeInsets.only(top: 21, bottom: 5),
                                child: Text(
                                  '9.5',
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 6.0,
                                        color: Colors.black.withOpacity(0.16),
                                      )
                                    ],
                                    color: Colors.black,
                                    fontSize: 30,
                                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                                  ),
                                ),
                              ),
                              WidgetHelper.showStarRatingView(rating: 5, size: 22),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 20,bottom: 15),
//                          child: Text(
//                            StringHelper.str_level_of_satisfaction,
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 16,
//                                fontFamily: FontsHelper.fonts_medium),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(bottom: 20),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            mainAxisSize: MainAxisSize.min,
//                            children: <Widget>[
//                              Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    StringHelper.str_call,
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 14,
//                                        fontFamily: FontsHelper.fonts_medium),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.only(top: 15,bottom: 15),
//                                    child: Text(
//                                      StringHelper.str_visit,
//                                      textAlign: TextAlign.left,
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 14,
//                                          fontFamily: FontsHelper.fonts_medium),
//                                    ),
//                                  ),
//                                  Text(
//                                    StringHelper.str_surgery,
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 14,
//                                        fontFamily: FontsHelper.fonts_medium),
//                                  ),
//                                ],
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(left: 15,right: 15),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      '9.5',
//                                      textAlign: TextAlign.left,
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 14,
//                                          fontFamily: FontsHelper.fonts_medium),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(top: 15,bottom: 15),
//                                      child: Text(
//                                        '9.7',
//                                        textAlign: TextAlign.left,
//                                        style: TextStyle(
//                                            color: Colors.black,
//                                            fontSize: 14,
//                                            fontFamily: FontsHelper.fonts_medium),
//                                      ),
//                                    ),
//                                    Text(
//                                      '9.5',
//                                      textAlign: TextAlign.left,
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 14,
//                                          fontFamily: FontsHelper.fonts_medium),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  WidgetHelper.showStarRatingView(rating: 5,size: 15),
//                                  Padding(
//                                    padding: const EdgeInsets.only(top: 15,bottom: 15),
//                                    child: WidgetHelper.showStarRatingView(rating: 5,size: 15),
//                                  ),
//                                  WidgetHelper.showStarRatingView(rating: 5,size: 15),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
                            ],
                          ),
                        ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20,top: 15,bottom: 10),
//                      child: Text(
//                        StringHelper.str_write_for_people,
//                        textAlign: TextAlign.left,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 14,
//                            fontFamily: FontsHelper.fonts_medium),
//                      ),
//                    ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Divider(
                            color: ColorsHelper.darkGrayColor(),
                            height: 0,
                            thickness: 0.1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 100.0),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: getReviewListView,
                            itemCount: 5,
                          ),
                        ),
//                    Padding(
//                      padding: const EdgeInsets.only(top:30,left: 10,right: 10,bottom: 120),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          InkWell(
//                            onTap: (){
//                              //_displayDialog();
//                            },
//                            child: Container(
//                              height: 70,
//                              //width: MediaQuery.of(context).size.width-100,
//                              decoration: BoxDecoration(
//                                color: Colors.white,
//                                border: Border.all(
//                                    color: ColorsHelper.pinkStarFillColor(),
//                                    width: 0.5
//                                ),
//                                borderRadius: BorderRadius.all(Radius.circular(5)),
//                                boxShadow:
//                                [
//                                  BoxShadow(
//                                      color: Colors.black.withOpacity(0.2),
//                                      spreadRadius: 0.5,
//                                      blurRadius: 4,
//                                      offset: Offset(0, 1))
//                                ],
//                              ),
//                              child: Center(
//                                child: Padding(
//                                  padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
//                                  child: Text(
//                                    StringHelper.str_see_all_reviews,
//                                    textAlign: TextAlign.center,
//                                    overflow: TextOverflow.ellipsis,
//                                    maxLines: 2,
//                                    style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 14.0
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 102.0),
                    child: Divider(
                      height: 0,
                      thickness: 0.5,
                      color: ColorsHelper.greyTextColor(),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: WidgetHelper.setBlurEffect(Container(
                           height: 101,
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
                                     Vibrate.feedback(FeedbackType.light);
                                     Navigator.of(context).pop();
                                   },
                                 ),
                                 Text(
                                   'HOSPITAL NAME',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 15.0,
                                     //fontFamily: FontsHelper.fonts_HyGothic_regular
                                   ),
                                 ),
                                 Row(
                                   mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[
                                     InkWell(
                                       child: Image.asset(
                                         ImageAssets.share,
                                         width: 27.0,
                                         height: 27.0,
                                         fit: BoxFit.contain,
                                       ),
                                       onTap: () {
                                         Vibrate.feedback(FeedbackType.light);
                                       },
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 10.0, right: 15.0),
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
                     ))),
                ],
              ),
              Container(
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
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 10, bottom: 10),
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static tags({BuildContext context, String tags}) {
    List<String> tagList = [];
    if (tags.isNotEmpty) {
      tagList = tags.split(",");
    }
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 25),
      child: Visibility(
          visible: tags.isNotEmpty,
          child: Container(
            //width: MediaQuery.of(context).size.width,
            height: 15,
            child: Wrap(
              runSpacing: 0,
              spacing: 2,
              children: tagList
                  .map(
                    (tags) => Text(
                      '#' + tags,
                      maxLines: 5,
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 6.0,
                            color: Colors.black.withOpacity(0.16),
                          )
                        ],
                        color: Colors.black,
                        fontSize: 10,
                        //fontFamily: FontsHelper.fonts_Poppins_Medium
                      ),
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }

  Widget getImagesView(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: index == 0 ? 625 : 435,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            eventDetail[index],
            fit: BoxFit.cover,
          ),
        ),
//        Divider(
//          color: ColorsHelper.greyTextColor(),
//          //height: 1,
//          thickness: 1,
//        )
      ],
    );
  }

  Widget getReviewListView(BuildContext context, int index) {
    return InkWell(onTap: () {}, child: EventReviewView());
  }
}
