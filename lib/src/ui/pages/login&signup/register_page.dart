import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/blocs/bloc_register_page/bloc_register_page.dart';
import 'package:me_talk/src/blocs/bloc_register_page/register_page_state.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/international_phone_input/international_phone_input.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "RegisterPage";

  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  RegisterPageBloc registerPageBloc;

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FocusNode fnodeName = FocusNode();
  FocusNode fnodeUserName = FocusNode();
  FocusNode fnodeOtp = FocusNode();

  String phoneNumber = "";
  String phoneIsoCode = "KR";

  String countryPhoneCode;

  String smsOTP;
  String errorMessage = '';
  String gender = StringHelper.man.toUpperCase();
  List<String> genders = [
    StringHelper.man.toUpperCase(),
    StringHelper.woman.toUpperCase(),
    StringHelper.other.toUpperCase()
  ];
  bool isCodeSend = false;
  bool accepted = false;
  bool hitSend = false;

  int countHitSend;

  bool isPageLoaded = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

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

  @override
  void initState() {
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
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: ColorsHelper.whiteColor(),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: ColorsHelper.blackBgColor(),
                ),
              ],
            ),
            SafeArea(
              left: false,
              right: false,
              top: false,
              bottom: true,
              child: Scaffold(
                body: BlocProvider(
                  create: (BuildContext context) => registerPageBloc,
                  child: BlocBuilder(
                    bloc: registerPageBloc,
                    builder: (BuildContext context, RegisterPageState state) {
                      return Container(
                          color: ColorsHelper.whiteColor(),
                          child: registrationPageBody());
                    },
                  ),
                ),
                //Next button to next page
                bottomNavigationBar: Container(
                  color: ColorsHelper.blackBgColor(),
                  height:MediaQuery.of(context).size.height*.1,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        AppNavigator.launchRegisterPage2(context,'','');
                        // Saving user name and phone number in SharePreferences
//                        registerPageBloc
//                            .onSignUpClick(_formKey)
//                            .then((onValue) {
//                          if (onValue) {
//                            if (isCodeSend) {
//                              if (accepted) {
//                                registerPageBloc
//                                    .nextPage(smsOTP, context, phoneNumber,
//                                        countryPhoneCode)
//                                    .then((onValue) {
//                                  setState(() {
//                                    SharePreferencesHelper.getInstant()
//                                        .setString(
//                                            SharePreferencesHelper.User_Name,
//                                            userNameController.text);
//                                    SharePreferencesHelper.getInstant()
//                                        .setString(
//                                            SharePreferencesHelper.Gender,
//                                            gender);
//                                    SharePreferencesHelper.getInstant()
//                                        .setString(
//                                            SharePreferencesHelper.Phone_No,
//                                            phoneNumber);
//                                  });
//                                });
//                              } else {
//                                PopupDialogs.displayInformationMessage(
//                                    context,
//                                    StringHelper
//                                        .accept_personal_info_agreement);
//                              }
//                            }
//                          } else {
//                            setState(() {});
//                          }
//                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.035),
                        child: Text(
                          StringHelper.next,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              //fontWeight: FontWeight.w700,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: onBackPress,
    );
  }

  Widget registrationPageBody() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              //  margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.height * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              // child: FlareActor(
              //   'assets/loading.flr',
              //   alignment: Alignment.center,
              //   fit: BoxFit.cover,
              //   animation: "erasing",
              //   //controller: controls,
              // ),
            ),
//App bar
            Card(
              elevation: 0.0,
              shape: null,
              margin: EdgeInsets.only(top: 15),
              child: Stack(
                children: <Widget>[
                  Container(
                      color: ColorsHelper.blackBgColor(),
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        StringHelper.register_page_title,
                        style: TextStyle(
                            color: ColorsHelper.whiteColor(),
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            fontSize: 13,fontWeight: FontWeight.bold,),
                      )),
                  // IconButton(
                  //   icon: Image.asset(
                  //     ImageAssets.back,
                  //     width: 20.0,
                  //     height: 20.0,
                  //     fit: BoxFit.contain,
                  //   ),
                  //   onPressed: () {
                  //     Vibrate.feedback(FeedbackType.light);
                  //     _auth.currentUser().then((user) {
                  //       if (user != null) {
                  //         _auth.signOut();
                  //       }
                  //     });
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
//registrationForm
            Flexible(
              child: isPageLoaded ? registrationForm() : Container(),
            ),
          ],
        ),
        //App logo
        Container(
          //color: Colors.black12,
          margin: const EdgeInsets.only(top: 26),
          padding: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.height * 0.15,
          height: MediaQuery.of(context).size.height * 0.11,
          child: FlareActor(
            'assets/logo_chactor.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: "Logo",
            //controller: controls,
          ),
        ),
      ],
    );
  }

  Widget registrationForm() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(31, 8, 31, 5),
        child: Form(
          autovalidate: registerPageBloc.autoValidation,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//Username
              userNameFeild(StringHelper.user_name, fnodeUserName, null,
                  userNameController, TextInputType.text, TextInputAction.done),
              SizedBox(
                height: 30,
              ),
//Phone number
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      StringHelper.phone_number,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
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
//                            decoration: BoxDecoration(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(20.0)),
//                              color: ColorsHelper.whiteColor(),
//                              boxShadow: [
//                                BoxShadow(
//                                    color: Colors.black.withOpacity(0.18),
//                                    blurRadius: 30,
//                                    offset: Offset(0, 3)
//                                ),
//                              ],
//                            ),
                            height: 38,
                            padding: EdgeInsets.only(left: 0),
                            child: InternationalPhoneInput(
                              onPhoneNumberChange: onPhoneNumberChange,
                              initialPhoneNumber: phoneNumber,
                              initialSelection: phoneIsoCode,
                              errorMaxLines: 2,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //send button
                      InkWell(
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
//                          if (phoneNumber != null) {
//                            registerPageBloc
//                                .verifyPhone(phoneNumber)
//                                .then((onValue) {
//                              setState(() {
//                                hitSend = true;
//                                countHitSend++;
//                              });
//                            });
//                          }
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
//otp
              // isCodeSend

              // ?
              otpFeild(StringHelper.very_code, fnodeOtp, null, otpController,
                  TextInputType.number, TextInputAction.done),
              (errorMessage != ''
                  ? Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              )
                  : Container()),
              SizedBox(
                height: 30,
              ),
              Text(
                "GENDER",
                style: TextStyle(
                    //decorationThickness: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      )
                    ],
                    //fontFamily: FontsHelper.fonts_medium
                    //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,

                    ),
              ),
              //Gender dropdown
              Container(
                height:35,
                margin: EdgeInsets.only(top: 5, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: ColorsHelper.whiteColor(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 25, right: 25),
                width: MediaQuery.of(context).size.width / 3,
                child: Center(
                  child: DropdownButton<String>(
                    value: gender,
                    isExpanded: true,
                    hint: Text("Select"),
                    onChanged: (str) {
                      setState(() {
                        gender = str;
                        SharePreferencesHelper.getInstant()
                            .setString(SharePreferencesHelper.Gender, gender);
                      });
                    },
                    items: new List.generate(3, (int index) {
                      return new DropdownMenuItem<String>(
                          value: genders.elementAt(index),
                          child: new Text(
                            genders.elementAt(index),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ));
                    }),
                    iconSize: 15,
                    icon: Icon(FontAwesomeIcons.chevronDown),
                    underline: SizedBox(
                      height: 0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            StringHelper.personal_info_agreement,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 15,
                                //fontFamily: FontsHelper.fonts_HyGothic_regular
                            ),
                          ),
                          //More button
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                                onTap: () {
                                  AppNavigator.launchAggreementScreen(context);
                                },
                                child: SizedBox(
                                    height: 16,
                                    width: 50,
                                    child: Text(StringHelper.more,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color:
                                                ColorsHelper.grey71TextColor(),
                                            fontSize: 15,
                                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                                        )))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () async {
                          Vibrate.feedback(FeedbackType.light);
                          setState(() {
                            accepted = !accepted;
                          });
                        },
                        child: Image.asset(
                          accepted
                              ? ImageAssets.black_check
                              : ImageAssets.black_uncheck,
                          height: 32,
                          width: 32,
                          fit: BoxFit.contain,
                          //width: MediaQuery.of(context).size.height * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userNameFeild(
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
              fontSize: 18,
              fontWeight: FontWeight.bold
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
            borderRadius: BorderRadius.all(Radius.circular(19.0)),
            color: ColorsHelper.whiteColor(),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 30,
                  offset: Offset(0, 3)),
            ],
          ),
          padding: EdgeInsets.only(left: 15, right: 15,bottom: 8),
          child: TextFormField(
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.top,
            onFieldSubmitted: (str) =>
                FocusScope.of(context).requestFocus(nextFocusNode),
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              return CommonValidator.emptyValidation(value);
            },
            scrollPadding: EdgeInsets.all(0),
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            maxLines: 1,
            style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.transparent, width: 1.5),
              ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              //hintStyle: TextStyle(fontSize: 20, color:  Color(0xffC5C5C5)),
            ),
          ),
        ),
      ],
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
              fontSize: 18,
              fontWeight: FontWeight.bold
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
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                  color: ColorsHelper.whiteColor(),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 30,
                        offset: Offset(0, 3)),
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
                  style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
                  controller: controller,
                  keyboardType: textInputType,
                  textInputAction: textInputAction,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    //hintStyle: TextStyle(fontSize: 20, color:  Color(0xffC5C5C5)),
                    //fillColor: ColorsHelper.greyTextColor(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                },
                child: Container(
                  height: 38,
                  width: 52,
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
                  child: Center(
                    child: Text(
                      StringHelper.OK,
                      style: TextStyle(
                        color: ColorsHelper.whiteColor(),
                        fontSize: 13,
                        //fontFamily: FontsHelper.fonts_Poppins_Medium,
                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
            ),
//            ButtonColor(
//                blurRadius: 30,
//                color: ColorsHelper.blackBgColor(),
//                onPressed: () {
//                  Vibrate.feedback(FeedbackType.light);
////                      if (phoneNumber != null) {
////                        registerPageBloc
////                            .verifyPhone(phoneNumber)
////                            .then((onValue) {
////                          setState(() {
////                            hitSend = true;
////                            countHitSend++;
////                          });
////                        });
////                      }
//                },
//                child: Text(
//                  StringHelper.OK,
//                  style: TextStyle(
//                    color: ColorsHelper.whiteColor(),
//                    fontSize: 13,
//                    //fontFamily: FontsHelper.fonts_Poppins_Medium,
//                    //fontWeight: FontWeight.w700,
//                  ),
//                )),
          ],
        ),
      ],
    );
  }
}
