import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/models/businessDetailbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'dart:ui' as ui;

import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:vibrate/vibrate.dart';

class PostBusinessPopup {
  // 0 for post , 1 for profile = Type
  static openPopup(BuildContext contextx, int type,
      {List<SubCategories> subCat}) {
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
          child: PostBusinessBody(
            contextx: contextx,
            subCat: subCat,
            type: type,
          ),
        ),
      ),
    );
    //  });
  }
}

class PostBusinessBody extends StatefulWidget {
  final int type;
  final BuildContext contextx;
  final List<SubCategories> subCat;
  PostBusinessBody({Key key, this.contextx, this.subCat, this.type})
      : super(key: key);
  PostBusinessBodyState createState() => PostBusinessBodyState();
}

class PostBusinessBodyState extends State<PostBusinessBody> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  double width;
  double height;
//  int stage = 1;
  bool isRequestSend = false;
//  String typeOfBusiness;
  // int businessId;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: MediaQuery.of(context).size.height * 0.55,
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
              //page to ask for confiriming
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: widget.subCat.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    //
                    //list to show sub categories
                    child: InkWell(
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);

                        // 0 for post , 1 for profile = Type
                        if (widget.type == 0) {
                          AppNavigator.popBackStack(context);
                          AppNavigator.launchUploadPortfolioPics(
                              context, widget.subCat[index].categoryProfileId);
                        } else {
                          businessProfileBloc.getShopCategoryDetails(
                              context, widget.subCat[index].categoryProfileId);
                          AppNavigator.popBackStack(context);
                        }
                      },
                      borderRadius: BorderRadius.circular(23),
                      child: //Category name
                          Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //category name
                            Expanded(
                              child: Text(
                                widget.subCat.elementAt(index).categoryName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsHelper.themeBlackColor(),
                                    fontSize: 15,
                                    fontFamily:
                                        FontsHelper.fonts_Nanum_Barun_Gothic,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            //category icon
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 16),
                              alignment: Alignment.center,
                              child: Material(
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  placeholder: (context, url) => Container(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black,
                                      ),
                                    ),
                                    width: 25.0,
                                    height: 25.0,
                                    padding: EdgeInsets.all(6.0),
                                  ),
                                  imageUrl:
                                      widget.subCat.elementAt(index).icon !=
                                              null
                                          ? widget.subCat.elementAt(index).icon
                                          : StringHelper.default_Avatar,
                                  width: 25.0,
                                  height: 25.0,
                                  fit: BoxFit.cover,
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
            ],
          )),
        ),
      ),
    );
  }
}
