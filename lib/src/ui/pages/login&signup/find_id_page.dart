import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:me_talk/src/blocs/bloc_register_page/bloc_register_page.dart';
import 'package:me_talk/src/blocs/bloc_register_page/register_page_state.dart';
import 'package:me_talk/src/data/repository/Findid_repository.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';

import 'package:me_talk/src/utils/international_phone_input/international_phone_input.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';


class FindIDPage extends StatefulWidget {
  static const String routeName = "FindIDPage";

  final bool idFromFindIDClick;
  FindIDPage({Key key,this.idFromFindIDClick}):super(key:key);

  @override
  _FindIDPageState createState() => _FindIDPageState();
}

class _FindIDPageState extends State<FindIDPage> {
  final _formKey = GlobalKey<FormState>();
  RegisterPageBloc registerPageBloc;
  TextEditingController otpController = TextEditingController();
  FindIDPageRepository findPIDRepository = FindIDPageRepository();

  FocusNode fnodeName = FocusNode();
  FocusNode fnodeUserName = FocusNode();
  FocusNode fnodeOtp = FocusNode();

  String phoneNumber = "";
  String phoneIsoCode = "KR";

  String countryPhoneCode;

  String smsOTP;
  String errorMessage = '';
  String gender = StringHelper.woman.toUpperCase();
  List<String> genders = [
    StringHelper.woman.toUpperCase(),
    StringHelper.man.toUpperCase(),
    StringHelper.other.toUpperCase()
  ];
  bool isCodeSend = false;
  bool accepted = false;
  bool hitSend = false;

  int countHitSend;

  bool isPageLoaded = false;

  FirebaseAuth _auth = FirebaseAuth.instance;


  TextEditingController _userEmailController;
  String userEmail;

