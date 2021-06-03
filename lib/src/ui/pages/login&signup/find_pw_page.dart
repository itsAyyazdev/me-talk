import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:me_talk/src/data/repository/FindPw_repositiry.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class FindPwPage extends StatefulWidget {
  static const String routeName = "FindPwPage";

  final String phoneNumber;
  FindPwPage({Key key,this.phoneNumber}):super(key:key);

  @override
  _FindPwPageState createState() => _FindPwPageState();
}

class _FindPwPageState extends State<FindPwPage> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidation = false;
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();
  FindPWRepository findPWRepository = FindPWRepository();

  FocusNode fnodePw = FocusNode();
  FocusNode fnodeConfirmPw = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsHelper.whiteColor(),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            ImageAssets.back_arrow,
            width: 20.0,
            height: 20.0,
            fit: BoxFit.contain,
          ),onPressed: () {
          Vibrate.feedback(FeedbackType.light);
          Navigator.of(context).pop();
        },
        ),
        centerTitle: true,
        title: Container(
          //  margin: const EdgeInsets.only(top: 45, bottom: 15),
          width: MediaQuery.of(context).size.height *
              (Platform.isIOS ? 0.15 : 0.12),
          height: MediaQuery.of(context).size.height *
              (Platform.isIOS ? 0.11 : 0.10),
          child: FlareActor(
            'assets/logo_chactor.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: "Logo",
            //controller: controls,
          ),
        ),
      ),
      backgroundColor: ColorsHelper.whiteColor(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
//            Container(
//              margin: const EdgeInsets.only(top: 45, bottom: 15),
//              width: MediaQuery.of(context).size.height * 0.1,
//              height: MediaQuery.of(context).size.height * 0.1,
//              child: FlareActor(
//                'assets/logo_chactor.flr',
//                alignment: Alignment.center,
//                fit: BoxFit.cover,
//                animation: "Logo",
//                //controller: controls,
//              ),
//            ),
////App bar
//            Card(
//              elevation: 0.0,
//              shape: null,
//              margin: EdgeInsets.all(0),
//              child: Stack(
//                children: <Widget>[
//                  Container(
//                    color: Colors.transparent,
//                    alignment: Alignment.center,
//                    height: 50,
//                    width: double.infinity,
//                  ),
//                  IconButton(
//                    icon: Image.asset(
//                      ImageAssets.back_arrow,
//                      width: 20.0,
//                      height: 20.0,
//                      fit: BoxFit.contain,
//                    ),
//                    onPressed: () {
//                      Vibrate.feedback(FeedbackType.light);
//                      Navigator.of(context).pop();
//                    },
//                  )
//                ],
//              ),
//            ),
            SizedBox(
              height: 25,
            ),
            Flexible(
              child: SingleChildScrollView(
                //behavior: ListViewScrollBehavior(),
                child: Container(
                  margin: EdgeInsets.fromLTRB(29, 5, 29, 5),
                  child: Column(
                    children: <Widget>[
//                      Container(
//                          alignment: Alignment.center,
//                          width: double.infinity,
//                          child: Text(
//                            StringHelper.str_find_pw,
//                            style: TextStyle(
//                                color: ColorsHelper.themeBlackColor(),
//                                fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                                fontWeight: FontWeight.w700,
//                                fontSize: 25),
//                          )),
                      SizedBox(
                        height: 60,
                      ),
                      Form(
                          key: _formKey,
                          autovalidate: _autoValidation,
                          child: _formField()),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        child: Container(
                          height: 39,
                          width: MediaQuery.of(context).size.width-61,
                          decoration: new BoxDecoration(
                            color:ColorsHelper.blackBgColor(),
                            borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                            border: Border.all(
                              width: 1,
                              color: ColorsHelper.greyTextColor(),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6.0, // has the effect of softening the shadow
                                //spreadRadius: 1.3, // has the effect of extending the shadow
                                offset: Offset(
                                  0, // horizontal, move right 10
                                  3, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              StringHelper.submit,
                              style: TextStyle(
                                  color: ColorsHelper.whiteColor(),
                                  fontSize: 20,
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          int count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                         // _onForgotPassword();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _formField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        passwordFeild(StringHelper.pw, fnodePw, fnodeConfirmPw,
            pwController, TextInputType.text, TextInputAction.next),
        SizedBox(
          height: 30,
        ),
        passwordFeild(
            StringHelper.confirm_pw,
            fnodeConfirmPw,
            null,
            confirmPwController,
            TextInputType.text,
            TextInputAction.done),
      ],
    );
  }

    void _onForgotPassword() {
      if (_formKey.currentState.validate()) {
//      If all data are correct then save data to out variables
        _formKey.currentState.save();
        print("Clicked on forgot password : ");
        findPWRepository.findPWApiCall(context,widget.phoneNumber,pwController.text).then((onValue) {

        });
        /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatePassword(email: userEmail)),
      );*/
        //forgotPasswordAPICall();
      } else {
        setState(() {
          _autoValidation = true;
        });
      }
    }

  Widget passwordFeild(
      String heading,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController controller,
      TextInputType textInputType,
      TextInputAction textInputAction,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(
            heading,
            style: TextStyle(
                fontSize: 20,
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(28.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 30,
                  offset: Offset(0, 3)
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 15, right: 15,bottom: 6),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: true,
            onFieldSubmitted: (str) => nextFocusNode != null
                ? FocusScope.of(context).requestFocus(nextFocusNode)
                : null,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (nextFocusNode == null &&
                  pwController.text != confirmPwController.text) {
                return "Confirm PW and PW do not match";
              }
              return CommonValidator.passValidation(value);
            },
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.white),
          ),
        ),
      ],
    );
  }

  }
