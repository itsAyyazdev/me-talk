import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/business_profile/revenue_management.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/followers.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/regularPayment.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/requestCredit.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/select_date_user.dart';
import 'package:me_talk/src/utils/popup_dialogs/activate_history_popup.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var image1 = "assets/images/credit.png";
  var image2 = "assets/images/profile.png";
  var image3 = "assets/images/customer.png";
  var image4 = "assets/images/schedule.png";
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
                  SizedBox(height: 20),
                  _page(),
                  SizedBox(height: 20),
                  _rowRecommend(),
                  _activate(),
                  _activate2(),
                  _credit(),
                  _postButton(),
                  _grid(),
                  _more(),
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    child: Center(
                      child: Text("Contact to the Manager"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _page() {
    return Container(
      child: Image.asset(
        "assets/profileimage.png",
        width: 60,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _rowRecommend() {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin:
                      EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 5),
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
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 5, top: 10),
                      child: Text(
                        "you will get me talk money 10,000per one register from you",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xffAFAFAF)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff2E2E2E),
                      boxShadow: []),
                  child: Text("Recoment code 1115747",
                      style: text2.copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new RevenueManagement()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.only(top: 12, bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff707070)),
                child: Center(
                    child: Text(
                  "revenue management",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
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
              onTap: () {},
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

  Widget _activate2() {
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
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                margin: EdgeInsets.only(
                  right: 15,
                  left: 12,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorsHelper.pinkDropDown(),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 1),
                    ]),
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "Not Active",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
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
        onTap: () {},
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
      margin: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height * .15,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "85,306",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
                Text(
                  "Credit",
                  style: TextStyle(
                      fontSize: 16, height: 2, color: Color(0xff78849E)),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new RequestCredit()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              decoration: BoxDecoration(
                color: Color(0xff353A50),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    child: Text(
                      "Request credit",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ))
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
      child: Row(
        children: <Widget>[
          Expanded(child: Container()),
          Expanded(
              child: Center(
                  child: Text("Post", style: TextStyle(color: Colors.white)))),
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
    );
  }

  Widget _grid() {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 25),
      //height: MediaQuery.of(context).size.height * .25,
      margin: EdgeInsets.only(top: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                child: _gridElement(1),
              )),
              Expanded(
                  child: Center(
                child: _gridElement(2),
              )),
            ],
          ),
          _divider(5),
          Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                child: _gridElement(3),
              )),
              Expanded(
                  child: Center(
                child: _gridElement(4),
              )),
            ],
          ),
        ],
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
    return Container(
        margin: EdgeInsets.only(top: 25),
        // height: MediaQuery.of(context).size.height * .25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff78849E),
        ),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/cback.png"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Center(child: Text("More"))),
                    Expanded(flex: 3, child: Container()),
                    Expanded(
                        child: Center(
                      child: Image(
                          color: Colors.black,
                          height: 20,
                          width: 20,
                          image: AssetImage("assets/images/arrowright.png")),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
