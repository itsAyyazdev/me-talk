import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:vibrate/vibrate.dart';

class PopupDialogs {
  bool isRetry;

  static displayDialog(BuildContext context, VoidCallback onReload) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                        width: 50.0,
                        height: 50.0,
                        child: Image.asset('assets/3x/server_icon.png')),
                  ),
                  Text(StringHelper.server_error,
                      style: TextStyle(
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          fontSize: 20),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 5,
                  ),
                  Text(StringHelper.network_connection_lost,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xffDCDCDC),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      //Cancel
                      Expanded(
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: ColorsHelper.themeBlackColor()),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ],
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xffFDF5F8),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(30.0),
                                onTap: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  Navigator.maybePop(context);
                                },
                                child: Center(
                                  child: Text(StringHelper.cancel,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsHelper.themeBlackColor(),
                                          fontFamily: FontsHelper
                                              .fonts_Nanum_Barun_Gothic)),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      //Retry
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(0.0, 1.5),
                                    blurRadius: 1.5,
                                  ),
                                ]),
                            child: ButtonColor(
                                height: 30,
                                child: Text(StringHelper.retry,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontFamily: FontsHelper
                                            .fonts_Nanum_Barun_Gothic)),
                                onPressed: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  onReload();
                                })),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  static displayMessage(BuildContext context, String message) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 150,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(StringHelper.opps,
                      style: TextStyle(
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          fontSize: 20),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xffDCDCDC),
                    //primaryColor
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      //Cancel
                      Expanded(
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                //offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ],
                            border: Border.all(
                                width: 2,
                                color: ColorsHelper.themeBlackColor()),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: ColorsHelper.whiteColor(),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(30.0),
                                onTap: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  Navigator.maybePop(context);
                                },
                                child: Center(
                                  child: Text(StringHelper.cancel,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsHelper.themeBlackColor(),
                                          fontFamily: FontsHelper
                                              .fonts_Nanum_Barun_Gothic)),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      //Retry
                      Expanded(
                          child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: ColorsHelper.themeBlackColor(),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                blurRadius: 1.5,
                              ),
                            ]),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          color: ColorsHelper.themeBlackColor(),
                          child: InkWell(
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                Navigator.maybePop(context);
                              },
                              child: Center(
                                child: Text(StringHelper.try_again,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsHelper.whiteColor(),
                                        fontFamily: FontsHelper
                                            .fonts_Nanum_Barun_Gothic)),
                              )),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  static displayMessageOnly(BuildContext context, String message) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 150,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(StringHelper.app_name,
                      style: TextStyle(
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          fontSize: 20),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xffDCDCDC),
                    //primaryColor
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorsHelper.themeBlackColor(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500],
                            blurRadius: 1.5,
                          ),
                        ]),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: ColorsHelper.themeBlackColor(),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(30.0),
                          onTap: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.maybePop(context);
                          },
                          child: Center(
                            child: Text(StringHelper.ok,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorsHelper.whiteColor(),
                                    fontFamily:
                                        FontsHelper.fonts_Nanum_Barun_Gothic)),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static displayInformationMessage(BuildContext context, String message) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 150,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  Text(StringHelper.opps,
//                      style: TextStyle(
//                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                          fontSize: 20),
//                      textAlign: TextAlign.center),
//                  SizedBox(
//                    height: 5,
//                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xffDCDCDC),
                    //primaryColor
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorsHelper.themeBlackColor(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500],
                            blurRadius: 1.5,
                          ),
                        ]),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: ColorsHelper.themeBlackColor(),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(30.0),
                          onTap: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.maybePop(context);
                          },
                          child: Center(
                            child: Text(StringHelper.ok,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorsHelper.whiteColor(),
                                    fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic)),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }


}
