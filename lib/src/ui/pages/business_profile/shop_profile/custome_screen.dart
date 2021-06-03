import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'dart:io';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/consultation_process.dart';
import 'package:me_talk/src/ui/pages/review/request_consultation.dart';
import 'package:vibrate/vibrate.dart';

class Customerscreen extends StatefulWidget {
  @override
  _CustomerscreenState createState() => _CustomerscreenState();
}

class _CustomerscreenState extends State<Customerscreen> {
  int button = 0;

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
                      image: AssetImage("assets/images/sharing.png"),
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
                  txtfeild(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: MediaQuery.of(context).size.height / 19,
                        decoration: BoxDecoration(
                            color: Color(0xff353A50),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff353A50),
                            )),
                        margin: EdgeInsets.only(top: 25, bottom: 25),
                        child: Center(
                          child: Text(
                            "Booking Customer",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        )),
                  ),
                  twobuttonpart(),
                  SizedBox(height: 7),
                  cofirmorderbuttonpart(),
                  button == 2 ? visitedcustomerlist() : listcustomer()
                ],
              ),
            ),
          ),
        ));
  }

  Widget visitedcustomerlist() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, index) => visitedcustomer()),
    );
  }

  Widget visitedcustomer() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey, width: .3),
              bottom: BorderSide(color: Colors.grey, width: .3))),
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          //es ki routing arman sy screen ly k intergerate kar ly
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ConsultationProcess()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'User name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/eyeBrow.png',
                      scale: 4,
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'D day-1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff353A50),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '19.8.20',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff353A50),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget listcustomer() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, index) => completecustomer()),
    );
  }

  Widget completecustomer() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey, width: .3),
              bottom: BorderSide(color: Colors.grey, width: .3))),
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          //es ki routing arman sy screen ly k intergerate kar ly
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ConsultationProcess()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'User name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Review done',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/eyeBrow.png',
                      scale: 4,
                    ),
                    Text(
                      '2019 6.23',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xff353A50),
                      ),
                    ),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 11,
                    color: Color(0xffC840E9),
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Image.asset(
                        'assets/images/purpleimg.png',
                        scale: 4,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget cofirmorderbuttonpart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              button = 0;
            });
          },
          child: Container(
              height: MediaQuery.of(context).size.height / 22,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: button == 0 ? Color(0xff353A50) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(
                top: 05,
              ),
              child: Center(
                child: Text(
                  "Coming order",
                  style: TextStyle(
                      color: button == 0 ? Colors.white : Color(0xff353A50),
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              )),
        ),
        SizedBox(width: 7),
        InkWell(
            onTap: () {
              setState(() {
                button = 1;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 22,
              decoration: BoxDecoration(
                color: button == 1 ? Color(0xff353A50) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: Center(
                  child: Text(
                "Recent Order",
                style: TextStyle(
                    color: button == 1 ? Colors.white : Color(0xff353A50),
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              )),
            ))
      ],
    );
  }

  Widget twobuttonpart() {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              button = 2;
            });
          },
          child: Container(
              height: MediaQuery.of(context).size.height / 19,
              width: MediaQuery.of(context).size.width / 2.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff353A50),
                  )),
              margin: EdgeInsets.only(
                top: 05,
              ),
              child: Center(
                child: Text(
                  "Visited Customer",
                  style: TextStyle(
                      color: Color(0xff353A50),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              )),
        ),
        SizedBox(width: 1),
        InkWell(
          onTap: () {
            setState(() {
              button = 3;
            });
          },
          child: Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 19,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff353A50),
                  )),
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: Center(
                child: Text(
                  "Complete Customer",
                  style: TextStyle(
                      color: Color(0xff353A50),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              )),
        )
      ],
    );
  }

  Widget txtfeild() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.only(left: 40, right: 40, top: 15),
        elevation: 30,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          height: MediaQuery.of(context).size.height / 17.7,
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Image.asset(
                  'assets/images/search.png',
                  scale: 3,
                ),
                prefixIcon: Image.asset(
                  'assets/images/search_close.png',
                  scale: 3,
                )),
          ),
        ));
  }
}
