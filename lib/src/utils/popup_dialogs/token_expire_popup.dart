import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:vibrate/vibrate.dart';

class TokenExpirePopup {
  static displayMessage(BuildContext context, String message) async {
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
                  Text(StringHelper.opps,
                      style: TextStyle(
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic, fontSize: 20),
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
                                  AppNavigator.launchLoginPage(context);
                                },
                                child: Center(
                                  child: Text(StringHelper.cancel,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsHelper.themeBlackColor(),
                                          fontFamily:
                                              FontsHelper.fonts_Nanum_Barun_Gothic)),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      //Ok
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
                                AppNavigator.launchLoginPage(context);
                              },
                              child: Center(
                                child: Text(StringHelper.ok,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsHelper.whiteColor(),
                                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic)),
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
                  Text(StringHelper.opps,
                      style: TextStyle(
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic, fontSize: 20),
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
                                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic)),
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
