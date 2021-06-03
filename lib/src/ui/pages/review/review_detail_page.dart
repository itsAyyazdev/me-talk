import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:me_talk/src/models/Imported/data/community_detail_data.dart';
import 'package:me_talk/src/models/Imported/data/userdata.dart';
import 'package:me_talk/src/models/Imported/response/community_detail_response.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/constants.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_profile_page.dart';
import 'package:me_talk/src/ui/pages/community/comment_list_view.dart';
import 'package:me_talk/src/ui/pages/community/more_option_alert.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/utility.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

import 'before_after_viewer.dart';

class ReviewDetailPage extends StatefulWidget {
  bool isHospital = false;

  ReviewDetailPage({
    Key key,
    this.isHospital,
  }) : super(key: key);

  @override
  _ReviewDetailPageState createState() => _ReviewDetailPageState();
}

class _ReviewDetailPageState extends State<ReviewDetailPage> {
  final ScrollController listScrollController = new ScrollController();
  bool isLogin = true;
  TextEditingController controller;
  CommunityDetailData communityDetailData;
  int roleId, commentIndexForReply;
  String commentOnPost;
  FocusNode myFocusNode;
  bool isReplyComment;
  bool isInfo;
  var arrShops = [];
  double cardWidth = 0.0;

  @override
  void initState() {
    isInfo = true;
    // TODO: implement initState
    super.initState();
    print("ReviewDetailPage=====${widget.isHospital}");
    arrShops = [
      'assets/images/Reviews/review-1.png',
      'assets/images/Reviews/review-2.png',
      'assets/images/Reviews/review-3.png',
      'assets/images/Reviews/review-4.png',
      'assets/images/Reviews/review-5.png',
      'assets/images/Reviews/review-6.png',
      'assets/images/Reviews/review-7.png',
      'assets/images/Reviews/review-8.png',
      'assets/images/Reviews/review-9.png',
      'assets/images/Reviews/review-10.png',
    ];
    controller = TextEditingController();
    myFocusNode = FocusNode();
    isReplyComment = false;
    new Future.delayed(const Duration(microseconds: 1), () {
      //getCommunityDetailsApi(context, widget.communityId);
    });
    //getRoleId();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isInfo = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    cardWidth = (MediaQuery.of(context).size.width - 25) / 2.065;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
//      appBar: AppBar(
//        backgroundColor: ColorsHelper.whiteColor(),
//        elevation: 0,
//        leading: IconButton(
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
//        centerTitle: true,
//        title: Container(
//          margin: const EdgeInsets.only(top: 7),
//          width: MediaQuery.of(context).size.height *
//              (Platform.isIOS ? 0.15 : 0.12),
//          height: MediaQuery.of(context).size.height *
//              (Platform.isIOS ? 0.11 : 0.10),
//          child: FlareActor(
//            'assets/logo_chactor.flr',
//            alignment: Alignment.center,
//            fit: BoxFit.cover,
//            animation: "Logo",
//            //controller: controls,
//          ),
//        ),
//        actions: <Widget>[
//          Container(
//            margin: EdgeInsets.only(right: 25),
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
        body: GestureDetector(
          onTap: (){
            print("cathceher");
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Stack(
                  //alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 103,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, top: 20),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  //communityDetailData==null?'':communityDetailData.categoryName,
                                  'Category',
                                  style: TextStyle(
                                    color: ColorsHelper.themeColor(),
                                    fontSize: 13,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 11, right: 10),
                                  child: Text(
                                    //communityDetailData==null?'':communityDetailData.subCategoryName,
                                    'subCategory',
                                    style: TextStyle(
                                      color: ColorsHelper.themeColor(),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
//                      Padding(
//                        padding: const EdgeInsets.only(left: 25, top: 10),
//                        child: Text(
//                          //communityDetailData==null?'':communityDetailData.title,
//                          'TItle',
//                          style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 20,
//                          ),
//                        ),
//                      ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 19, top: 20, right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 15.5,
                                      child: Container(
                                        width: 31.0,
                                        height: 31.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                ImageAssets.bg7,
                                              )
                                              //image: communityDetailData==null?AssetImage(ImageAssets.user_default):(communityDetailData.avatar==''||communityDetailData.avatar==null)?AssetImage(ImageAssets.user_default):NetworkImage(communityDetailData.avatar)
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            communityDetailData == null
                                                ? 'user name'
                                                : communityDetailData.userName,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0,
                                              //fontFamily: FontsHelper.fonts_bold
                                            ),
                                          ),
                                          Text(
                                            communityDetailData == null
                                                ? '2019.11.10'
                                                : communityDetailData.createdAt,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0,
                                              //fontFamily: FontsHelper.fonts_bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: isLogin,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: Image.asset(
                                      ImageAssets.more_icon,
                                      width: 23.0,
                                      height: 10.0,
                                      fit: BoxFit.contain,
                                    ),
                                    onPressed: () {
                                      displayDialog();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 15, top: 10),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Before",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        print("Before picture is tapped");
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BeforeAfterViewer(before: true,)));
                                      },
                                                                          child: Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        Colors.black.withOpacity(0.4),
                                                    blurRadius: 6,
                                                    offset: Offset(0, 3),
                                                    spreadRadius: 0.25)
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 12.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: Container(
                                                  color: Colors.black12,
                                                  child: Image.asset(
                                                    ImageAssets.bg7,
                                                    width: cardWidth,
                                                    height: cardWidth,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Container(
                                                color: Colors.black12,
                                                child: Image.asset(
                                                  ImageAssets.bg8,
                                                  width: cardWidth,
                                                  height: cardWidth,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Container(
                                                color: Colors.black12,
                                                child: Image.asset(
                                                  ImageAssets.bg9,
                                                  width: cardWidth,
                                                  height: cardWidth,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(10)),
                                            child: Container(
                                              color: Colors.black12,
                                              child: Image.asset(
                                                ImageAssets.beforeProfile,
                                                width: cardWidth,
                                                height: cardWidth,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "after",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                         print("After picture is tapped");
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BeforeAfterViewer(before: false,)));
                                     
                                      },
                                                                          child: Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        Colors.black.withOpacity(0.4),
                                                    blurRadius: 6,
                                                    offset: Offset(0, 3),
                                                    spreadRadius: 0.25)
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 12.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: Container(
                                                  color: Colors.black12,
                                                  child: Image.asset(
                                                    ImageAssets.bg11,
                                                    width: cardWidth,
                                                    height: cardWidth,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Container(
                                                color: Colors.black12,
                                                child: Image.asset(
                                                  ImageAssets.bg12,
                                                  width: cardWidth,
                                                  height: cardWidth,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Container(
                                                color: Colors.black12,
                                                child: Image.asset(
                                                  ImageAssets.bg13,
                                                  width: cardWidth,
                                                  height: cardWidth,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(10)),
                                            child: Container(
                                              color: Colors.black12,
                                              child: Image.asset(
                                                ImageAssets.afterProfile,
                                                width: cardWidth,
                                                height: cardWidth,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 47, right: 30, bottom: 15),
                            child: WidgetHelper.showStarRatingView(
                                rating: 5, size: 28),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30, right: 30, top: 5),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: TextStyle(
                                fontSize: 15,
                                //fontFamily: FontsHelper.fonts_Segoe_regular
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 95.0, left: 15.0, right: 15.0),
                              child: Stack(
                                children: <Widget>[
                                  Visibility(
                                    visible: !widget.isHospital,
                                    child: InkWell(
                                      onTap: (){
                                        
                                  print("shop name tapped");
                                      Vibrate.feedback(FeedbackType.light);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ShopProfilePage(review: true,beautyshop: false,)));
                                      },
                                      child: Container(
                                        height: 108,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: ColorsHelper.greyTextColor(),
                                                width: 0.05),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      Colors.black.withOpacity(0.16),
                                                  offset: Offset(3, 3),
                                                  blurRadius: 6)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 9.0,
                                                      top: 10.0,
                                                      bottom: 10),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        //color: Colors.black12,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(7),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black
                                                                  .withOpacity(0.16),
                                                              offset: Offset(0, 3),
                                                              blurRadius: 6)
                                                        ]),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(7)),
                                                      child: Image.asset(
                                                        ImageAssets.beauty_shop1,
                                                        width: 90,
                                                        height: 86,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 13.0, left: 12),
                                                  child: Text(
                                                    "Shop name",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 40.0, left: 20, right: 30),
                                                  child: Image.asset(
                                                    ImageAssets.arrow_right,
                                                    width: 12,
                                                    height: 19,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: widget.isHospital,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    ColorsHelper.grey71TextColor()
                                                        .withOpacity(0.16),
                                                offset: Offset(0, 3),
                                                blurRadius: 6)
                                          ]),
                                      child: Stack(
                                            children: <Widget>[
                                              Container(
                                                height: 165,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 6,
                                                      offset: Offset(3, 3),
                                                      color: ColorsHelper
                                                          .grey71TextColor()
                                                          .withOpacity(0.16),
                                                    )
                                                  ],
                                                  border: Border.all(
                                                      color: ColorsHelper
                                                          .greyTextColor(),
                                                      width: 0.05),
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 5, sigmaY: 5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              top: 38.0,
                                                              left: 11.0,
                                                              right: 30.0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                        15.5)),
                                                                child: Container(
                                                                  color:
                                                                  Colors.black12,
                                                                  child: Image.asset(
                                                                    ImageAssets
                                                                        .beauty_shop1,
                                                                    width: 31,
                                                                    height: 31,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 10),
                                                              Text(
                                                                "Hospital name",
                                                                style: TextStyle(
                                                                    fontSize: 13,
                                                                    color:
                                                                    Colors.black),
                                                              ),
                                                              Spacer(),
                                                              Image.asset(
                                                                ImageAssets
                                                                    .arrow_right,
                                                                width: 12,
                                                                height: 20,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                            top: 11.0,
                                                            left: 10.0,
                                                            right: 10.0,
                                                          ),
                                                          child: Text(
                                                            "DOCTOR : doctor name",
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                            top: 8.0,
                                                            left: 10.0,
                                                            right: 10.0,
                                                          ),
                                                          child: Text(
                                                            "surgical field names",
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: isInfo,
                                                child: ClipRect(
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                    child: Material(
                                                      color: Colors.white.withOpacity(0.1),
                                                      child: Container(
                                                        height: 165,
                                                        width: MediaQuery.of(context).size.width-40,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: isInfo,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 30.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Vibrate.feedback(
                                                          FeedbackType.light);
                                                      isInfo = false;
                                                      setState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: ColorsHelper.themeBlackColor(),
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .circular(
                                                                    10)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 6,
                                                                offset:
                                                                Offset(3, 3),
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                    0.16),
                                                              )
                                                            ],
                                                          ),
                                                          height: 30,
                                                          width: 143,
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 12.0,
                                                                top: 8),
                                                            child: Text(
                                                              "GET INFO",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color:
                                                                Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: !widget.isHospital
                                ? const EdgeInsets.only(
                                    left: 30, top: 10, right: 30, bottom: 15)
                                : const EdgeInsets.only(
                                    left: 30, top: 17, right: 30, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      StringHelper.str_like_caps,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorsHelper.greyTextColor(),
                                        fontSize: 13.0,
                                        //fontFamily: FontsHelper.fonts_Segoe_regular
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        communityDetailData == null
                                            ? '41'
                                            : communityDetailData.likesCount
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorsHelper.greyTextColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_Segoe_regular
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      StringHelper.str_comment_caps,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorsHelper.greyTextColor(),
                                        fontSize: 13.0,
                                        //fontFamily: FontsHelper.fonts_Segoe_regular
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        communityDetailData == null
                                            ? '6'
                                            : communityDetailData.commentsCount
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorsHelper.greyTextColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_Segoe_regular
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      StringHelper.str_view_caps,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorsHelper.greyTextColor(),
                                        fontSize: 13.0,
                                        //fontFamily: FontsHelper.fonts_Segoe_regular
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        communityDetailData == null
                                            ? '124'
                                            : communityDetailData.viewsCount
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorsHelper.greyTextColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_Segoe_regular
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
//                      Divider(
//                        color: Colors.black45,
//                        height: 0.5,
//                      ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Color(0xffECDBE2), width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: Image.asset(
                                      communityDetailData == null
                                          ? ImageAssets.like_unsel
                                          : communityDetailData.userIsLike == 1
                                              ? ImageAssets.like_sel
                                              : ImageAssets.like_unsel,
                                      width: 22.0,
                                      height: 20.0,
                                      color: communityDetailData == null
                                          ? ColorsHelper.themeBlackColor()
                                          : communityDetailData.userIsLike == 1
                                              ? ColorsHelper.themeColor()
                                              : ColorsHelper.themeBlackColor(),
                                      fit: BoxFit.contain,
                                    ),
                                    onPressed: () {
//                                  if (widget.isLogin) {
//                                    //likeOnPostApi();
//                                  }
                                    },
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: Image.asset(
                                      ImageAssets.comment_review,
                                      width: 20.0,
                                      height: 19.0,
                                      color: ColorsHelper.themeBlackColor(),
                                      fit: BoxFit.contain,
                                    ),
                                    onPressed: () {
                                      if (isReplyComment) {
                                        isReplyComment = false;
                                        setState(() {});
                                      }
                                      FocusScope.of(context)
                                          .requestFocus(myFocusNode);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
//                      Divider(
//                        color: Colors.black45,
//                        height: 0.5,
//                      ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 46.0, left: 17, bottom: 10),
                            child: Text(
                              "RELATED POPULAR REVIEWS",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 6, right: 8),
                            child: Container(
                              height: 77,
                              child: ListView.builder(
                                controller: listScrollController,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: arrShops.length,
                                itemBuilder: (BuildContext context, int index) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 7.0),
                                    child: ClipRRect(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        arrShops[index],
                                        fit: BoxFit.fill,
                                        height: 77,
                                        width: 80,
                                      ),
                                    ),
                                  ),
//                          child: ClipRRect(
//                            borderRadius:
//                                new BorderRadius.all(new Radius.circular(6.0)),
//                            child: Material(
//                              child: ExtendedImage.network(
//                                "http://via.placeholder.com/350x150",
////                                widget.beautyData.recentPhoto[index].imageUrl !=
////                                        null
////                                    ? widget
////                                        .beautyData.recentPhoto[index].imageUrl
////                                    : StringHelper.default_Avatar,
//                                width: 62,
//                                height: MediaQuery.of(context).size.width * .15,
//                                fit: BoxFit.cover,
//                                cache: true,
//                                enableLoadState: true,
//                                //cancelToken: cancellationToken,
//                              ),
//
//                              //  cacheManager: CustomCacheManager(),
//                              // placeholder: (context, h) => Image.asset(
//                              //     ImageAssets.laodingg,
//                              //  ),
//
//                              clipBehavior: Clip.antiAlias,
//                            ),
//                          ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 28),
                          Divider(
                            color: ColorsHelper.greyTextColor(),
                            height: 0,
                            thickness: 0.1,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: ScrollPhysics(),
                            itemBuilder: getCommentListView,
                            itemCount: communityDetailData == null
                                ? 10
                                : communityDetailData.comments.length,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: WidgetHelper.setBlurEffect(Container(
                          height: 103,
                          child: Padding(
                            padding: const EdgeInsets.only(top:44),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset(
                                    ImageAssets.back_arrow,
                                    width: 20.0,
                                    height: 20.0,
                                    fit: BoxFit.contain,
                                  ),
                                  onPressed: () {
                                    Vibrate.feedback(FeedbackType.light);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  width: MediaQuery.of(context).size.height *
                                      (Platform.isIOS ? 0.15 : 0.12),
                                  height: MediaQuery.of(context).size.height *
                                      (Platform.isIOS ? 0.11 : 0.10),
                                  child: FlareActor(
                                    'assets/logo_chactor.flr',
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                    animation: "Logo",
                                    //controller: controls,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 25),
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
                            ),
                          ),
                        ))

//                    ClipRect(
//                      child: BackdropFilter(
//                        filter:ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                        child: Material(
//                          color:Colors.white.withOpacity(0.8),
//                          child: Container(
//                            height: 103,
//                            child: Padding(
//                              padding:  EdgeInsets.only(top: 44),
//                              child: Row(
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                //mainAxisSize: MainAxisSize.min,
//                                children: <Widget>[
//                                  IconButton(
//                                    icon: Image.asset(
//                                      ImageAssets.back_arrow,
//                                      width: 20.0,
//                                      height: 20.0,
//                                      fit: BoxFit.contain,
//                                    ),
//                                    onPressed: () {
//                                      Vibrate.feedback(FeedbackType.light);
//                                      Navigator.of(context).pop();
//                                    },
//                                  ),
//                                  Container(
//                                    margin: const EdgeInsets.only(top: 7),
//                                    width: MediaQuery.of(context).size.height *
//                                        (Platform.isIOS ? 0.15 : 0.12),
//                                    height: MediaQuery.of(context).size.height *
//                                        (Platform.isIOS ? 0.11 : 0.10),
//                                    child: FlareActor(
//                                      'assets/logo_chactor.flr',
//                                      alignment: Alignment.center,
//                                      fit: BoxFit.cover,
//                                      animation: "Logo",
//                                      //controller: controls,
//                                    ),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(right: 25),
//                                    child: InkWell(
//                                      child: Image.asset(
//                                        ImageAssets.notification,
//                                        width: 24.0,
//                                        height: 24.0,
//                                        fit: BoxFit.contain,
//                                      ),
//                                      onTap: () {
//                                        Vibrate.feedback(FeedbackType.light);
//                                      },
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:103.0),
                      child: Divider(
                        height: 0.5,
                        color: ColorsHelper.greyTextColor(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: WidgetHelper.setBlurEffect(Container(
                      decoration:BoxDecoration(
                          border: Border(
                            top: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
                            right: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
                            left: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
                          )
                      ),
                      height: 66,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10,top: 0),
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  textAlignVertical: TextAlignVertical.top,
                                  controller: controller,
                                  focusNode: myFocusNode,
                                  cursorColor: ColorsHelper.grey71TextColor(),
                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  style: TextStyle(
                                    color: ColorsHelper.grey71TextColor(),
                                    fontSize: 12.0,
                                    //ontFamily: FontsHelper.fonts_medium
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: isReplyComment
                                        ? StringHelper.reply_on_the_comment
                                        : StringHelper.comment_on_the_post,
                                    contentPadding: EdgeInsets.only(bottom: 16),
                                  ),
                                  onSubmitted: (String comment) {
                                    commentOnPost = comment;
                                    if (isReplyComment) {
                                      isReplyComment = false;
                                      setState(() {});
                                    }
                                  },
                                  onChanged: (String comment) {
                                    commentOnPost = comment;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: InkWell(
                                onTap: () {
                                  if (commentOnPost != null ||
                                      commentOnPost.length != 0) {
                                    if (isReplyComment) {
                                      //replyOnCommentApi();
                                    } else {
                                      //commentOnPostApi();
                                    }
                                  }
                                },
                                child: Text(
                                  isReplyComment
                                      ? StringHelper.reply_caps
                                      : StringHelper.publish,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                    ColorsHelper.themeBlackColor(), //353A50
                                    fontSize: 12.0,
                                    //fontFamily: FontsHelper.fonts_medium
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
//                ClipRect(
//                  child: BackdropFilter(
//                    filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
//                    child: Material(
//                      color: Colors.white.withOpacity(0.8),
//                      child: Container(
//                        decoration:BoxDecoration(
//                            border: Border(
//                                top: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
//                              right: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
//                              left: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
//                            )
//                        ),
//                        height: 66,
//                        child: Padding(
//                          padding:
//                              const EdgeInsets.only(left: 20, right: 20),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Flexible(
//                                child: Padding(
//                                  padding: const EdgeInsets.only(right: 10,top: 0),
//                                  child: TextField(
//                                    textInputAction: TextInputAction.done,
//                                    textAlignVertical: TextAlignVertical.top,
//                                    controller: controller,
//                                    focusNode: myFocusNode,
//                                    cursorColor: ColorsHelper.grey71TextColor(),
//                                    textCapitalization:
//                                        TextCapitalization.sentences,
//                                    style: TextStyle(
//                                        color: ColorsHelper.grey71TextColor(),
//                                        fontSize: 12.0,
//                                        //ontFamily: FontsHelper.fonts_medium
//                                    ),
//                                    decoration: InputDecoration(
//                                      border: InputBorder.none,
//                                      hintText: isReplyComment
//                                          ? StringHelper.reply_on_the_comment
//                                          : StringHelper.comment_on_the_post,
//                                      contentPadding: EdgeInsets.only(bottom: 16),
//                                    ),
//                                    onSubmitted: (String comment) {
//                                      commentOnPost = comment;
//                                      if (isReplyComment) {
//                                        isReplyComment = false;
//                                        setState(() {});
//                                      }
//                                    },
//                                    onChanged: (String comment) {
//                                      commentOnPost = comment;
//                                    },
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(top: 11),
//                                child: InkWell(
//                                  onTap: () {
//                                    if (commentOnPost != null ||
//                                        commentOnPost.length != 0) {
//                                      if (isReplyComment) {
//                                        //replyOnCommentApi();
//                                      } else {
//                                        //commentOnPostApi();
//                                      }
//                                    }
//                                  },
//                                  child: Text(
//                                    isReplyComment
//                                        ? StringHelper.reply_caps
//                                        : StringHelper.publish,
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                        color:
//                                            ColorsHelper.themeBlackColor(), //353A50
//                                        fontSize: 12.0,
//                                        //fontFamily: FontsHelper.fonts_medium
//                                    ),
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCommentListView(BuildContext context, int index) {
    return InkWell(
        onTap: () {},
        child: CommentListView(
          //commentsData: communityDetailData.comments[index],
          index: index,
          //postId: communityDetailData.id,
          //roleId: roleId,
          isLogin: isLogin,
          btnLikeClicked: () {
            //likeOnCommentApi(communityDetailData.comments[index]);
          },
          btnCommentClicked: () {
            isReplyComment = true;
            setState(() {});
            commentIndexForReply = index;
            FocusScope.of(context).requestFocus(myFocusNode);
          },
        ));
  }

  displayDialog() {
    showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return MoreOptionsAlertView(
            communityDetailData: communityDetailData,
            roleId: roleId,
          );
        });
  }

  void getCommunityDetailsApi(BuildContext context, int communityID) async {
    //http://belletalk.concetto-project-progress.com/api/auth/community/detail?community_id=2

    String apiUrl;
    bool isLogin =
        await SharePreferencesHelper().getBool(SharePreferencesHelper.Is_Login);

    if (isLogin) {
      apiUrl = 'auth/community/detail?community_id=$communityID';
    } else {
      apiUrl = 'community/detail?community_id=$communityID';
    }

    WidgetHelper.progressBarShow(context: context, isDismissible: true);
    var request = new http.MultipartRequest(
        "GET", Uri.parse('${Constants.baseUri}$apiUrl'));
    Map<String, String> header = {};
    final String autoToken = await SharePreferencesHelper()
        .getAccessToken(SharePreferencesHelper.Access_Token);

    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/vnd.belletalk.v1+json';
    if (isLogin) {
      header['Authorization'] = 'Bearer $autoToken';
    }
//    Map<String, String> headers = {
//      "Accept": "application/vnd.belletalk.v1+json",
//      "Content-Type": "application/x-www-form-urlencoded"
//    };
    request.headers.addAll(header);
    http.Response response =
        await http.Response.fromStream(await request.send());
    Navigator.of(context).pop();
    final Map parsed = json.decode(response.body);
    final responseCommunity = CommunityDetailResponse.fromJson(parsed);
    if (response.statusCode == 200) {
      communityDetailData = responseCommunity.data;
      setState(() {});
    } else if (response.statusCode == 401) {
      Utility.showAlertDialogCallBack(
          context: context,
          message: responseCommunity.message,
          isConfirmationDialog: true,
          onOkClick: () {
            Utility.gotoLoginScreen(context);
          });
    } else {
      Utility.showAlertDialogCallBack(
          context: context, message: responseCommunity.message);
    }
  }

  getRoleId() async {
    String data = await SharePreferencesHelper()
        .getString(SharePreferencesHelper.User_Data);
    UserData userData = UserData.fromJson(jsonDecode(data));
    setState(() {
      roleId = userData.user.roles[0].roleId;
    });
  }

//  void commentOnPostApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .commentOnPostRequest(context,communityDetailData.id.toString(),'3',roleId,commentOnPost);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//      commentOnPost = null;
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void replyOnCommentApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .replyOnCommentRequest(context,communityDetailData.comments[commentIndexForReply].id,roleId,commentOnPost);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//      commentOnPost = null;
//      isReplyComment = false;
//      setState(() {});
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void likeOnPostApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .likeOnPostRequest(context,communityDetailData.id.toString(),'3',roleId,communityDetailData.userIsLike==1?0:1);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void likeOnCommentApi(CommunityCommentsData commentsData) async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .likeOnCommentRequest(context,commentsData.id,roleId,commentsData.userCommentLike==1?0:1);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

}
