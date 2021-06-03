import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:vibrate/vibrate.dart';

class ChangePasswordPopupDialog {
  static changePasswordPopup(BuildContext context, String email) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 10,
            contentPadding: EdgeInsets.all(10),
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(22.0)
            //     ),
            content: Container(
              height: 230,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(StringHelper.we_sent_mail_text,
                      style: TextStyle(
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic, fontSize: 16),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: ColorsHelper.themeBlackColor()),
                  child: Material(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    child: InkWell(
                      child: Icon(Icons.done,
                      size: 30, color: ColorsHelper.whiteColor()),
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
                ],
              ),
            ),
          );
        });
  }
}
