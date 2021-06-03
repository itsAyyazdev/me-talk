
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/login&signup/email_login.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sharedpreference_helper/sharepreference_helper.dart';


class Utility {
  static VoidCallback onPosClick, onNavClick;

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static showAlertDialogCallBack({@required BuildContext context,
    onPosClick,
    onNavClick,
    onOkClick,
    var message = 'Something went wrong',
    String posBtnName = 'YES',
    String navBtnName = 'NO',
    bool isConfirmationDialog = true}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: Text(
                StringHelper.app_name,
                style: TextStyle(
                  color: ColorsHelper.themeBlackColor(),
                  fontFamily: 'Raleway SemiBold',
                ),
              ),
              content: Text(
                message,
                style: TextStyle(fontSize: 12),
              ),
              actions: isConfirmationDialog
                  ? <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onOkClick();
                  } ,
                  child: Text('OK',
                      style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontFamily: 'Raleway SemiBold',
                          fontWeight: FontWeight.bold)),
                )
              ]
                  : <Widget>[
                FlatButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                    onPosClick();
                  },
                  child: Text(posBtnName,
                      style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontFamily: 'Raleway SemiBold',
                          fontWeight: FontWeight.bold)),
                ),
                FlatButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                    onNavClick();
                  },
                  child: Text(navBtnName,
                      style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontFamily: 'Raleway SemiBold',
                          fontWeight: FontWeight.bold)),
                )
              ]);
        });
  }



  static showAlertDialogCallBackForValidation({@required BuildContext context,
    onPosClick,
    onNavClick,
    var message = 'Please enter vaild details.',
    String posBtnName = 'OK',
    bool isConfirmationDialog = true}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: Text(
                StringHelper.app_name,
                style: TextStyle(
                  color: ColorsHelper.themeColor(),
                  fontFamily: 'Raleway SemiBold',
                ),
              ),
              content: Text(
                message,
                style: TextStyle(fontSize: 12),
              ),
              actions: isConfirmationDialog
                  ? <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK',
                      style: TextStyle(
                          color: ColorsHelper.themeColor(),
                          fontFamily: 'Raleway SemiBold',
                          fontWeight: FontWeight.bold)),
                )
              ]
                  : <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPosClick();
                  },
                  child: Text(posBtnName,
                      style: TextStyle(
                          color: ColorsHelper.themeColor(),
                          fontFamily: 'Raleway SemiBold',
                          fontWeight: FontWeight.bold)),
                ),
                FlatButton(
                  child:Container(),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onNavClick();
                  },
                )
              ]);
        });
  }


  static openLink(String website) async {
    String websiteLink = website;
    if (website.substring(0, 4) != 'http') {
      websiteLink = 'http://$website';
    }
    if (await canLaunch(websiteLink)) {
      await launch(websiteLink);
    }
  }


  static call(String number) async {
    if (await canLaunch('tel:$number')) {
      await launch('tel:$number');
    }
  }

  static gotoLoginScreen(BuildContext context) async {
    await SharePreferencesHelper.getInstant()
        .setBool(SharePreferencesHelper.Is_Login, false);
    await SharePreferencesHelper.getInstant()
        .setString(SharePreferencesHelper.User_Data, '');
    Navigator.of(context).pop();
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (BuildContext context) => EmailLogin()),
      ModalRoute.withName('/'),
    );
    //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }


  static showToast(BuildContext context,String message) {
    Toast.show(message, context, duration: 4, gravity:  Toast.CENTER);
  }

  static shareLink(BuildContext context,String shareLink) {
    Share.share(shareLink);
  }

  static initPlatformStateForStringUniLinks(
      BuildContext context, bool mounted, String isFrom) async {
    StreamSubscription _sub, _newLinksub;
    String _latestLink = 'Unknown';

    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted) return;

      _latestLink = link ?? 'Unknown';
      /*setState(() {
        _latestLink = link ?? 'Unknown';
        _latestUri = null;
        try {
          if (link != null) _latestUri = Uri.parse(link);
        } on FormatException {}
      });*/
    }, onError: (err) {
      if (!mounted) return;

      _latestLink = 'Failed to get latest link: $err.';
    });

    // Attach a second listener to the stream
    getLinksStream().listen((String link) {
      print('got link: $link');
      if (link != null) {
        print("got link $link");
        //nextPage(context, link);
      }
    }, onError: (err) {
      print('got err: $err');
    });

    // Get the latest link
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      print('Common initial link: $initialLink');

      //Redirect to necessary pages
      if (isFrom == 'splash') {
        //nextPage(context, initialLink);
      }
    } on Exception {
      initialLink = 'Failed to get initial link.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    /*setState(() {
      _latestLink = initialLink;
    });*/
    _latestLink = initialLink;
  }

  static showAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          contentPadding:
          EdgeInsets.only(top: 10, right: 20, bottom: 1, left: 20),
          content: SingleChildScrollView(
              child: const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum., and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showAlertPrivacy(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Privacy Policy'),
          contentPadding:
          EdgeInsets.only(top: 10, right: 20, bottom: 1, left: 20),
          content: SingleChildScrollView(
              child: const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum., and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  }
