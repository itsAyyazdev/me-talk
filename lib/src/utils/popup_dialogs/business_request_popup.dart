import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:vibrate/vibrate.dart';

class BusinessRequestPopup {
  static openPopup(BuildContext contextx) {
    return showDialog(
        barrierDismissible: false,
        context: contextx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: BusinessRequestBody(
                contextx: contextx,
              ),
            ),
          );
        });
  }

  static requestPending(BuildContext context, String message) async {
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
                      //ok
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
                                child: Text(StringHelper.ok,
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

  static requestRejected(BuildContext context, String message) async {
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
                      //Request again
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
                                Navigator.pop(context);
                                AppNavigator.launchBusinessRequest(context);
                              },
                              child: Center(
                                child: Text(StringHelper.request_again,
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
}

class BusinessRequestBody extends StatefulWidget {
  final BuildContext contextx;

  BusinessRequestBody({Key key, this.contextx}) : super(key: key);
  BusinessRequestBodyState createState() => BusinessRequestBodyState();
}

class BusinessRequestBodyState extends State<BusinessRequestBody> {
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
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: Card(
          color: ColorsHelper.themeBlackColor(),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            margin: const EdgeInsets.only(
                left: 0.0, right: 0.0, top: 25, bottom: 25),
            child: Column(
              children: <Widget>[
                //Title
                Text(
                  StringHelper.you_are_not_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 18,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  StringHelper.please_request_for_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 18,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 70,
                ),
                // buttons
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 27),
                  child: Row(
                    children: <Widget>[
                      //cancel
                      Flexible(
                        child: ButtonColor(
                          height: 35,
                          onPressed: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.pop(context);
                          },
                          child: Text(StringHelper.cancel),
                          color: ColorsHelper.whiteColor(),
                          radius: 10,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //Request
                      Flexible(
                        child: ButtonColor(
                          height: 35,
                          onPressed: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.pop(context);
                            AppNavigator.launchBusinessRequest(context);
                          },
                          child: Text(StringHelper.request),
                          color: ColorsHelper.whiteColor(),
                          radius: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
