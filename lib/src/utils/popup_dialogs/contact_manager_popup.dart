import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'dart:ui' as ui;

import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import 'package:vibrate/vibrate.dart';

class ContactManagerPopup {
  static openPopup(BuildContext contextx) {
    return
        // showDialog(
        //     barrierDismissible: false,
        //     context: contextx,
        //     builder: (context) {
        //       return
        BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ContactManagerBody(
            contextx: contextx,
          ),
        ),
      ),
    );
    //  });
  }
}

class ContactManagerBody extends StatefulWidget {
  final BuildContext contextx;
  ContactManagerBody({Key key, this.contextx}) : super(key: key);
  ContactManagerBodyState createState() => ContactManagerBodyState();
}

class ContactManagerBodyState extends State<ContactManagerBody> {
  double width;
  double height;

  bool isRequestSend = false;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        color: ColorsHelper.whiteColor(),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 25, bottom: 25),
          child: Center(
            child: ScrollConfiguration(
              behavior: ListViewScrollBehavior(),
              child: ListView.builder(
                itemCount: StringHelper.category.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Vibrate.feedback(FeedbackType.light);
                      Navigator.pop(
                          context, StringHelper.category.elementAt(index));
                    },
                    splashColor: ColorsHelper.grayColor(),
                    child: Container(
                      color: Colors.transparent,
                      height: 60,
                      child: Center(
                          child: Text(
                        StringHelper.category.elementAt(index),
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
