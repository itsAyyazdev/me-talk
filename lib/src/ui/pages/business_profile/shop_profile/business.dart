import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/data/repository/request_form_repository.dart';
import 'package:me_talk/src/models/businessDetailbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/custome_screen.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/followers.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/regularPayment.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/requestCredit.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/select_date_user.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/popup_dialogs/activate_history_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/add_business_category_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/post_business_popup.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibrate/vibrate.dart';

import '../revenue_management.dart';

class Business extends StatefulWidget {
  final BusinessDetailData businessDetailData;

  Business({Key key, this.businessDetailData}) : super(key: key);

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  var image1 = "assets/images/credit.png";
  var image2 = "assets/images/profile.png";
  var image3 = "assets/images/customer.png";
  var image4 = "assets/images/schedule.png";
  List<String> images = [
    ImageAssets.ero1,
    ImageAssets.ero2,
    ImageAssets.ero3,
    ImageAssets.ero4,
    ImageAssets.ero5,
  ];
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  final PageController pageController = new PageController();
  var text2 = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: FontsHelper.fonts_Gibson_Regular);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColor(),
        child: SafeArea(
          left: false,
          right: false,
          top: false,
          bottom: true,
          child: Scaffold(
            backgroundColor: Color(0xffE6E6E6),
            appBar: AppBar(
              backgroundColor: ColorsHelper.whiteColor(),
              elevation: 0,
              leading: IconButton(
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
              centerTitle: true,
              title: Container(
                //  margin: const EdgeInsets.only(top: 45, bottom: 15),
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
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: InkWell(
                    child: Image(
                      height: 25,
                      width: 25,
                      image: AssetImage("assets/images/belln.png"),
                      color: ColorsHelper.themeBlackColor(),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: <Widget>[
                  _page(),
                  SizedBox(height: 10),
                  _pageName(),
                  _buttonRegular(),
                  _rowRecommend(),
                  _activate(),
                  SizedBox(
                    height: 15,
                  ),
                  _credit(),
                  _postButton(),
                  SizedBox(
                    height: 15,
                  ),
                  _grid(),
                  _more(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: 10, right: 10, bottom: 20, top: 20),
                    child: InkWell(
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        AppNavigator.launchContactManager(context);
                      },
                      child: Text(
                        StringHelper.contact_to_manager,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _page() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _rContaienr(1),
          _line(1),
          _rContaienr(2),
          _line(2),
          _rContaienr(3),
          _line(3),
          _rContaienr(4)
        ],
      ),
    );
  }

  Widget _pageName() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 2, child: _name("Bronze")),
          Expanded(child: _line(4)),
          Expanded(flex: 2, child: _name("Silver")),
          Expanded(child: _line(5)),
          Expanded(flex: 2, child: _name("Gold")),
          Expanded(child: _line(5)),
          Expanded(flex: 3, child: _name("Platinum")),
        ],
      ),
    );
  }

  Widget _name(String text) {
    return Container(
      // width: MediaQuery.of(context).size.width * .13,
      child: Text("$text"),
    );
  }

  Widget _rContaienr(int id) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(id == 4
                ? "assets/images/rcont2.png"
                : "assets/images/rcont.png")),
      ),
      child: Center(
        child: Text(
          "$id",
          style: TextStyle(
              fontSize: 16, color: id == 4 ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  Widget _rowRecommend() {
    return Container(
      // height: MediaQuery.of(context).size.height * .1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: Stack(
              children: <Widget>[
                //you_will_get_text
                Container(
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 18),
                  height: 55,
                  decoration: BoxDecoration(
                      color: ColorsHelper.whiteColor(),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    StringHelper.you_will_get_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsHelper.grayColor(),
                        fontSize: 10,
                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                  ),
                ),
                //Recoment code
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  width: double.infinity,
                  child: Text(
                    "${StringHelper.recoment_code} 1115747",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsHelper.whiteColor(),
                        fontSize: 14,
                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                  ),
                  decoration: BoxDecoration(
                      color: ColorsHelper.darkBlackColor(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[700],
                          blurRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //revenue management
                ButtonColor(
                  blurRadius: 3,
                  height: 55,
                  radius: 15,
                  width: MediaQuery.of(context).size.width * 0.27,
                  color: ColorsHelper.lightGreenColor(),
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    AppNavigator.launchRevenueManager(context);
                  },
                  child: Text(
                    StringHelper.revenue_management,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsHelper.whiteColor(),
                        fontSize: 14,
                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

//      Row(
//        children: <Widget>[
//          Expanded(
//            flex: 2,
//            child: Stack(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                  margin:
//                      EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 5),
//                  decoration: BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.circular(15),
//                      boxShadow: [
//                        BoxShadow(
//                          color: Colors.grey,
//                          blurRadius: 2,
//                          offset: Offset(0, 1),
//                        )
//                      ]),
//                  child: Center(
//                    child: Container(
//                      margin: EdgeInsets.only(left: 15, right: 5, top: 10),
//                      child: Text(
//                        "you will get me talk money 10,000per one register from you",
//                        textAlign: TextAlign.center,
//                        style:
//                            TextStyle(fontSize: 10, color: Color(0xffAFAFAF)),
//                      ),
//                    ),
//                  ),
//                ),
//                Container(
//                  width: double.infinity,
//                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//                  margin: EdgeInsets.only(
//                    right: 15,
//                    left: 12,
//                  ),
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20),
//                      color: Color(0xff2E2E2E),
//                      boxShadow: []),
//                  child: Text("Recoment code 1115747",
//                      style: text2.copyWith(color: Colors.white)),
//                ),
//              ],
//            ),
//          ),
//          Expanded(
//            flex: 1,
//            child: GestureDetector(
//              onTap: (){
//
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => new RevenueManagement()));
//
//
//              },
//              child: Container(
//                padding: EdgeInsets.symmetric(horizontal: 8),
//                margin: EdgeInsets.only(top: 12, bottom: 5),
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                    color: Color(0xff707070)),
//                child: Center(
//                    child: Text(
//                  "revenue management",
//                  textAlign: TextAlign.center,
//                  style:
//                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                )),
//              ),
//            ),
//          ),
//        ],
//      ),
    );
  }

  Widget _buttonRegular() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new RegularPayment()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 90),
        height: MediaQuery.of(context).size.height * .05,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            )
          ],
          color: Color(0xff353A50),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "Regular Payment",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }

  Widget _line(int id) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        color: id == 1 || id == 2 ? Colors.black : Colors.transparent,
        height: 2,
        width: id == 1 || id == 2 || id == 3
            ? MediaQuery.of(context).size.width * .1
            : MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5),
      ),
    ]);
  }

  Widget businessCategory(SubCategories subCategories, int index, int length) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Stack(
                children: <Widget>[
                  //Followers, work compelete, portfolio, Review
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height * 0.115,
                      decoration: BoxDecoration(
                          color: ColorsHelper.whiteColor(),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.6),
                          //     blurRadius: 10.0, // soften the shadow
                          //     spreadRadius: 1.0, //extend the shadow
                          //     offset: Offset(
                          //       0, // Move to right 10  horizontally
                          //       1.4, // Move to bottom 10 Vertically
                          //     ),
                          //   )
                          // ],
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //Followers
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.followers.toString(),
                                style: TextStyle(
                                  color: ColorsHelper.themeBlackColor(),
                                  fontSize: 17,
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringHelper.followers,
                                style: TextStyle(
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: ColorsHelper.grayColor(),
                            indent: 30,
                            endIndent: 30,
                          ),
                          //work Complete
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.workComplete.toString(),
                                style: TextStyle(
                                  color: ColorsHelper.themeBlackColor(),
                                  fontSize: 17,
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringHelper.work_complete,
                                style: TextStyle(
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: ColorsHelper.grayColor(),
                            indent: 30,
                            endIndent: 30,
                          ),
                          //Portfolio
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.portfolio.toString(),
                                style: TextStyle(
                                    color: ColorsHelper.themeBlackColor(),
                                    fontSize: 17
                                    //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                    //fontWeight: FontWeight.w700,
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringHelper.Portfolio,
                                style: TextStyle(
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: ColorsHelper.grayColor(),
                            indent: 30,
                            endIndent: 30,
                          ),
                          //Review
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.review.toString(),
                                style: TextStyle(
                                  color: ColorsHelper.themeBlackColor(),
                                  fontSize: 17,
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringHelper.Review,
                                style: TextStyle(
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                  // fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  //Category name
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    width: MediaQuery.of(context).size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //category name
                        Text(
                          subCategories.categoryName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsHelper.themeBlackColor(),
                            fontSize: 15,
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                        //category icon
                        Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              placeholder: (context, url) => Container(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                                width: 20.0,
                                height: 20.0,
                                padding: EdgeInsets.all(10.0),
                              ),
                              imageUrl: subCategories.icon != null
                                  ? subCategories.icon
                                  : StringHelper.default_Avatar,
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.cover,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorsHelper.whiteColor(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[700],
                            blurRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(21))),
                  ),
                  //Plus button
                  index == length - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.12),
                              height: 28,
                              width: 28,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) {
                                        return AddBusinessCategoryPopup
                                            .openPopup(context, 1);
                                      }));
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: ColorsHelper.darkBlackColor(),
                                  size: 28,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: ColorsHelper.whiteColorBG(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[700],
                                      blurRadius: 4,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                            ),
                          ],
                        )
                      : Container(),
                  //Active status , 0 not active, 1 active
                  subCategories.categoryStatus == 1
                      ? Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .6,
                              right: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            StringHelper.activating,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 12,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[700],
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )
                      : Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .6,
                              right: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            StringHelper.not_active,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 12,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[700],
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _activate() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height * .2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.only(top: 15, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Center(
                child: Row(
              children: <Widget>[
                _buildNumber(1),
                _divider(1),
                _buildNumber(2),
                _divider(2),
                _buildNumber(3),
                _divider(3),
                _buildNumber(4)
              ],
            )),
          ),
          Row(children: [
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey[600], blurRadius: 2)
                      ]),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text("ABC eye brow",
                            style: text2.copyWith(
                                color: Colors.black, fontSize: 12)),
                      ),
                      Expanded(
                          child: Image(
                              height: 20,
                              width: 20,
                              image: AssetImage("assets/images/eyeBrow.png"))),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                margin: EdgeInsets.only(
                  right: 15,
                  left: 12,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff45C94D),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 1),
                    ]),
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "Activating",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                AddCategoryPopup.openPopup(context, 0);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffEFEFEF)),
                child: Icon(Icons.add, size: 24),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _divider(int id) {
    return Container(
      height: id == 5 ? 1 : 50,
      margin: EdgeInsets.symmetric(
          horizontal: id == 5 ? 1 : 10, vertical: id == 5 ? 30 : 1),
      width: id == 5 ? MediaQuery.of(context).size.width * .7 : 1,
      color: Color(0xffF4F4F6),
    );
  }

  Widget _buildNumber(id) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => new FollowerBusiness()));
        },
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              id == 1 ? "125" : id == 2 ? "150" : id == 3 ? "211" : "51",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              id == 1
                  ? "Followers"
                  : id == 2
                      ? "work complete"
                      : id == 3 ? "Portfolio" : "Review",
              style: TextStyle(fontSize: 12, color: Color(0xff78849E)),
            )
          ],
        )),
      ),
    );
  }

  Widget _credit() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: MediaQuery.of(context).size.height * 0.105,
      decoration: BoxDecoration(
          color: ColorsHelper.whiteColor(),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //credits
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "85,306",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 25,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                StringHelper.credit,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.grayColor(),
                    fontSize: 15,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
            ],
          ),
          //request Credit
          Material(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: ColorsHelper.themeBlackColor(),
            child: InkWell(
              splashColor: ColorsHelper.grayColor(),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              onTap: () {
                Vibrate.feedback(FeedbackType.light);
                AppNavigator.launchpurchaseCredit(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 2),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: ColorsHelper.whiteColor(),
                      size: 30,
                    ),
                    Text(
                      StringHelper.request_credit,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorsHelper.whiteColor(),
                          fontSize: 15,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postButton() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: Color(0xff353A50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Vibrate.feedback(FeedbackType.light);

          AppNavigator.launchUploadPortfolioPics(context, 1);
        },
        child: Row(
          children: <Widget>[
            Expanded(child: Container()),
            Expanded(
                child: Center(
                    child:
                        Text("Post", style: TextStyle(color: Colors.white)))),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Image(
                  height: 18,
                  width: 18,
                  image: AssetImage("assets/images/arrowright.png")),
            ))
          ],
        ),
      ),
    );
  }

  Widget _grid() {
    return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
      Card(
        color: ColorsHelper.whiteColor(),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10.0, top: 0, bottom: 0),
          child: Column(
            children: <Widget>[
              //1st row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Cerdit History , 1
                  fourActionsButton(StringHelper.CreditHistory, 1,
                      ImageAssets.credit_history),
                  //profile , 2
                  fourActionsButton(
                      StringHelper.Profile, 2, ImageAssets.profile),
                ],
              ),
              Divider(
                height: 18,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Customer,3
                  fourActionsButton(
                      StringHelper.Customer, 3, ImageAssets.customer),
                  //Scedule ,4
                  fourActionsButton("Schedule", 4, ImageAssets.scedule)
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        height: 60,
        width: 50,
        margin: EdgeInsets.only(left:70,bottom: 70),
        child: Image.asset("assets/images/customerNotification.png"),
      )
    ]);
  }

  Widget fourActionsButton(String name, int number, String icon) {
    return Container(
      height: 100,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: ColorsHelper.whiteColor(),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: () {
            Vibrate.feedback(FeedbackType.light);
            switch (number) {
              case 1:
                AppNavigator.launchCreditHistory(context);
                break;
              case 2:
                businessProfileBloc.getShopCategoryDetails(context, 0);
                break;
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Customerscreen()));
                break;
              case 4:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectUser()));
                break;
              default:
            }
            // AppNavigator.launchHospitalProfile(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                icon,
                width: 22,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 12,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridElement(int id) {
    return InkWell(
      onTap: () {
        id == 3
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => SelectUser()))
            : null;
      },
      child: Container(
        margin: EdgeInsets.only(
            top: id == 1 || id == 2 ? 30 : 1,
            bottom: id == 1 || id == 2 ? 5 : 30),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 20,
                width: 20,
                child: Image.asset(id == 1
                    ? "$image1"
                    : id == 2 ? "$image2" : id == 3 ? "$image3" : "$image4"),
              ),
              Text(
                  id == 1
                      ? "Credit History"
                      : id == 2 ? "Profile" : id == 3 ? "Customer" : "Schedule",
                  style: TextStyle(fontSize: 13, height: 3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _more() {
    return Card(
      color: ColorsHelper.whiteColor(),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(top: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 155.0,
            child: PageIndicatorContainer(
              pageView: PageView.builder(
                itemBuilder: getPagerView,
                itemCount: images.length,
                controller: pageController,
              ),
              align: IndicatorAlign.bottom,
              length: images.length,
              shape: IndicatorShape.circle(size: 10),
              indicatorSpace: 10.0,
              indicatorColor: Colors.white54,
              indicatorSelectorColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  StringHelper.more,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: ColorsHelper.themeBlackColor(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getPagerView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        images[index],
        fit: BoxFit.cover,
      ),
    );
  }
}
