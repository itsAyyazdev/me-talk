import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/home_page/home_page.dart';
import 'package:me_talk/src/ui/pages/home_page/writeReview.dart';
import 'package:me_talk/src/ui/pages/profile/activateHistory.dart';
import 'package:vibrate/vibrate.dart';

class RecentOrderListView extends StatelessWidget {
  final int index;

  RecentOrderListView({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getRecentOrderView(context, index),
    );
  }

//
//  index%2 ==1 completed
//
//  index%2 == 0 is in Progress
//
  Widget getRecentOrderView(BuildContext context, int index) {
    return new InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 6.0,
                    // has the effect of softening the shadow
                    //spreadRadius: 1.3, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      3, // vertical, move down 10
                    ),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                child: index % 2 == 0
                    ? Image.asset(
                        ImageAssets.hospital1,
                        width: 89,
                        height: 84,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        ImageAssets.hospital2,
                        width: 89,
                        height: 84,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Stack(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    // borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
                    boxShadow: [
                      BoxShadow(
                        color: index % 2 == 0
                            ? Color(0xff455B63).withOpacity(0.55) //455B63
                            : ColorsHelper.lightSkyColor().withOpacity(0.40),
                        blurRadius: 16.0, // soften the shadow
                        //spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          4.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: MediaQuery.of(context).size.width / 4.1,
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new BookingMap()));
                    },
                    child: Card(
                      elevation: 0,
                      color: index % 2 == 0
                          ? Color(0xff455B63).withOpacity(0.55) //455B63
                          : ColorsHelper.lightSkyColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(12.0)),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(12.0)),
                          child: Container(
                            color: index % 2 == 0
                                ? ColorsHelper.themeBlackColor()
                                : ColorsHelper.whiteColor(),
                            padding: EdgeInsets.all(8),
                            height: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    index % 2 == 1
                                        ? Text(
                                            "Complete",
                                            style: TextStyle(
                                                //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                                color: ColorsHelper
                                                    .blackBgColor()),
                                          )
                                        : Text("Booking",
                                            style: TextStyle(
                                                //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                                color:
                                                    ColorsHelper.whiteColor())),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("4/29",
                                        style: TextStyle(
                                            fontSize: 11,
                                            //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                            color: index % 2 == 0
                                                ? ColorsHelper.whiteColor()
                                                : ColorsHelper.blackBgColor())),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                index % 2 == 0
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("3 Days",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                                    color: ColorsHelper
                                                        .whiteColor())),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("3 hr 29min left",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                                    color: ColorsHelper
                                                        .whiteColor())),
                                          ],
                                        ),
                                      )
                                    : Text(""),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                  child: Container(
                    height: 18,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.white
                          : ColorsHelper.lightSkyColor(),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      border: Border.all(
                          color: ColorsHelper.grey71TextColor(), width: 0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, left: 8),
                      child: Text(
                        "Gangnam abc hospital",
                        style: TextStyle(
                            //fontFamily: FontsHelper.fonts_HyGothic_regular,
                            fontSize: 11,
                            color: index % 2 == 1
                                ? ColorsHelper.whiteColor()
                                : ColorsHelper.themeBlackColor()),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                      index%2 !=1?  _cancelPopup.openPopup(context):null;
                      },
                      icon: Icon(
                        FontAwesomeIcons.times,
                        size: 28,
                        color: index % 2 == 0
                            ? ColorsHelper.whiteColor()
                            : ColorsHelper.blackBgColor(),
                      )),
                ),
                index % 2 == 1
                    ? Positioned(
                        top: 50,
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WriteReview()));
                          },
                          child: Container(
                            decoration: new BoxDecoration(
                              color: ColorsHelper.themeBlackColor(),
                              borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: index % 2 == 0
                                      ? ColorsHelper.themeBlackColor()
                                      : ColorsHelper.skyShadowColor()
                                          .withOpacity(0.40),
                                  blurRadius:
                                      5.5, // has the effect of softening the shadow
                                  spreadRadius:
                                      1.5, // has the effect of extending the shadow
                                  offset: Offset(
                                    0.0, // horizontal, move right 10
                                    2.5, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            height: 31,
                            width: 128,
                            child: Center(
                              child: Text(StringHelper.writeReview,
                                  style: TextStyle(
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                      color: ColorsHelper.whiteColor())),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ],
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

////////////////////////BookingMap/////////////////////
class BookingMap extends StatefulWidget {
  @override
  _BookingMapState createState() => _BookingMapState();
}

class _BookingMapState extends State<BookingMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            margin: EdgeInsets.only(left: 40),
            //color: Colors.black12,
            height: 51,
            width: 75,
            padding: EdgeInsets.all(0),
            child: FlareActor(
              'assets/logo_chactor1.flr',
              alignment: Alignment.center,
              fit: BoxFit.cover,
              animation: "Logo",
              //controller: controls,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Image.asset(
              ImageAssets.search,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
            },
          ),
          SizedBox(
            width: 10,
          ),

          InkWell(
            child: Image.asset(
              ImageAssets.notification,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
            },
          ),
          //profile
          SizedBox(
            width: 10,
          ),

          InkWell(
            child: Image.asset(
              ImageAssets.user_nav,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: new BoxDecoration(
                  // borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff455B63).withOpacity(0.55) //455B63
                      ,
                      blurRadius: 16.0, // soften the shadow
                      //spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6.2,
                padding: EdgeInsets.only(top: 10),
                child: Card(
                  elevation: 2,
                  color: Color(0xff455B63).withOpacity(0.55) //455B63
                  ,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(12.0)),
                  ),
                  child:  Container(
                        width: MediaQuery.of(context).size.width,
                        color: ColorsHelper.themeBlackColor(),
                       // padding: EdgeInsets.all(8),
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 75,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "4/29",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontsHelper.fonts_medium,
                                      color: ColorsHelper.whiteColor()),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("3 Days",
                                      style: TextStyle(
                                          fontFamily: 'MontserratMedium',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                          color: ColorsHelper.whiteColor())),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("3 hr 29min left",
                                      style: TextStyle(
                                          fontFamily: 'MontserratMedium',
                                          fontSize: 11,
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                          color: ColorsHelper.whiteColor())),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),

              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .25,
                    top: MediaQuery.of(context).size.height * .05),
                child: Container(
                  height: 18,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    border: Border.all(
                        color: ColorsHelper.grey71TextColor(), width: 0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      "Gangnam abc hospital",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          //fontFamily: FontsHelper.fonts_HyGothic_regular,
                          fontSize: 11,
                          color: ColorsHelper.dashboardGrid(),
                          fontFamily: 'MontserratMedium'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 10, right: 10),
            decoration: new BoxDecoration(
              // borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff455B63).withOpacity(0.55) //455B63
                  ,
                  blurRadius: 40.0, // soften the shadow
                  //spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    4.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height / 7.7,
            padding: EdgeInsets.only(top: 10),
            child: Card(
              elevation: 0,
              color: Color(0xff455B63).withOpacity(0.55) //455B63
              ,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              ),
              child: ClipRRect(
                  borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: ColorsHelper.whiteColor(),
                    padding: EdgeInsets.all(8),
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 75,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "DIRECTION",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontsHelper.fonts_medium,
                                  color: ColorsHelper.themeBlackColor()),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(5.0)),
                                  color: ColorsHelper.themeBlackColor()),
                              child: Center(
                                  child: Text(
                                "Copy",
                                style: TextStyle(
                                    fontFamily: 'MontserratMedium',
                                    fontSize: 11,
                                    color: ColorsHelper.whiteColor()),
                              )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text("South Korea Gang nam gu 119-11",
                              style: TextStyle(
                                  fontFamily: 'MontserratMedium',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  //fontFamily: FontsHelper.fonts_HyGothic_regular,
                                  color: ColorsHelper.themeBlackColor())),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
            ),
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            height: 200,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                color: ColorsHelper.themeBlackColor()),
            child: Center(
                child: Text(
              "GO CHAT with this shop",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MontserratMedium',
                  fontSize: 14,
                  color: ColorsHelper.whiteColor()),
            )),
          ),
        ],
      )),
    );
  }
}

class _cancelPopup {
  static openPopup(BuildContext contextx) {
    return showDialog(
        barrierDismissible: false,
        context: contextx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: CancelPopup(
                contextx: contextx,
              ),
            ),
          );
        });
  }
}

class CancelPopup extends StatefulWidget {
  @override
  final BuildContext contextx;

  _CancelPopupState createState() => _CancelPopupState();

  CancelPopup({Key key, this.contextx}) : super(key: key);
}

class _CancelPopupState extends State<CancelPopup> {
  double width;
  double height;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Card(
          color: ColorsHelper.themeBlackColor(),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 0.0, right: 0.0, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                //Title
                Text(
                  "Please write to cancel reason                 ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 18,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "at least 5 latter",
                     ),
                ),
                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: ColorsHelper.whiteColor()),
                      child: Material(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: InkWell(
                          child: Icon(Icons.clear,
                              size: 30, color: ColorsHelper.themeBlackColor()),
                          onTap: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: ColorsHelper.whiteColor()),
                      child: Material(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: InkWell(
                          child: Icon(Icons.check,
                              size: 30, color: ColorsHelper.themeBlackColor()),
                          onTap: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
