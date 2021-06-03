import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:me_talk/src/blocs/bloc_update_phoneno/bloc_update_phoneno.dart';
import 'package:me_talk/src/blocs/bloc_update_phoneno/update_phoneno_state.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/international_phone_input/international_phone_input.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class UpdatePhoneNo extends StatefulWidget {
  static const String routeName = "UpdatePhoneNo";
  UpdatePhoneNo({Key key}) : super(key: key);

  _UpdatePhoneNoState createState() => _UpdatePhoneNoState();
}

class _UpdatePhoneNoState extends State<UpdatePhoneNo> {
  final _formKey = GlobalKey<FormState>();
  UpdatePhoneNoBloc updatePhoneNoBloc;

  TextEditingController otpController = TextEditingController();
  String numberNO = "";
  FocusNode fnodeOtp = FocusNode();
  String countryPhoneCode,
      smsOTP,
      phoneNumber = "",
      phoneIsoCode = "KR",
      errorMessage = '';
  bool isCodeSend = true, hitSend = false, isPageLoaded = false;
  int countHitSend;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      numberNO = number;
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
      countryPhoneCode =
          internationalizedPhoneNumber.split(number)[0].split("+")[1];
      SharePreferencesHelper.getInstant().setInt(
          SharePreferencesHelper.Phone_Code, int.parse(countryPhoneCode));
    });
  }

  @override
  void initState() {
    countHitSend = 0;
    updatePhoneNoBloc = UpdatePhoneNoBloc();
    super.initState();
    updatePhoneNoBloc.isOtpSendHere.listen((onData) {
      if (onData == true) {
        setState(() {
          isCodeSend = onData;
          hitSend = false;
        });
      }
    });
    updatePhoneNoBloc.iserrorMessageHere.listen((String onData) {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: ColorsHelper.whiteColor(),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: ColorsHelper.themeBlackColor(),
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
              create: (BuildContext context) => updatePhoneNoBloc,
              child: BlocBuilder(
                bloc: updatePhoneNoBloc,
                builder: (BuildContext context, UpdatePhoneNoState state) {
                  if (state is InitialUpdatePhoneNoState) {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      color: ColorsHelper.whiteColor(),
                      child: isPageLoaded ? updatePhoneNoBody() : Container(),
                      // updatePhoneNoBody()
                    );
                  } else {
                    return Container(
                      color: Colors.black,
                    );
                  }
                },
              ),
            ),

            //Next button to next page
            bottomNavigationBar: Container(
              color: ColorsHelper.themeBlackColor(),
              height: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print(countryPhoneCode);
                    print(numberNO);
                    Vibrate.feedback(FeedbackType.light);
                    //  Saving user name and phone number in SharePreferences
                    updatePhoneNoBloc
                        .onSignUpClick(_formKey)
                        .then((onValue) async {
                      if (onValue) {
                        if (isCodeSend) {
                          updatePhoneNoBloc.saveChange(
                              smsOTP, context, numberNO, countryPhoneCode);
                          //Navigator.pop(context);
                        }
                      } else {
                        setState(() {});
                      }
                    });
                  },
                  child: Center(
                    child: Text(
                      StringHelper.save,
                      style: TextStyle(
                          fontSize: 18,
                          color: ColorsHelper.whiteColor(),
                          //fontWeight: FontWeight.w700,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget updatePhoneNoBody() {
    return Column(
      children: <Widget>[
//App logo
        // Container(
        //   //  margin: const EdgeInsets.only(top: 45, bottom: 15),
        //   width: MediaQuery.of(context).size.height * 0.1,
        //   height: MediaQuery.of(context).size.height * 0.1,
        //   child: FlareActor(
        //     'assets/loading.flr',
        //     alignment: Alignment.center,
        //     fit: BoxFit.cover,
        //     animation: "erasing",
        //     //controller: controls,
        //   ),
        // ),
//App bar
        AppBar(
          elevation: 5,
          backgroundColor: ColorsHelper.whiteColor(),
          centerTitle: true,
          title: Text(
            StringHelper.phone,
            style: TextStyle(
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                fontSize: 15,
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              ImageAssets.back_arrow,
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Vibrate.feedback(FeedbackType.light);
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              child: InkWell(
                child: Image.asset(
                  ImageAssets.notification,
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                },
              ),
            ),
          ],
        ),

        // Card(
        //   elevation: 0.0,
        //   shape: null,
        //   margin: const EdgeInsets.only(top: 43),
        //   //EdgeInsets.all(0),
        //   child: Stack(
        //     children: <Widget>[
        //       Container(
        //         color: ColorsHelper.whiteColor(),
        //         alignment: Alignment.center,
        //         height: 50,
        //         width: double.infinity,
        //       ),
        //       IconButton(
        //         icon: Image.asset(
        //           ImageAssets.back_arrow,
        //           width: 20.0,
        //           height: 20.0,
        //           fit: BoxFit.contain,
        //         ),
        //         onPressed: () {
        //           Vibrate.feedback(FeedbackType.light);
        //           // _auth.currentUser().then((user) {
        //           //   if (user != null) {
        //           //     _auth.signOut();
        //           //   }
        //           // });
        //           Navigator.of(context).pop();
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 25,
        ),
//updatePhoneNoForm
        Flexible(
          child: isPageLoaded ? updatePhoneNoForm() : Container(),
        ),
      ],
    );
  }

  Widget updatePhoneNoForm() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Form(
          autovalidate: updatePhoneNoBloc.autoValidation,
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        //Phone number feild
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              color: ColorsHelper.whiteColor(),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[500],
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: 10),
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
                      //send button
                      ButtonColor(
                        height: 57,
                        width: countHitSend == 0 ? 60 : 80,
                        color: ColorsHelper.themeBlackColor(),
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                          if (phoneNumber != null) {
                            updatePhoneNoBloc
                                .verifyPhone(phoneNumber)
                                .then((onValue) {
                              setState(() {
                                hitSend = true;
                                countHitSend++;
                              });
                            });
                          }
                        },
                        child: !hitSend
                            ? Text(
                                countHitSend == 0
                                    ? StringHelper.send
                                    : StringHelper.reSend,
                                style: TextStyle(
                                    color: ColorsHelper.whiteColor()
                                    //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                                ),
                              )
                            : Center(
                                child: SpinKitCircle(
                                color: ColorsHelper.whiteColor(),
                                size: 25.0,
                              )),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
//otp
              isCodeSend
                  ? otpFeild(StringHelper.very_code, fnodeOtp, null,
                      otpController, TextInputType.number, TextInputAction.done)
                  : Container()
            ],
          ),
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
                fontSize: 18,
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            color: ColorsHelper.whiteColor(),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                blurRadius: 6,
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
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
              (errorMessage != ''
                  ? Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    )
                  : Container()),
            ],
          ),
        ),
      ],
    );
  }
}
