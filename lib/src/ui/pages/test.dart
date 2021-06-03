import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  static const String routeName = "TestWidget";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 14,
                height: 14,
                margin: EdgeInsets.only(left: 120, top: 142),
                child: Image.asset(
                  "assets/images/-2148.png",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              height: 94,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 255, 68),
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 242,
                margin: EdgeInsets.only(left: 13, top: 14),
                child: Text(
                  "recent new photo around you",
                  style: TextStyle(
                    color: Color.fromARGB(255, 53, 58, 80),
                    fontSize: 15,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 64,
              margin: EdgeInsets.only(left: 14, top: 22),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 64,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 335,
                height: 87,
                margin: EdgeInsets.only(left: 18, top: 14),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 87,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 90,
                                height: 87,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(41, 0, 0, 0),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Container(),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 67,
                                  margin: EdgeInsets.only(left: 21),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 224,
                                          height: 19,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 3,
                                                right: 0,
                                                child: Container(
                                                  width: 55,
                                                  child: Text(
                                                    "1.8 Km",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 145, 0),
                                                      fontSize: 13,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 49,
                                                child: Container(
                                                  width: 175,
                                                  child: Text(
                                                    "active user name",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 15,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 175,
                                          margin: EdgeInsets.only(right: 49),
                                          child: Text(
                                            "shop name",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 13,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 92,
                                          margin: EdgeInsets.only(top: 17),
                                          child: Text(
                                            "specialty of ",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 220, 43, 143),
                                              fontSize: 12,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
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
                    Positioned(
                      left: 111,
                      child: Container(
                        width: 60,
                        child: Text(
                          "Location. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 50, 71, 85),
                            fontSize: 12,
                            fontFamily: ".SF NS Text",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 335,
                height: 87,
                margin: EdgeInsets.only(left: 18, top: 9),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 87,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 90,
                                height: 87,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(41, 0, 0, 0),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Container(),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 67,
                                  margin: EdgeInsets.only(left: 21),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 224,
                                          height: 19,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 3,
                                                right: 0,
                                                child: Container(
                                                  width: 55,
                                                  child: Text(
                                                    "1.8 Km",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 145, 0),
                                                      fontSize: 13,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 49,
                                                child: Container(
                                                  width: 175,
                                                  child: Text(
                                                    "active user name",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 15,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 175,
                                          margin: EdgeInsets.only(right: 49),
                                          child: Text(
                                            "shop name",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 13,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 92,
                                          margin: EdgeInsets.only(top: 17),
                                          child: Text(
                                            "specialty of ",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 220, 43, 143),
                                              fontSize: 12,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
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
                    Positioned(
                      left: 111,
                      child: Container(
                        width: 60,
                        child: Text(
                          "Location. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 50, 71, 85),
                            fontSize: 12,
                            fontFamily: ".SF NS Text",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 335,
                height: 87,
                margin: EdgeInsets.only(left: 18, top: 9),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 87,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 90,
                                height: 87,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(41, 0, 0, 0),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Container(),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 67,
                                  margin: EdgeInsets.only(left: 21),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 224,
                                          height: 19,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 3,
                                                right: 0,
                                                child: Container(
                                                  width: 55,
                                                  child: Text(
                                                    "1.8 Km",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 145, 0),
                                                      fontSize: 13,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 49,
                                                child: Container(
                                                  width: 175,
                                                  child: Text(
                                                    "active user name",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 15,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 175,
                                          margin: EdgeInsets.only(right: 49),
                                          child: Text(
                                            "shop name",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 13,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 92,
                                          margin: EdgeInsets.only(top: 17),
                                          child: Text(
                                            "specialty of ",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 220, 43, 143),
                                              fontSize: 12,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
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
                    Positioned(
                      left: 111,
                      child: Container(
                        width: 60,
                        child: Text(
                          "Location. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 50, 71, 85),
                            fontSize: 12,
                            fontFamily: ".SF NS Text",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 335,
                height: 87,
                margin: EdgeInsets.only(left: 18, top: 9),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 87,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 90,
                                height: 87,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(41, 0, 0, 0),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Container(),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 67,
                                  margin: EdgeInsets.only(left: 21),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 224,
                                          height: 19,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 3,
                                                right: 0,
                                                child: Container(
                                                  width: 55,
                                                  child: Text(
                                                    "1.8 Km",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 145, 0),
                                                      fontSize: 13,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 49,
                                                child: Container(
                                                  width: 175,
                                                  child: Text(
                                                    "active user name",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 15,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 175,
                                          margin: EdgeInsets.only(right: 49),
                                          child: Text(
                                            "shop name",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 13,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 92,
                                          margin: EdgeInsets.only(top: 17),
                                          child: Text(
                                            "specialty of ",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 220, 43, 143),
                                              fontSize: 12,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
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
                    Positioned(
                      left: 111,
                      child: Container(
                        width: 60,
                        child: Text(
                          "Location. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 50, 71, 85),
                            fontSize: 12,
                            fontFamily: ".SF NS Text",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 335,
                height: 87,
                margin: EdgeInsets.only(left: 18, top: 9),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 87,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 90,
                                height: 87,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(41, 0, 0, 0),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Container(),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 67,
                                  margin: EdgeInsets.only(left: 21),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 224,
                                          height: 19,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 3,
                                                right: 0,
                                                child: Container(
                                                  width: 55,
                                                  child: Text(
                                                    "1.8 Km",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 145, 0),
                                                      fontSize: 13,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 49,
                                                child: Container(
                                                  width: 175,
                                                  child: Text(
                                                    "active user name",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 15,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 175,
                                          margin: EdgeInsets.only(right: 49),
                                          child: Text(
                                            "shop name",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 13,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 92,
                                          margin: EdgeInsets.only(top: 17),
                                          child: Text(
                                            "specialty of ",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 220, 43, 143),
                                              fontSize: 12,
                                              fontFamily: ".SF NS Text",
                                            ),
                                            textAlign: TextAlign.left,
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
                    Positioned(
                      left: 111,
                      child: Container(
                        width: 60,
                        child: Text(
                          "Location. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 50, 71, 85),
                            fontSize: 12,
                            fontFamily: ".SF NS Text",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 242,
                margin: EdgeInsets.only(left: 13, top: 12),
                child: Text(
                  "sponsor post",
                  style: TextStyle(
                    color: Color.fromARGB(255, 53, 58, 80),
                    fontSize: 15,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 64,
              margin: EdgeInsets.only(left: 14, top: 22),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 64,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 335,
                height: 855,
                margin: EdgeInsets.only(left: 18, top: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 87,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 87,
                            margin: EdgeInsets.only(top: 9),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 87,
                            margin: EdgeInsets.only(top: 9),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 87,
                            margin: EdgeInsets.only(top: 9),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 87,
                            margin: EdgeInsets.only(top: 105),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 87,
                            margin: EdgeInsets.only(top: 9),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 87,
                            margin: EdgeInsets.only(bottom: 9),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 87,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 87,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 0.3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      41, 0, 0, 0),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 67,
                                              margin: EdgeInsets.only(left: 21),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 224,
                                                      height: 19,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 3,
                                                            right: 0,
                                                            child: Container(
                                                              width: 55,
                                                              child: Text(
                                                                "1.8 Km",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          145,
                                                                          0),
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0,
                                                            right: 49,
                                                            child: Container(
                                                              width: 175,
                                                              child: Text(
                                                                "active user name",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      ".SF NS Text",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 175,
                                                      margin: EdgeInsets.only(
                                                          right: 49),
                                                      child: Text(
                                                        "shop name",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 13,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 92,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "specialty of ",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              43,
                                                              143),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              ".SF NS Text",
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                                Positioned(
                                  left: 111,
                                  child: Container(
                                    width: 60,
                                    child: Text(
                                      "Location. ",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 50, 71, 85),
                                        fontSize: 12,
                                        fontFamily: ".SF NS Text",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 87,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 87,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 90,
                                        height: 87,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 0, 0),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112),
                                            width: 0.3,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(41, 0, 0, 0),
                                              offset: Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                        ),
                                        child: Container(),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: 67,
                                          margin: EdgeInsets.only(left: 21),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  width: 224,
                                                  height: 19,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Positioned(
                                                        top: 3,
                                                        right: 0,
                                                        child: Container(
                                                          width: 55,
                                                          child: Text(
                                                            "1.8 Km",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      145,
                                                                      0),
                                                              fontSize: 13,
                                                              fontFamily:
                                                                  ".SF NS Text",
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 49,
                                                        child: Container(
                                                          width: 175,
                                                          child: Text(
                                                            "active user name",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  ".SF NS Text",
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  width: 175,
                                                  margin: EdgeInsets.only(
                                                      right: 49),
                                                  child: Text(
                                                    "shop name",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 13,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  width: 92,
                                                  margin:
                                                      EdgeInsets.only(top: 17),
                                                  child: Text(
                                                    "specialty of ",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 220, 43, 143),
                                                      fontSize: 12,
                                                      fontFamily: ".SF NS Text",
                                                    ),
                                                    textAlign: TextAlign.left,
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
                            Positioned(
                              left: 111,
                              child: Container(
                                width: 60,
                                child: Text(
                                  "Location. ",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 50, 71, 85),
                                    fontSize: 12,
                                    fontFamily: ".SF NS Text",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