  @override
  void initState() {
    // TODO: implement initState
    countHitSend = 0;
    registerPageBloc = RegisterPageBloc();
    super.initState();
    registerPageBloc.isOtpSendHere.listen((onData) {
      if (onData == true) {
        setState(() {
          isCodeSend = onData;
          hitSend = false;
        });
      }
    });
    registerPageBloc.iserrorMessageHere.listen((String onData) {
      setState(() {
        if (onData != null) {
          errorMessage = onData;
        } else {
          errorMessage = '';
        }
      });
    });
    Future.delayed(Duration(milliseconds: 455), () {
      setState(() {
        isPageLoaded = true;
      });
    });
    _userEmailController = TextEditingController();
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
        child: BlocBuilder(
          bloc: registerPageBloc,
          builder: (BuildContext context, RegisterPageState state) {
            return Container(
                color: ColorsHelper.whiteColor(),
                child: Column(
                  children: <Widget>[
//                    Container(
//                      margin: const EdgeInsets.only(top: 45, bottom: 15),
//                      width: MediaQuery.of(context).size.height * 0.1,
//                      height: MediaQuery.of(context).size.height * 0.1,
//                      child: FlareActor(
//                        'assets/logo_chactor.flr',
//                        alignment: Alignment.center,
//                        fit: BoxFit.cover,
//                        animation: "Logo",
//                        //controller: controls,
//                      ),
//                    ),
//                    Card(
//                      elevation: 0.0,
//                      shape: null,
//                      margin: EdgeInsets.all(0),
//                      child: Stack(
//                        children: <Widget>[
//                          Container(
//                            color: Colors.transparent,
//                            alignment: Alignment.center,
//                            height: 50,
//                            width: double.infinity,
//                          ),
//                          IconButton(
//                            icon: Image.asset(
//                              ImageAssets.back_arrow,
//                              width: 20.0,
//                              height: 20.0,
//                              fit: BoxFit.contain,
//                            ),
//                            onPressed: () {
//                              Vibrate.feedback(FeedbackType.light);
//                              Navigator.of(context).pop();
//                            },
//                          )
//                        ],
//                      ),
//                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        //behavior: ListViewScrollBehavior(),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(29, 5, 29, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
//                              Container(
//                                  alignment: Alignment.center,
//                                  width: double.infinity,
//                                  child: Text(
//                                    StringHelper.str_verify_mobile,
//                                    style: TextStyle(
//                                        color: ColorsHelper.themeBlackColor(),
//                                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
//                                        fontWeight: FontWeight.w700,
//                                        fontSize: 25),
//                                  )),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  StringHelper.phone_number,
                                  style: TextStyle(
                                      fontSize: 20,
                                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                      //fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    //Phone number feild
                                    child: Container(
//                                        decoration: BoxDecoration(
//                                          borderRadius:
//                                          BorderRadius.all(Radius.circular(7.0)),
//                                          color: ColorsHelper.whiteColor(),
//                                          boxShadow: [
//                                            BoxShadow(
//                                              color: Colors.grey[500],
//                                              blurRadius: 6,
//                                            ),
//                                          ],
//                                        ),
                                        height: 38,
                                        padding: EdgeInsets.only(left: 0),
                                        child: InternationalPhoneInput(
                                          onPhoneNumberChange: onPhoneNumberChange,
                                          initialPhoneNumber: phoneNumber,
                                          initialSelection: phoneIsoCode,
                                          errorMaxLines: 1,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Vibrate.feedback(FeedbackType.light);
//                                        if (phoneNumber != null) {
//                                          registerPageBloc
//                                              .verifyPhone(phoneNumber)
//                                              .then((onValue) {
//                                            setState(() {
//                                              hitSend = true;
//                                              countHitSend++;
//                                            });
//                                          });
//                                        }
                                      },
                                      child: Container(
                                        height: 38,
                                        width: countHitSend == 0 ? 52 : 80,
                                        decoration: new BoxDecoration(
                                          color:ColorsHelper.blackBgColor(),
                                          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.51),
                                              blurRadius: 15.0, // has the effect of softening the shadow
                                              //spreadRadius: 1.3, // has the effect of extending the shadow
                                              offset: Offset(
                                                3, // horizontal, move right 10
                                                3, // vertical, move down 10
                                              ),
                                            )
                                          ],
                                        ),
                                        child: !hitSend
                                            ? Center(
                                          child: Text(
                                            countHitSend == 0
                                                ? StringHelper.send
                                                : StringHelper.reSend,
                                            style: TextStyle(
                                              color: ColorsHelper.whiteColor(),
                                              fontSize: 13,
                                              //fontFamily: FontsHelper.fonts_Poppins_Medium,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                            : Center(
                                            child: SpinKitCircle(
                                              color: ColorsHelper.whiteColor(),
                                              size: 25.0,
                                            )),
                                      )
                                  ),
                                  //send button
//                                  ButtonColor(
//                                    height: 48,
//                                    width: countHitSend == 0 ? 60 : 80,
//                                    color: ColorsHelper.themeBlackColor(),
//                                    onPressed: () {
//                                      Vibrate.feedback(FeedbackType.light);
//                                      if (phoneNumber != null) {
//                                registerPageBloc
//                                    .verifyPhone(phoneNumber)
//                                    .then((onValue) {
//                                  setState(() {
//                                    hitSend = true;
//                                    countHitSend++;
//                                  });
//                                });
//                                      }
//                                    },
//                                    child: !hitSend
//                                        ? Text(
//                                      countHitSend == 0
//                                          ? StringHelper.send
//                                          : StringHelper.reSend,
//                                      style: TextStyle(
//                                          color: ColorsHelper.whiteColor(),
//                                         // fontFamily:FontsHelper.fonts_Nanum_Barun_Gothic,
//                                          //fontWeight: FontWeight.w700
//                                      ),
//                                    )
//                                        : Center(
//                                        child: SpinKitCircle(
//                                          color: ColorsHelper.whiteColor(),
//                                          size: 25.0,
//                                        )),
//                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              otpFeild(StringHelper.very_code, fnodeOtp, null, otpController,
                                  TextInputType.number, TextInputAction.done),
                              (errorMessage != ''
                                  ? Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red),
                              )
                                  : Container()),
                              SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  if(widget.idFromFindIDClick){
                                    Navigator.of(context).pop();
                                  }else{
                                    AppNavigator.launchFindPWPage(context,'');
                                  }

//                                  registerPageBloc
//                                      .checkOTP(smsOTP, context)
//                                      .then((onValue) {
//                                    setState(() {
//                                      String number = phoneNumber.split(countryPhoneCode.toString())[1];
//                                      print('OTP verified');
//                                      if(widget.idFromFindIDClick){
//                                        findPIDRepository.findIdApiCall(context,number).then((onValue) {
//                                        });
//                                      }else{
//                                        AppNavigator.launchFindPWPage(context,number);
//                                      }
//                                    });
//                                  });
                                },
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
                                      StringHelper.find,
                                      style: TextStyle(
                                          color: ColorsHelper.whiteColor(),
                                          fontSize: 20,
                                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                                      ),
                                    ),
                                  ),
                                ),
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
                ),);
          },
        ),
      ),
    );
  }

  Future<bool> onBackPress() {
    Vibrate.feedback(FeedbackType.light);
    _auth.currentUser().then((user) {
      if (user != null) {
        _auth.signOut();
      }
    });
    Navigator.of(context).pop();
    return Future.value(false);
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
      countryPhoneCode =
      internationalizedPhoneNumber.split(number)[0].split("+")[1];
      SharePreferencesHelper.getInstant().setInt(
          SharePreferencesHelper.Phone_Code, int.parse(countryPhoneCode));
    });
  }

  Widget commonTextFormField(
      {String hint,
        String imageAssets,
        String validation(String val),
        TextEditingController controller,
        textInputType = TextInputType.text,
        int maxLine = 1,
        FocusNode focusNode,
        FocusNode nextFocusNode,
        int maxLength = 100,
        obscureText = false,
        textCapitalization = TextCapitalization.sentences,
        TextInputAction textInputAction,
        String save(String val)}) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLines: maxLine,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        controller: controller,
        keyboardType: textInputType,
        validator: validation,
        cursorColor: ColorsHelper.themeBlackColor(),
        style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 22.0),
        obscureText: obscureText,
        onSaved: save,
        focusNode: focusNode,
        onFieldSubmitted: (str) =>
        nextFocusNode != null
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : null,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.themeBlackColor()),
          ),
          hintText: hint,
          hintStyle:
          TextStyle(color: ColorsHelper.txtHintEditText(), fontSize: 22),
        ),
      ),
    );

  }

  Widget otpFeild(
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
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                //fontWeight: FontWeight.w700
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
            color: ColorsHelper.whiteColor(),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 30,
                  offset: Offset(0, 3)
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 15, right: 15,bottom: 8),
          child: TextFormField(
            onChanged: (value) {
              this.smsOTP = value;
            },
            focusNode: focusNode,
            onFieldSubmitted: (str) => nextFocusNode != null
                ? FocusScope.of(context).requestFocus(nextFocusNode)
                : null,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              return CommonValidator.otpValidation(value);
            },
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: ColorsHelper.whiteColor()),
          ),
        ),
      ],
    );
  }

  void _onForgotPassword() {
    if (_formKey.currentState.validate()) {
//      If all data are correct then save data to out variables
      _formKey.currentState.save();

      print("Clicked on forgot password : ");
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatePassword(email: userEmail)),
      );*/
      //forgotPasswordAPICall();
    } else {
      setState(() {
        //_autoValidation = true;
      });
    }
  }

//  void forgotPasswordAPICall() async {
//    ForgotPasswordResponse _response =
//    (await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .forgotPassword(context, userEmail));
//
//    if (_response.status) {
//      /*Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => CreatePassword(email: userEmail)),
//      );*/
//      Utility.showAlertDialogCallBack(
//          context: context,
//          message: _response.message,
//          onPosClick: Navigator.pop(context));
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

}
