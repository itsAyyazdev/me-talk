import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/blocs/bloc_post_info/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'dart:ui' as ui;
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:vibrate/vibrate.dart';

class ConfirmDeletePostPopup {
  static openPopup(BuildContext contextx, int postId) {
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
          child: ConfirmDeletePostBody(
            contextx: contextx,
            postId: postId,
          ),
        ),
      ),
    );
    //  });
  }
}

class ConfirmDeletePostBody extends StatefulWidget {
  final BuildContext contextx;
  final int postId;
  ConfirmDeletePostBody({Key key, this.contextx, this.postId})
      : super(key: key);
  ConfirmDeletePostBodyState createState() => ConfirmDeletePostBodyState();
}

class ConfirmDeletePostBodyState extends State<ConfirmDeletePostBody> {
  double width;
  double height;
  PostInfoBloc postInfoBloc = PostInfoBloc();
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: ColorsHelper.whiteColor(),
        elevation: 2,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 25, bottom: 25),
          child: Center(
              //page to ask for confiriming
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(StringHelper.confirm_delete_post,
                  style: TextStyle(
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "cross button",
                    mini: true,
                    onPressed: () {
                      Vibrate.feedback(FeedbackType.light);
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      FontAwesomeIcons.times,
                      color: Colors.white,
                    ),
                    backgroundColor: ColorsHelper.themeBlackColor(),
                  ),
                  FloatingActionButton(
                    mini: true,
                    heroTag: "next check button",
                    splashColor: ColorsHelper.grayColor(),
                    onPressed: () {
                      Vibrate.feedback(FeedbackType.light);
                      postInfoBloc
                          .getDeletePostInfo(context, widget.postId)
                          .then((onValue) {
                        setState(() {
                          if (onValue) {
                            AppNavigator.popBackStack(context);
                            AppNavigator.popBackStack(widget.contextx);
                          } else {}
                        });
                      });
                    },
                    child: Icon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    ),
                    backgroundColor: ColorsHelper.themeBlackColor(),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
