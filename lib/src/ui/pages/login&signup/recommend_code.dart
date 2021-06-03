import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_recommend_code/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:vibrate/vibrate.dart';
import 'package:flutter/cupertino.dart';

class RecommendCode extends StatefulWidget {
  static const String routeName = "RecommendCode";
  RecommendCode({Key key}) : super(key: key);

  @override
  _RecommendCodeState createState() => _RecommendCodeState();
}

class _RecommendCodeState extends State<RecommendCode> {
  RecommendCodeBloc recommendCodeBloc = RecommendCodeBloc();

  TextEditingController _firstController = new TextEditingController();
  TextEditingController _secController = new TextEditingController();
  TextEditingController _thirdController = new TextEditingController();
  TextEditingController _fourController = new TextEditingController();
  TextEditingController _fiveController = new TextEditingController();
  TextEditingController _sixController = new TextEditingController();
  TextEditingController _sevenController = new TextEditingController();

  Color borderColor = Colors.white;
  final fnFirst = FocusNode();
  final fnSec = FocusNode();
  final fnThird = FocusNode();
  final fnFour = FocusNode();
  final fnFive = FocusNode();
  final fnSix = FocusNode();
  final fnSeven = FocusNode();

  bool isFirstColor = false;
  bool isSecColor = false;
  bool isThirdColor = false;
  bool isFourColor = false;
  bool isFiveColor = false;
  bool isSixColor = false;
  bool isSevenColor = false;

  bool isFilled = false;

  TextEditingController codeController = TextEditingController();
  FocusNode fnodeCode = FocusNode();

  String thisText = " ";
  int pinLength = 7;

