import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/select_date_user.dart';
import 'package:me_talk/src/ui/pages/review/video_Chat.dart';
import 'package:me_talk/src/utils/custom_switch_button.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class Chat extends StatefulWidget {
  Chat({this.review, this.beautyshop, this.nofificationtype}) {
    review == null ? review = false : review = review;

    beautyshop == null ? beautyshop = false : beautyshop = beautyshop;
  }

  bool review;
  bool beautyshop;
  String nofificationtype;

  @override
  _ChatState createState() =>
      _ChatState(beautyshop: beautyshop, review: review);
}

class _ChatState extends State<Chat> {
  _ChatState({this.review, this.beautyshop}) {
    review == null ? review = false : review = review;

    beautyshop == null ? beautyshop = false : beautyshop = beautyshop;
  }

  bool review;
  bool beautyshop;
  int beautyschedule =
      1; //used for adding schedue while 2 is used sending address and cenl booking
  String img = ImageAssets.beauty_event2;
  String hospital = ImageAssets.hospital2;
  bool isChecked = false;
  bool addMedia = false;

  @override
  void initState() {
    super.initState();
    print("chat screen");
    print("review ${this.review}");
    print("beauty ${this.beautyshop}");
    widget.nofificationtype == "Biz"
        ? WidgetsBinding.instance.addPostFrameCallback((_) async {
            await showDialog(
                context: context,
                builder: (BuildContext context) => errorDialog(context));
          })
        : print(widget.nofificationtype);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Text(widget.nofificationtype == "Biz" ? "User" : "HOSPITAL NAME",
            style: TextStyle(
                color: Color(0xff2E2E2E),
                fontSize: 16,
                fontWeight: FontWeight.w500)),

        centerTitle: true,

        //  bottom:PreferredSize(child: tabbar(), preferredSize: Size.fromHeight(50))
      ),
      body: Container(
          color: Color(0xffE6E6E6),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 1
                        ? review
                            ? nextUser()
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(right: 10, top: 10),
                                alignment: Alignment.centerRight,
                                // color: Colors.red,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "09:43",
                                        style: TextStyle(
                                            color: Color(0xff2E2E2E),
                                            fontSize: 10),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            top: 5,
                                            bottom: 5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "hi",
                                          style: TextStyle(
                                              color: Color(0xff2E2E2E),
                                              fontSize: 10),
                                        ),
                                      ),
                                    ]),
                              )
                        : review ? requestCard() : nextUser();
                  },
                ),
              ),
              Positioned(
                bottom:
                    addMedia && beautyschedule == 2 ? 330 : addMedia ? 200 : 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .04),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: Color(0xff353A50),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(addMedia);
                            setState(() {
                              addMedia = !addMedia;
                              beautyschedule == 1
                                  ? beautyschedule = 2
                                  : beautyschedule = 1;

                              addMedia && beautyschedule == 1
                                  ? beautyschedule = 2
                                  : addMedia = addMedia;
                              print(addMedia);
                              // {
                              //   beautyschedule=1,

                              //   }
                              ;
                              print("add tapped");
                              print('$addMedia');
                            });
                          },
                          child: addMedia
                              ? Container(
                                  height: 30,
                                  width: 30,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(45 / 360),
                                    child: Image.asset(
                                      "assets/images/-2045.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 30,
                                  width: 30,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(0 / 360),
                                    child: Image.asset(
                                      "assets/images/-2045.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .04),
                        Expanded(
                            child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          alignment: Alignment.centerRight,
                          child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 15))),
                        ))
                      ]),
                ),
              ),
              Positioned(
                  bottom: addMedia && beautyschedule == 2
                      ? 420
                      : addMedia ? 290 : 100, //+45
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff353A50),
                    ),
                    height: 45,
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Translate",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: CustomSwitchButton(
                            backgroundColor: Colors.white,
                            buttonWidth: 50,
                            unCheckedColor: Color(0xff353A50),
                            animationDuration: Duration(milliseconds: 400),
                            checkedColor: Color(0xff353A50),
                            //Color(0xff353A50),
                            checked: isChecked,
                          ),
                        ),
                      ],
                    ),
                  )),
              addMedia
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: review
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: beautyschedule == 2 ? 320 : 200,
                              color: Colors.white,
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Card(
                                      elevation: 5,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.linked_camera,
                                          color: Color(0xff353A50),
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Column(children: [
                                      mediaButton("REQUAST VIDEO CHAT"),
                                      SizedBox(height: 20),
                                      mediaButton("TRANSLATE LANGUAGE")
                                    ])
                                  ]),
                            )
                          : beautyschedule == 1 && beautyshop == true
                              ? changeBookingDate()
                              : userQueries())
                  : Container()
            ],
          )),
    );
  }

  Widget userQueries() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20),
      height: 330,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                elevation: 5,
                margin: EdgeInsets.only(left: 10, right: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.linked_camera,
                    color: Color(0xff353A50),
                    size: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconmediaButton(
                        "assets/images/business_profile/4.png", "BOOK USER"),
                    SizedBox(height: 10),
                    iconmediaButton(
                        "assets/images/search_close.png", "CANCEL BOOKING"),
                    SizedBox(height: 10),
                    iconmediaButton(
                        "assets/images/icon2/beauty2.png", "SEND ADDRESS"),
                    SizedBox(height: 10),
                    iconmediaButton("assets/images/process.png", "PROCESS"),
                    SizedBox(height: 10),
                    iconmediaButton("assets/images/price.png", "PRICE"),
                  ]),
            )
          ]),
    );
  }

  Widget nextUser() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "$hospital",
                fit: BoxFit.cover,
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "HOSPITAL NAME",
                style: TextStyle(
                    color: Color(0xff2E2E2E),
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 5.0),
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "hi",
                  style: TextStyle(color: Color(0xff2E2E2E), fontSize: 10),
                ),
              ),
              Text(
                "09:43",
                style: TextStyle(color: Color(0xff2E2E2E), fontSize: 10),
              ),
            ])
          ]),
        )
      ]),
    );
  }

  Widget requestCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerRight,
