import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_profile_page.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

class ShopPortfolioPage extends StatefulWidget {
  @override
  _ShopPortfolioPageState createState() => _ShopPortfolioPageState();
}

class _ShopPortfolioPageState extends State<ShopPortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsHelper.whiteColor(),
        elevation: 0,
        leading: IconButton(
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: IconButton(
              icon: Image.asset(
                ImageAssets.share,
                width: 25.0,
                height: 25.0,
                fit: BoxFit.contain,
              ),
              onPressed: () {},
            ),
          ),
        ],
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 7),
          width: MediaQuery.of(context).size.height *
            (Platform.isIOS ? 0.15 : 0.12),
          height: MediaQuery.of(context).size.height *
            (Platform.isIOS ? 0.11 : 0.10),
//            width:70,
//            height:50,
          child: FlareActor(
            'assets/logo_chactor.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: "Logo",
            //controller: controls,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 2.20,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/images/beauty/Nails/nail1.png',
                            //'assets/images/beauty/shop/portfolio_dp.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 2.35,
                          ),
                          child: Container(
                            height: 185,
//                          width: MediaQuery.of(context).size.width - 10,
                          //color: Colors.amber,
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 104.0),
                                      child: Container(
//                                    color: Colors.pink,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            bottom: BorderSide(
                                                color: ColorsHelper.greyTextColor(),
                                                width: 0.3
                                            ),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.16),
                                              blurRadius: 6,
                                              offset: Offset(0, 6),
                                            )
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Divider(
                                                thickness: 0.3,
                                                color: ColorsHelper
                                                    .grey71TextColor(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 40.0),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      ImageAssets.heart_gray,
                                                      width: 56,
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      "12",
                                                      style: TextStyle(
                                                        color: ColorsHelper
                                                            .whiteColor(),
                                                        fontSize: 16.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 26.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 25.0),
                                                    child: Icon(
                                                      Icons.remove_red_eye,
                                                      color: ColorsHelper
                                                          .grey71TextColor(),
                                                      size: 25,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10.0),
                                                    child: Text(
                                                      "12",
                                                      style: TextStyle(
                                                        color: ColorsHelper
                                                            .grey71TextColor(),
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                  ),//
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 25.0),
                                                    child: Image.asset(
                                                      ImageAssets.clock_portfolio,
                                                      width: 20,
                                                      height: 23,
                                                      //fit: ,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 15.0),
                                                    child: Text(
                                                      "2020.01.01",
                                                      style: TextStyle(
                                                        color: ColorsHelper
                                                            .grey71TextColor(),
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 25.0,top:2,bottom:3),
                                                    child: Image.asset(
                                                      ImageAssets.koren_icon,
                                                      width: 44,
                                                      height: 44,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 35.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(40),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        print(
                                                            "ShopProfilePage Click");
                                                        Vibrate.feedback(
                                                            FeedbackType.light);
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ShopProfilePage()),
                                                        );
                                                      },
                                                      child: Image.asset(
                                                        //"assets/images/Reviews/review-1.png",
                                                        'assets/images/beauty/shop/portfolio_dp.png',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(40),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.16),
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, left: 35),
                                              child: Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorsHelper.blackBgColor(),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: InkWell(
                                                    onTap: () {},
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    child: Text(
                                                      StringHelper.str_cancel,
                                                      textAlign: TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  child: Text(
                                                    "Main Name",
                                                    style: TextStyle(
                                                      color: ColorsHelper
                                                          .grey71TextColor(),
                                                      fontSize: 20.0,
                                                      //fontFamily: FontsHelper.fonts_medium
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  child: Text(
                                                    "City Area",
                                                    style: TextStyle(
                                                      color: ColorsHelper
                                                          .grey71TextColor(),
                                                      fontSize: 15.0,
                                                      //fontFamily: FontsHelper.fonts_medium
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  child: Text(
                                                    "shop name",
                                                    style: TextStyle(
                                                      color: ColorsHelper
                                                          .grey71TextColor(),
                                                      fontSize: 13.0,
                                                      //fontFamily: FontsHelper.fonts_medium
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  child: Text(
                                                    "speciality of",
                                                    style: TextStyle(
                                                        color: ColorsHelper
                                                            .pinkStarFillColor(),
                                                        fontSize: 13.0,
                                                        fontFamily: FontsHelper
                                                            .fonts_medium),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
//                                Padding(
//                                  padding: EdgeInsets.only(top: 5),
//                                  child: Material(
//                                    elevation: 3,
//                                    child: Container(
//                                      height: 0.3,
//                                      decoration: BoxDecoration(
//                                        color: Colors.white,
//                                        border: Border(
//                                          bottom: BorderSide(
//                                              color: ColorsHelper.greyTextColor(),
//                                              width: 0.3
//                                          ),
//                                        ),
//                                        boxShadow: [
//                                          BoxShadow(
//                                            color: Colors.black.withOpacity(0.16),
//                                            blurRadius: 6,
//                                            offset: Offset(0, 3),
//                                          )
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                )
                              ],
                            ),
                          ),
                        ),
//                      Padding(
//                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.25),
//                        child: Container(
//                          height: 78,
////                          width: MediaQuery.of(context).size.width - 20,
//                          decoration: BoxDecoration(
//                            color: Colors.black12,
//                            boxShadow: [
//                              BoxShadow(color: ColorsHelper.grey71TextColor().withOpacity(0.2), spreadRadius: 0.7, blurRadius: 6, offset: Offset(0, 5))
//                            ],
//                          ),
//                          child: Stack(
//                            children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.only(top: 15.0),
//                                child: Divider(
//                                  thickness: 0.3,
//                                  color: ColorsHelper.grey71TextColor(),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(right: 40.0),
//                                child: Align(
//                                  alignment: Alignment.topRight,
//                                  child: Stack(
//                                    alignment: Alignment.center,
//                                    children: <Widget>[
//                                      Image.asset(
//                                        ImageAssets.heart_gray,
//                                        width: 56,
//                                        height: 50,
//                                      ),
//                                      Text(
//                                        "12",
//                                        style: TextStyle(
//                                          color: ColorsHelper.whiteColor(),
//                                          fontSize: 16.0,
//                                        ),
//                                      )
//                                    ],
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(top: 25.0),
//                                child: Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 25.0),
//                                      child: Icon(
//                                        Icons.remove_red_eye,
//                                        color: ColorsHelper.grey71TextColor(),
//                                        size: 23,
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 10.0),
//                                      child: Text(
//                                        "12",
//                                        style: TextStyle(
//                                          color: ColorsHelper.grey71TextColor(),
//                                          fontSize: 13.0,
//                                        ),
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 25.0),
//                                      child: Icon(
//                                        Icons.timer,
//                                        color: ColorsHelper.grey71TextColor(),
//                                        size: 23,
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 15.0),
//                                      child: Text(
//                                        "2020.01.01",
//                                        style: TextStyle(
//                                          color: ColorsHelper.grey71TextColor(),
//                                          fontSize: 13.0,
//                                        ),
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 25.0, top: 5),
//                                      child: Image.asset(
//                                        ImageAssets.koren_icon,
//                                        width: 44,
//                                        height: 44,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10, right: 10, bottom: 2),
                      child: Text(
                        "Please report if there is price or number in this post",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            height: 27,
                            width: 77,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                                border: Border.all(
                                    color: Color(0xff252C3E),
                                    width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Report",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 46,
                    width: MediaQuery.of(context).size.width - 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: ColorsHelper.themeBlackColor(),
                        border: Border.all(
                            color: ColorsHelper.pinkStarFillColor(),
                            width: 0.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.47),
                            blurRadius: 6,
                            offset: Offset(3, 3),
                          )
                        ]),
//                    decoration: WidgetHelper.customBoxDecorationWithShadow(ColorsHelper.themeBlackColor(), ColorsHelper.pinkStarFillColor(), Colors.black, 0, 5),
                    child: Center(
                      child: Material(
                        color: ColorsHelper.themeBlackColor(),
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Text(
                            StringHelper.reqPortfolio,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15.0,
                              //fontFamily: FontsHelper.fonts_Poppins_Medium
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