  bool hasError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    recommendCodeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.themeBlackColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: ColorsHelper.themeBlackColor(),
                // leading: IconButton(
                //   icon: Image.asset(
                //     ImageAssets.back,
                //     width: 20.0,
                //     height: 20.0,
                //     fit: BoxFit.contain,
                //   ),
                //   onPressed: () {
                //     Vibrate.feedback(FeedbackType.light);
                //     Navigator.of(context).pop();
                //   },
                // ),
              ),
              backgroundColor: ColorsHelper.themeBlackColor(),
              body: BlocProvider(
                create: (BuildContext context) => recommendCodeBloc,
                child: BlocBuilder(
                  bloc: recommendCodeBloc,
                  builder: (BuildContext context, RecommendCodeState state) {
                    return Container(child: recommendCodeBody());
                  },
                ),
              ),
            )));
  }

  Widget recommendCodeBody() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 18, right: 18),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Text
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  StringHelper.do_you_have_recommend_code,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                      fontSize: 21),
                ),
              ),
              //No Button
              Container (
                margin: EdgeInsets.only(top: 5),
                child: ButtonColor(
                  radius: 5,
                  height: 37,
                  width: 124,
                  blurRadius: 6,
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    SharePreferencesHelper.getInstant()
                        .setInt(SharePreferencesHelper.Recommend_Code, null);
                    AppNavigator.launchRegisterPage(context);
                  },
                  color: ColorsHelper.whiteColor(),
                  child: Container(
                    padding: EdgeInsets.only(top:5),
                    child: Text(
                      StringHelper.no,
                      style: TextStyle(
                          color: ColorsHelper.blackBgColor(),
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          //fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              textOtpfeild(),
              buildNumberKeyBoard(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8.3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textOtpfeild() {
    return Container(
      margin: EdgeInsets.only(top:15.0),
      width: MediaQuery.of(context).size.width * 0.87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: TextField(
              textAlign: TextAlign.center,
              controller: _firstController,
              focusNode: fnFirst,
              enabled: false,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: 2
                        // color: isFirstColor ? Colors.white30 : Colors.white,

                )),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _secController,
              enabled: false,
              focusNode: fnSec,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                  //color: isSecColor ? Colors.white30 : Colors.white,
                )),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
              child: new TextField(
            textAlign: TextAlign.center,
            controller: _thirdController,
            enabled: false,
            focusNode: fnThird,
            style: TextStyle(fontSize: 30.0, color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2
                //color: isThirdColor ? Colors.white30 : Colors.white,
              )),
            ),
          )),
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _fourController,
              enabled: false,
              focusNode: fnFive,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                  //color: isFourColor ? Colors.white30 : Colors.white,
                )),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _fiveController,
              enabled: false,
              focusNode: fnSix,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                  //color: isFiveColor ? Colors.white30 : Colors.white,
                )),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _sixController,
              enabled: false,
              focusNode: fnSeven,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                  //color: isSixColor ? Colors.white30 : Colors.white,
                )),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _sevenController,
              enabled: false,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                  //color: isSevenColor ? Colors.white30 : Colors.white,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumberKeyBoard() {
    double spaceVertical = 45;
    return Container(
      margin: EdgeInsets.only(top:30.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                print('ontap');
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "1";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "1";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "1";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "1";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "1";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "1";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "1";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "2";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "2";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "2";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "2";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "2";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "2";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "2";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "2",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "3";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "3";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "3";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "3";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "3";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "3";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "3",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceVertical,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "4";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "4";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "4";
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "4";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "4";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "4";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "4";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "4",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "5";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "5";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "5";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "5";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "5";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "5";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "5";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "6";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "6";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "6";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "6";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "6";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "6";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "6";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "6",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceVertical,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "7";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "7";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "7";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "7";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "7";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "7";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "7";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "7",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "8";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "8";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "8";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "8";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "8";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "8";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });

                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "8";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "8",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                if (_firstController.text.isEmpty) {
                                  _firstController.text = "9";
                                  setState(() {
                                    isFirstColor = true;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_secController.text.isEmpty) {
                                  _secController.text = "9";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = true;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_thirdController.text.isEmpty) {
                                  _thirdController.text = "9";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = true;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fourController.text.isEmpty) {
                                  _fourController.text = "9";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = true;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_fiveController.text.isEmpty) {
                                  _fiveController.text = "9";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = true;
                                    isSixColor = false;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sixController.text.isEmpty) {
                                  _sixController.text = "9";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = true;
                                    isSevenColor = false;
                                  });
                                  return;
                                }
                                if (_sevenController.text.isEmpty) {
                                  _sevenController.text = "9";
                                  setState(() {
                                    isFirstColor = false;
                                    isSecColor = false;
                                    isThirdColor = false;
                                    isFourColor = false;
                                    isFiveColor = false;
                                    isSixColor = false;
                                    isSevenColor = true;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      AppNavigator.launchRegisterPage(context);
                                    });
                                    // Fluttertoast.showToast(
                                    //     msg: "All fields filled",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIos: 1,
                                    //     backgroundColor: Colors.white,
                                    //     textColor: Colors.black,
                                    //     fontSize: 16.0);
                                  });
                                  return;
                                }
                              },
                              child: Text(
                                "9",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.w200
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spaceVertical,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        if (_firstController.text.isEmpty) {
                          _firstController.text = "0";
                          setState(() {
                            isFirstColor = true;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });

                          return;
                        }
                        if (_secController.text.isEmpty) {
                          _secController.text = "0";
                          setState(() {
                            isFirstColor = false;
                            isSecColor = true;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          return;
                        }
                        if (_thirdController.text.isEmpty) {
                          _thirdController.text = "0";
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = true;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          //FocusScope.of(context).requestFocus(fnFour);
                          return;
                        }
                        if (_fourController.text.isEmpty) {
                          _fourController.text = "0";
                          //FocusScope.of(context).requestFocus(fnFive);
                          return;
                        }
                        if (_fiveController.text.isEmpty) {
                          _fiveController.text = "0";
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = true;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          //FocusScope.of(context).requestFocus(fnSix);
                          return;
                        }
                        if (_sixController.text.isEmpty) {
                          _sixController.text = "0";
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = true;
                            isSevenColor = false;
                          });
                          //FocusScope.of(context).requestFocus(fnSeven);
                          return;
                        }
                        if (_sevenController.text.isEmpty) {
                          _sevenController.text = "0";
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = true;
                            Future.delayed(Duration(milliseconds: 500), () {
                              AppNavigator.launchRegisterPage(context);
                            });
                            // Fluttertoast.showToast(
                            //     msg: "All fields filled",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIos: 1,
                            //     backgroundColor: Colors.white,
                            //     textColor: Colors.black,
                            //     fontSize: 16.0);
                          });
                          return;
                        }
                      },
                      child: Text(
                        "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            //fontWeight: FontWeight.w200
                        ),
                      )),
                ),
                Expanded(
                  child: InkWell(
                    child: IconButton(
                      icon: Image.asset(
                        ImageAssets.left_arrow_key,
                        height: 30,
                        width: 30,
                      ),
                      iconSize: 35.0,
                      onPressed: () {
                        Vibrate.feedback(FeedbackType.light);
                        if (_sevenController.text.isNotEmpty) {
                          _sevenController.clear();
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = true;
                            isSevenColor = false;
                          });
                          return;
                        }
                        if (_sixController.text.isNotEmpty) {
                          _sixController.clear();
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = true;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          return;
                        }
                        if (_fiveController.text.isNotEmpty) {
                          _fiveController.clear();
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = true;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          return;
                        }
                        if (_fourController.text.isNotEmpty) {
                          _fourController.clear();
                          setState(() {
                            isFirstColor = false;
                            isSecColor = false;
                            isThirdColor = true;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          return;
                        }

                        if (_thirdController.text.isNotEmpty) {
                          _thirdController.clear();
                          setState(() {
                            isFirstColor = false;
                            isSecColor = true;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          return;
                        }

                        if (_secController.text.isNotEmpty) {
                          _secController.clear();
                          setState(() {
                            isFirstColor = true;
                            isSecColor = false;
                            isThirdColor = false;
                            isFourColor = false;
                            isFiveColor = false;
                            isSixColor = false;
                            isSevenColor = false;
                          });
                          return;
                        }
                        if (_firstController.text.isNotEmpty) {
                          _firstController.clear();

                          if (_firstController.text.isEmpty) {
                            isFirstColor = false;
                          }
                          return;
                        }
                      },
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Ruchi
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class RecommendCode extends StatefulWidget {
//   static const String routeName = "RecommendCode";
//   @override
//   State<StatefulWidget> createState() {
//     return RecommendCodeState();
//   }
// }

// class RecommendCodeState extends State<RecommendCode> {
//   TextEditingController _firstController = new TextEditingController();
//   TextEditingController _secController = new TextEditingController();
//   TextEditingController _thirdController = new TextEditingController();
//   TextEditingController _fourController = new TextEditingController();
//   TextEditingController _fiveController = new TextEditingController();
//   TextEditingController _sixController = new TextEditingController();
//   TextEditingController _sevenController = new TextEditingController();

//   Color borderColor = Colors.white;
//   final fnFirst = FocusNode();
//   final fnSec = FocusNode();
//   final fnThird = FocusNode();
//   final fnFour = FocusNode();
//   final fnFive = FocusNode();
//   final fnSix = FocusNode();
//   final fnSeven = FocusNode();

//   bool isFirstColor = false;
//   bool isSecColor = false;
//   bool isThirdColor = false;
//   bool isFourColor = false;
//   bool isFiveColor = false;
//   bool isSixColor = false;
//   bool isSevenColor = false;

//   bool isFilled = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.all(8.0),
//         color: Color(0XFF273746),
//         child: Container(
//           // margin: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               buildTextButton(),
//               SizedBox(
//                 height: 25.0,
//               ),
//               buildTextEnterView(),
//               SizedBox(
//                 height: 40.0,
//               ),
//               buildNumberKeyBoard(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextEnterView() {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           new Flexible(
//             child: TextField(
//               controller: _firstController,
//               focusNode: fnFirst,
//               enabled: false,
//               style: TextStyle(
//                 fontSize: 33.0,
//               ),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 disabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                   color: isFirstColor ? Colors.white30 : Colors.white,
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           new Flexible(
//             child: new TextField(
//               controller: _secController,
//               enabled: false,
//               focusNode: fnSec,
//               style: TextStyle(fontSize: 33.0),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 disabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                   color: isSecColor ? Colors.white30 : Colors.white,
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           new Flexible(
//               child: new TextField(
//             controller: _thirdController,
//             enabled: false,
//             focusNode: fnThird,
//             style: TextStyle(fontSize: 33.0),
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               disabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                 color: isThirdColor ? Colors.white30 : Colors.white,
//               )),
//             ),
//           )),
//           SizedBox(
//             width: 10.0,
//           ),
//           new Flexible(
//             child: new TextField(
//               controller: _fourController,
//               enabled: false,
//               focusNode: fnFive,
//               style: TextStyle(fontSize: 33.0),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 disabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                   color: isFourColor ? Colors.white30 : Colors.white,
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           new Flexible(
//             child: new TextField(
//               controller: _fiveController,
//               enabled: false,
//               focusNode: fnSix,
//               style: TextStyle(fontSize: 33.0),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 disabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                   color: isFiveColor ? Colors.white30 : Colors.white,
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           new Flexible(
//             child: new TextField(
//               controller: _sixController,
//               enabled: false,
//               focusNode: fnSeven,
//               style: TextStyle(fontSize: 33.0),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 disabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                   color: isSixColor ? Colors.white30 : Colors.white,
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           new Flexible(
//             child: new TextField(
//               controller: _sevenController,
//               enabled: false,
//               style: TextStyle(fontSize: 33.0),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 disabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                   color: isSevenColor ? Colors.white30 : Colors.white,
//                 )),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget buildTextButton() {
//   //   return Container(
//   //     margin: EdgeInsets.only(top: 25.0),
//   //     child: Column(
//   //       children: <Widget>[
//   //         Text(
//   //           "Do you have Recomend Code?",
//   //           style: TextStyle(
//   //               color: Colors.white,
//   //               fontSize: 24.0,
//   //               fontWeight: FontWeight.w200),
//   //         ),
//   //         SizedBox(
//   //           height: 25.0,
//   //         ),
//   //         Container(
//   //           child: RaisedButton(
//   //             child: Text(
//   //               "No",
//   //               style: TextStyle(color: Colors.black),
//   //             ),
//   //             // focusColor: Colors.white,
//   //             color: Theme.of(context).buttonColor,
//   //             onPressed: () {},
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget buildNumberKeyBoard() {
//     return Container(
//       // margin: EdgeInsets.all(28.0),

//       child: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         InkWell(
//                             onTap: () {
//                               print('ontap');

//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "1";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "1";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "1";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "1";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "1";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "1";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "1";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "1",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "2";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "2";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "2";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "2";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "2";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "2";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "2";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "2",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "3";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "3";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "3";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "3";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "3";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "3";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "3",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 22.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "4";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "4";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "4";
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "4";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "4";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "4";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "4";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "4",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "5";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "5";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "5";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "5";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "5";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "5";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "5";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "5",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "6";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "6";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "6";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "6";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "6";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "6";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "6";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "6",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 22.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "7";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "7";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "7";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "7";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "7";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "7";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "7";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "7",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "8";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "8";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "8";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "8";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "8";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "8";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });

//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "8";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "8",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                         InkWell(
//                             onTap: () {
//                               if (_firstController.text.isEmpty) {
//                                 _firstController.text = "9";
//                                 setState(() {
//                                   isFirstColor = true;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_secController.text.isEmpty) {
//                                 _secController.text = "9";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = true;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_thirdController.text.isEmpty) {
//                                 _thirdController.text = "9";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = true;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fourController.text.isEmpty) {
//                                 _fourController.text = "9";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = true;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_fiveController.text.isEmpty) {
//                                 _fiveController.text = "9";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = true;
//                                   isSixColor = false;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sixController.text.isEmpty) {
//                                 _sixController.text = "9";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = true;
//                                   isSevenColor = false;
//                                 });
//                                 return;
//                               }
//                               if (_sevenController.text.isEmpty) {
//                                 _sevenController.text = "9";
//                                 setState(() {
//                                   isFirstColor = false;
//                                   isSecColor = false;
//                                   isThirdColor = false;
//                                   isFourColor = false;
//                                   isFiveColor = false;
//                                   isSixColor = false;
//                                   isSevenColor = true;
//                                   Fluttertoast.showToast(
//                                       msg: "All fields filled",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIos: 1,
//                                       backgroundColor: Colors.white,
//                                       textColor: Colors.black,
//                                       fontSize: 16.0);
//                                 });
//                                 return;
//                               }
//                             },
//                             child: Text(
//                               "9",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                             )),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 18.0,
//             ),
//             Row(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(left: 134.0),
//                   child: InkWell(
//                       onTap: () {
//                         if (_firstController.text.isEmpty) {
//                           _firstController.text = "0";
//                           setState(() {
//                             isFirstColor = true;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });

//                           return;
//                         }
//                         if (_secController.text.isEmpty) {
//                           _secController.text = "0";
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = true;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }
//                         if (_thirdController.text.isEmpty) {
//                           _thirdController.text = "0";
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = true;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           //FocusScope.of(context).requestFocus(fnFour);
//                           return;
//                         }
//                         if (_fourController.text.isEmpty) {
//                           _fourController.text = "0";
//                           //FocusScope.of(context).requestFocus(fnFive);
//                           return;
//                         }
//                         if (_fiveController.text.isEmpty) {
//                           _fiveController.text = "0";
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = true;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           //FocusScope.of(context).requestFocus(fnSix);
//                           return;
//                         }
//                         if (_sixController.text.isEmpty) {
//                           _sixController.text = "0";
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = true;
//                             isSevenColor = false;
//                           });
//                           //FocusScope.of(context).requestFocus(fnSeven);
//                           return;
//                         }
//                         if (_sevenController.text.isEmpty) {
//                           _sevenController.text = "0";
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = true;
//                             Fluttertoast.showToast(
//                                 msg: "All fields filled",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.CENTER,
//                                 timeInSecForIos: 1,
//                                 backgroundColor: Colors.white,
//                                 textColor: Colors.black,
//                                 fontSize: 16.0);
//                           });
//                           return;
//                         }
//                       },
//                       child: Text(
//                         "0",
//                         style: TextStyle(
//                             fontSize: 40.0,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w200),
//                       )),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 87.0),
//                   child: InkWell(
//                     child: IconButton(
//                       icon: Icon(
//                         FontAwesomeIcons.arrowLeft,
//                       ),
//                       iconSize: 35.0,
//                       onPressed: () {
//                         if (_sevenController.text.isNotEmpty) {
//                           _sevenController.clear();
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = true;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }
//                         if (_sixController.text.isNotEmpty) {
//                           _sixController.clear();
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = true;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }
//                         if (_fiveController.text.isNotEmpty) {
//                           _fiveController.clear();
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = true;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }
//                         if (_fourController.text.isNotEmpty) {
//                           _fourController.clear();
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = false;
//                             isThirdColor = true;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }

//                         if (_thirdController.text.isNotEmpty) {
//                           _thirdController.clear();
//                           setState(() {
//                             isFirstColor = false;
//                             isSecColor = true;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }

//                         if (_secController.text.isNotEmpty) {
//                           _secController.clear();
//                           setState(() {
//                             isFirstColor = true;
//                             isSecColor = false;
//                             isThirdColor = false;
//                             isFourColor = false;
//                             isFiveColor = false;
//                             isSixColor = false;
//                             isSevenColor = false;
//                           });
//                           return;
//                         }
//                         if (_firstController.text.isNotEmpty) {
//                           _firstController.clear();

//                           if (_firstController.text.isEmpty) {
//                             isFirstColor = false;
//                           }
//                           return;
//                         }
//                       },
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