//color: Colors.red,
      margin: EdgeInsets.only(top: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("09:41"),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color(0xffFFFF9C),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colors.grey.withOpacity(1))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("$img", fit: BoxFit.cover),
                      )),
                  SizedBox(height: 10),
                  Text(
                    "consultation requasted",
                    style: TextStyle(fontSize: 10),
                  )
                ]),
          )
        ],
      ),
    );
  }

  Widget errorDialog(context) {
    return Dialog(
      backgroundColor: Colors.transparent,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * .75,
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 5, right: 0, left: 0, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text("Review DC condition",
                style: TextStyle(
                  color: Color(0xff2E2E2E),
                  fontSize: 20,
                )),
          ),
          SizedBox(height: 20),
          Text(
            "Get Photo data (portfolio)", style: TextStyle(fontSize: 12),
            //   style: text2.copyWith(color: Color(0xff252C3E))
          ),
          SizedBox(height: 10),
          Text(
            "Before After Photo review",
            style: TextStyle(fontSize: 12),
            //   style: text2.copyWith(color: Color(0xff252C3E))
          ),
          SizedBox(height: 10),
          Text(
            "Photo Review", style: TextStyle(fontSize: 12),
            //   style: text2.copyWith(color: Color(0xff252C3E))
          ),
          SizedBox(height: 10),
          Text(
            "Word Review", style: TextStyle(fontSize: 12),
            //   style: text2.copyWith(color: Color(0xff252C3E))
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.withOpacity(.5),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text("Menu",
                style: TextStyle(
                    color: Color(0xff2E2E2E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          dialoghelper(),
          SizedBox(height: 15),
          dialoghelper(),
          SizedBox(height: 15),
          dialoghelper(),
        ]),
      ),
    );
  }

  Widget dialoghelper() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Item",
                style: TextStyle(
                    color: Color(0xff2E2E2E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text("Item",
                style: TextStyle(
                    color: Color(0xff2E2E2E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "Price",
              style: TextStyle(
                color: Color(0xff2E2E2E),
                fontSize: 15,
              ),
            ),
            Text("Price",
                style: TextStyle(
                  color: Color(0xff2E2E2E),
                  fontSize: 15,
                )),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Review DC",
                style: TextStyle(
                  color: Color(0xff2E2E2E),
                  fontSize: 15,
                )),
            Text("Review DC",
                style: TextStyle(
                  color: Color(0xff2E2E2E),
                  fontSize: 15,
                )),
          ]),
        ],
      ),
    );
  }

  Widget mediaButton(text) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => VideoChat()));
      },
      child: Container(
          width: 230,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff353A50)),
          alignment: Alignment.center,
          child: Text(
            "$text",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )),
    );
  }

  Widget iconmediaButton(img, text) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => VideoChat()));
      },
      child: Container(
          width: 230,
          height: 50,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff353A50)),
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              "$img",
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "$text",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            text == "PRICE"
                ? Container(
                    height: 45,
                    width: 55,
                    margin: EdgeInsets.only(left: 65),
                    decoration: WidgetHelper.customBoxDecorationWithShadow(
                        Colors.white, Colors.white, Colors.white, 0, 5),
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Setting",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  )
                : Container()
          ])),
    );
  }

  Widget changeBookingDate() {
    return Card(
      margin: EdgeInsets.only(top: 0),
      elevation: 10,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff353A50),
            ),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),

              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      datehelpe("2020"),
                      SizedBox(width: 10),
                      datehelpe("JUN"),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      datehelpe("17"),
                      SizedBox(width: 10),
                      datehelpe("13:00"),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * .35,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/business_profile/4.png",
                                color: Color(0xff2E2E2E),
                                width: 20,
                                height: 20,
                              ),
                              Text(
                                "Schedule",
                                style: TextStyle(
                                    color: Color(0xff2E2E2E), fontSize: 13),
                              ),
                            ],
                          )),
                      SizedBox(width: 90),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.done,
                          color: Color(0xff2E2E2E),
                        ),
                      )
                    ],
                  ))
              // deleteCustomer
              //     ?
              //  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => SelectUser()));
              //       },
              //       child: Container(
              //         margin: EdgeInsets.only(top: 10, bottom: 20),
              //         width: MediaQuery.of(context).size.width * .35,
              //         height: 30,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Colors.white,
              //             border: Border.all(color: Color(0xff2E2E2E)),
              //             boxShadow: [
              //               BoxShadow(
              //                   color: Colors.grey.withOpacity(.5),
              //                   offset: Offset(0, 7),
              //                   blurRadius: 5.0,
              //                   spreadRadius: 1.0)
              //             ]),
              //         child: Text("Schedule",
              //             style: TextStyle(
              //                 color: Color(0xff2E2E2E), fontSize: 13)),
              //       ),
              //       ),
              //     Container(
              //       margin: EdgeInsets.only(top: 10, bottom: 20, left: 10),
              //       width: MediaQuery.of(context).size.width * .35,
              //       height: 30,
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Color(0xff2E2E2E),
              //           boxShadow: [
              //             BoxShadow(
              //                 color: Colors.grey.withOpacity(.5),
              //                 offset: Offset(0, 7),
              //                 blurRadius: 5.0,
              //                 spreadRadius: 1.0)
              //           ]),
              //       child: Text("OK",
              //           style: TextStyle(color: Colors.white, fontSize: 13)),
              //     ),
              //   ])
              //  :
              //  Container(
              //     margin: EdgeInsets.only(top: 20, bottom: 20),
              //     width: MediaQuery.of(context).size.width * .4,
              //     height: 30,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Color(0xff2E2E2E),
              //         boxShadow: [
              //           BoxShadow(
              //               color: Colors.grey.withOpacity(.5),
              //               offset: Offset(0, 7),
              //               blurRadius: 5.0,
              //               spreadRadius: 1.0)
              //         ]),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text("OK",
              //               style:
              //                   TextStyle(color: Colors.white, fontSize: 13)),
              //         ]),
              //   ),
            ]),
          )),
    );
  }

  Widget datehelpe(text) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "$text",
        style: TextStyle(color: Color(0xff2E2E2E), fontSize: 13),
      ),
    );
  }
}
