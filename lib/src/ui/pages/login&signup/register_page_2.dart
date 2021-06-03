import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_register_page2/bloc_register_page2.dart';
import 'package:me_talk/src/blocs/bloc_register_page2/register_page2_state.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class RegisterPage2 extends StatefulWidget {
  static const String routeName = "RegisterPage2";
  final String phoneNumber,phoneCode;
  RegisterPage2({Key key,this.phoneNumber,this.phoneCode}):super(key:key);

  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  RegisterPageBloc2 registerPageBloc2;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();

  FocusNode fnodeEmail = FocusNode();
  FocusNode fnodePw = FocusNode();
  FocusNode fnodeConfirmPw = FocusNode();

  FirebaseAuth _auth = FirebaseAuth.instance;

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
    registerPageBloc2 = RegisterPageBloc2();
    super.initState();
  }

  @override
  void dispose() {
    registerPageBloc2.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(children: <Widget>[
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
              create: (BuildContext context) => registerPageBloc2,
              child: BlocBuilder(
                bloc: registerPageBloc2,
                builder: (BuildContext context, RegisterPage2State state) {
                  return Container(
                      color: Colors.white,
                      //padding: EdgeInsets.only(top: 10),
                      child: registrationPage2Body());
                },
              ),
            ),

//OK button
            bottomNavigationBar: Container(
              color: ColorsHelper.blackBgColor(),
              height: MediaQuery.of(context).size.height*.1,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Vibrate.feedback(FeedbackType.light);
                    AppNavigator.launchDashboard(context);
//                     setState(() {
//                       registerPageBloc2
//                           .onOkClick(_formKey, context,widget.phoneNumber,widget.phoneCode)
//                           .then((onValue) {
//                         if (onValue) {
//                           if (pwController.text == confirmPwController.text) {
//                             SharePreferencesHelper.getInstant().setString(
//                                 SharePreferencesHelper.User_Email,
//                                 emailController.text);
//                             SharePreferencesHelper.getInstant().setString(
//                                 SharePreferencesHelper.Password,
//                                 confirmPwController.text);
//                           } else {
//                             setState(() {
//                               PopupDialogs.displayMessage(
//                                   context, StringHelper.confirm_PW_And_text);
//                             });
//                           }
//                         }
//                       });
//                     });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:EdgeInsets.only(bottom:MediaQuery.of(context).size.height*.035),
                    child: Text(
                      StringHelper.register,
                      style: TextStyle(
                          color: Colors.white,
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
      ]),
      onWillPop: onBackPress,
    );
  }

  Widget registrationPage2Body() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Column(
          children: <Widget>[
//App logo
            Container(
              //    margin: const EdgeInsets.only(top: 45, bottom: 15),
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
              margin: EdgeInsets.only(top:16),
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
                            color: Colors.white,
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        ),
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
              child: registrationForm2(),
            ),
          ],
        ),
        //App logo
        Container(
          margin: const EdgeInsets.only(top: 27),
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

  Widget registrationForm2() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(31, 8, 31, 30),
        child: Form(
          autovalidate: registerPageBloc2.autoValidation,
          key: _formKey,
          child: Column(
            children: <Widget>[
              nameFeild(StringHelper.id_title, fnodeEmail, fnodePw, emailController,
                  TextInputType.emailAddress, TextInputAction.next),
              SizedBox(
                height: 30,
              ),
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
          ),
        ),
      ),
    );
  }

  Widget nameFeild(
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
          height: 39,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 30,
                  offset: Offset(0, 3)
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            focusNode: focusNode,
            onFieldSubmitted: (str) =>
                FocusScope.of(context).requestFocus(nextFocusNode),
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              return CommonValidator.emailValidation(value);
            },
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.5),
                ),
              hintStyle: TextStyle(fontSize: 20, color:  Color(0xffC5C5C5)),
              hintText: StringHelper.e_mail,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
                //fillColor: Colors.white
            ),
          ),
        ),
      ],
    );
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
          height: 15,
        ),
        Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19.0)),
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
            style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
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
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.5),
                ),
                //hintStyle: TextStyle(fontSize: 20, color:  Color(0xffC5C5C5)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
                //fillColor: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
