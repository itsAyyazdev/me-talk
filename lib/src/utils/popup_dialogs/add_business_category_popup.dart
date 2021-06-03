import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'dart:ui' as ui;

import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:vibrate/vibrate.dart';

class AddBusinessCategoryPopup {
  static openPopup(BuildContext contextx, int businessId) {
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
          child: AddBusinessCategoryBody(
            contextx: contextx,
            businessId: businessId,
          ),
        ),
      ),
    );
    //  });
  }
}

class AddBusinessCategoryBody extends StatefulWidget {
  final BuildContext contextx;
  final int businessId;
  AddBusinessCategoryBody({Key key, this.contextx, this.businessId})
      : super(key: key);
  AddBusinessCategoryBodyState createState() => AddBusinessCategoryBodyState();
}

class AddBusinessCategoryBodyState extends State<AddBusinessCategoryBody> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  double width;
  double height;
  int stage = 1;
  bool isRequestSend = false;
  String typeOfBusiness;
  int subCatId;
  @override
  initState() {
    super.initState();
  }

  Future setTypeOfBusiness() async {
    typeOfBusiness = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Type_of_business);
    subCatId = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Business_Id);
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
            child: stage == 1
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(StringHelper.will_add_category,
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
                              setState(() {
                                stage = 2;
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
                  )
                :
                // Page to select business
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(StringHelper.add_business_category,
                          style: TextStyle(
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Container(
                          //   margin: EdgeInsets.only(left: 5),
                          //   child: Text(
                          //     StringHelper.type_of_business,
                          //     style: TextStyle(
                          //         fontSize: 16,
                          //         fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                          //   ),
                          // ),
                          SizedBox(
                            height: 9,
                          ),
                          InkWell(
                            onTap: () {
                              Vibrate.feedback(FeedbackType.light);
                              Navigator.pushNamed(
                                context,
                                TypeOfBusiness.routeName,
                                arguments: 'Shop',
                              ).then((onValue) {
                                setState(() {
                                  setTypeOfBusiness();
                                });
                              });
                            },
                            child: Container(
                              height: 43,
                              width: 150,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                typeOfBusiness ?? StringHelper.select_category,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            width: typeOfBusiness == null ? 0 : 30,
                          ),
                          typeOfBusiness == null
                              ? SizedBox(
                                  width: 0,
                                )
                              : FloatingActionButton(
                                  mini: true,
                                  heroTag: "next check button",
                                  splashColor: ColorsHelper.grayColor(),
                                  onPressed: () async {
                                    Vibrate.feedback(FeedbackType.light);
                                    print("sdg");
                                    AppNavigator.popBackStack(context);
                                    await businessProfileBloc
                                        .addBusinessCategory(widget.contextx,
                                            widget.businessId, subCatId)
                                        .then((onValue) {
                                      AppNavigator.popBackStack(context);
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                  ),
                                  backgroundColor:
                                      ColorsHelper.themeBlackColor(),
                                )
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
