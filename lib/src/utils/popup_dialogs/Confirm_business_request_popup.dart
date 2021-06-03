import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_request/bloc.dart';
import 'package:me_talk/src/data/repository/request_form_repository.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:vibrate/vibrate.dart';

class ConfirmBusinessRequestPopup {
  static openPopup(BuildContext contextx, Map<String, dynamic> requestData) {
    return showDialog(
        barrierDismissible: false,
        context: contextx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: ConfirmBusinessRequestBody(
                contextx: contextx,
                requestData: requestData,
              ),
            ),
          );
        });
  }
}

class ConfirmBusinessRequestBody extends StatefulWidget {
  final BuildContext contextx;
  final Map<String, dynamic> requestData;
  ConfirmBusinessRequestBody({Key key, this.contextx,this.requestData}) : super(key: key);
  ConfirmBusinessRequestBodyState createState() =>
      ConfirmBusinessRequestBodyState();
}

class ConfirmBusinessRequestBodyState
    extends State<ConfirmBusinessRequestBody> {
  RequestFormRepository requestFormRepository = RequestFormRepository();
  BusinessRequestBloc businessRequestBloc;
  double width;
  double height;
  bool isRequestSend = false;
  bool isAggree = false;
  @override
  void dispose() {
    businessRequestBloc.close();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    businessRequestBloc = BlocProvider.of<BusinessRequestBloc>(widget.contextx);
//    businessRequestBloc.isRequestSendHere.listen((onData) {
//      if (onData == true) {
//        setState(() {
//          isRequestSend = onData;
//          Navigator.pop(context);
//          int count = 0;
//          Navigator.popUntil(widget.contextx, (route) {
//            return count++ == 2;
//          });
//        });
//      } else {
//        print("sgsdgsd");
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Card(
          color: ColorsHelper.whiteColor(),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Cancel button
                ButtonColor(
                  height: 60,
                  width: 60,
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: ColorsHelper.grayColor(),
                    size: 60,
                  ),
                  color: ColorsHelper.whiteColor(),
                  radius: 30,
                ),
                SizedBox(
                  height: 35,
                ),
                //are_you_confirm_text
                Text(
                  StringHelper.are_you_confirm_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.black80Color(),
                      fontSize: 16,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 20,
                ),
                //you_cant_change_text
                Text(
                  StringHelper.you_cant_change_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.black80Color(),
                      fontSize: 16,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 20,
                ),
                //if_you_want_to_text
                Text(
                  StringHelper.if_you_want_to_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.black80Color(),
                      fontSize: 16,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 20,
                ),
                //if_you_make_same_overlap_text
                Text(
                  StringHelper.if_you_make_same_overlap_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.black80Color(),
                      fontSize: 16,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                //one_shop_multi_text
                Text(
                  StringHelper.one_shop_multi_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.black80Color(),
                      fontSize: 16,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          StringHelper.agreement,
                          style: TextStyle(
                              fontSize: 15,
                              //color: Colors.black,
                              fontFamily: FontsHelper
                                  .fonts_HyGothic_regular),
                        ),
                        //More button
                        GestureDetector(
                            onTap: () {
                              AppNavigator.launchAggreementScreen(context);
                            },
                            child: SizedBox(
                                height: 16,
                                width: 50,
                                child: Text(StringHelper.more,
                                    style: TextStyle(
                                        fontFamily: FontsHelper
                                            .fonts_Nanum_Barun_Gothic,
                                        decoration:
                                        TextDecoration.underline,
                                        color: Color(0xff717171),//#717171
                                        fontSize: 14)))),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        if (!isAggree){
                          isAggree = true;
                        }else{
                          isAggree = false;
                        }
                        setState(() {

                        });
                          //await Location().requestPermission();
                        },
                      icon: Image.asset(
                        isAggree
                            ? ImageAssets.black_check
                            : ImageAssets.black_uncheck,
                        width: MediaQuery.of(context).size.height *
                            0.035,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                // buttons
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: <Widget>[
                      //cancel
                      Flexible(
                        child: ButtonColor(
                          height: 35,
                          onPressed: () {
                            Vibrate.feedback(FeedbackType.light);
                            Navigator.pop(context);
                          },
                          child: Text(
                            StringHelper.cancel,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 17),
                          ),
                          color: ColorsHelper.black80Color(),
                          radius: 10,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //Request
                      Flexible(
                        child: ButtonColor(
                          height: 35,
                          onPressed: () {
                            Vibrate.feedback(FeedbackType.light);
                            if(isAggree){
                              requestFormRepository.requestFormApiCall(context,widget.requestData).then((onValue) {
                                if (onValue!=null) {
                                }else{
                                }
                              });
                            }else{
                              PopupDialogs.displayMessageOnly(context, StringHelper.accept_agreement);
                            }
                             //businessRequestBloc.add(SendRequest(widget.contextx));

//                            setState(() {
//                              // isRequestSend = onData;
//                              Navigator.pop(context);
//                              int count = 0;
//                              Navigator.popUntil(widget.contextx, (route) {
//                                return count++ == 2;
//                              });
//                            });
                            // Navigator.pop(context);
                            // int count = 0;
                            // Navigator.popUntil(widget.contextx, (route) {
                            //   return count++ == 2;
                            // });
                          },
                          child: Text(
                            StringHelper.request,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 17),
                          ),
                          color: ColorsHelper.themeBlackColor(),
                          radius: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
