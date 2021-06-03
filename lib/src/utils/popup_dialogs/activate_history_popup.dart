import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_type_of_business/bloc.dart';
import 'package:me_talk/src/models/categoryListbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/ui/pages/profile/activateHistory.dart';
import 'package:me_talk/src/ui/pages/profile/userProfile.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:vibrate/vibrate.dart';


class ActivateHistoryPopup {
  static openPopup(BuildContext contextx) {
    return showDialog(
        barrierDismissible: false,
        context: contextx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: ActivateHistoryBody(
                contextx: contextx,
              ),
            ),
          );
        });
  }
}

class ActivateHistoryBody extends StatefulWidget {
  final BuildContext contextx;

  ActivateHistoryBody({Key key, this.contextx}) : super(key: key);
  ActivateHistoryBodyState createState() => ActivateHistoryBodyState();
}

class ActivateHistoryBodyState extends State<ActivateHistoryBody> {
  double width;
  double height;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Card(
          color: ColorsHelper.themeBlackColor(),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                //Title
                Text(
                  StringHelper.activate_History_single,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 18,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                SizedBox(
                  height: 40,
                ),
                //1st row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Request
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => new HistoryRequest(body: 0,)));
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: ColorsHelper.whiteColor(),
                            ),
                            child: Image.asset(
                              ImageAssets.request,
                            scale: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringHelper.request,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    //Booking
                     Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => new HistoryRequest()));
                          },
                          child:  Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: ColorsHelper.whiteColor(),
                          ),
                          child: Image.asset(
                            ImageAssets.booking,
                            scale: 3,
                          ),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringHelper.booking,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 50,
                  thickness: 2,
                  color: Colors.grey,
                  indent: 40,
                  endIndent: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Vist
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => new HistoryRequest()));
                          },
                          child:  Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: ColorsHelper.whiteColor(),
                          ),
                          child: Image.asset(
                            ImageAssets.visit,
                            scale: 3,),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringHelper.visit,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    //Complete
                   Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => new HistoryRequest()));
                          },
                          child:   Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: ColorsHelper.whiteColor(),
                          ),
                          child: Image.asset(
                            ImageAssets.complete,
                            scale: 3,),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringHelper.complete,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: ColorsHelper.whiteColor()),
                  child: Material(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    child: InkWell(
                      child: Icon(Icons.clear,
                      size: 24, color: ColorsHelper.themeBlackColor()),
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class AddCategoryPopup{
  static openPopup(BuildContext contextx, int check) {
    return showDialog(
        barrierDismissible: false,
        context: contextx,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: check==0?AddCategoryBody(
                contextx: context,
              ):AddBusinessCategory(
                contextx: context,
              )
            ),
          );
        });
  }

}
class AddBusinessCategory extends StatefulWidget {
  final BuildContext contextx;
AddBusinessCategory({Key key, this.contextx}) : super(key: key);
  @override
  _AddBusinessCategoryState createState() => _AddBusinessCategoryState();
}

class _AddBusinessCategoryState extends State<AddBusinessCategory> {
  @override
  double width;
  double height;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        color: ColorsHelper.whiteColor(),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              //Title
              Text(
                "Add business category",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 18,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
              SizedBox(
                height: 25,
              ),

              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                 color: ColorsHelper.whiteColor(),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    2.0, // Move to bottom 5 Vertically
                  ),
                )
                ],
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => new TypeOfBusinesss()));

                  },
                  child: Center(
                    child: Text(
                      "Select Category",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontSize: 18,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),




              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: ColorsHelper.themeBlackColor()),
                    child:

                    Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: InkWell(
                        child: Icon(Icons.clear,
                            size: 30, color: ColorsHelper.whiteColor()),
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),

                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}

class TypeOfBusinesss extends StatefulWidget {
  final String type;
  static const String routeName = "TypeOfBusinesss";
  TypeOfBusinesss({Key key, this.type}) : super(key: key);

  @override
  _TypeOfBusinesssState createState() => _TypeOfBusinesssState();
}

class _TypeOfBusinesssState extends State<TypeOfBusinesss> {
  List<Category> businessListCategory = [];
  List<String> catImg01 = [];
  List<String> catImg02 = [];
  List<String> catName01 = [];
  List<String> catName02 = [];
  bool isAppreance = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    catImg01 = [
      ImageAssets.cat01_1,
      ImageAssets.cat01_2,
      ImageAssets.cat01_3,
      ImageAssets.cat01_4,
      ImageAssets.cat01_5,
      ImageAssets.cat01_6,
      ImageAssets.cat01_7,
      ImageAssets.cat01_8,
      ImageAssets.cat01_9,
      ImageAssets.cat01_10,
      ImageAssets.cat01_11,
      ImageAssets.cat01_12,
    ];
    catImg02 = [
      ImageAssets.cat02_1,
      ImageAssets.cat02_2,
      ImageAssets.cat02_3,
      ImageAssets.cat02_4,
      ImageAssets.cat02_5,
      ImageAssets.cat02_6,
    ];
    catName01 = [
      StringHelper.cat01_1,
      StringHelper.cat01_2,
      StringHelper.cat01_3,
      StringHelper.cat01_4,
      StringHelper.cat01_5,
      StringHelper.cat01_6,
      StringHelper.cat01_7,
      StringHelper.cat01_8,
      StringHelper.cat01_9,
      StringHelper.cat01_10,
      StringHelper.cat01_11,
      StringHelper.cat01_12,
    ];
    catName02 = [
      StringHelper.cat02_1,
      StringHelper.cat02_2,
      StringHelper.cat02_3,
      StringHelper.cat02_4,
      StringHelper.cat02_5,
      StringHelper.cat02_6,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              //App bar
                appBar: AppBar(
                  backgroundColor: ColorsHelper.whiteColor(),
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Vibrate.feedback(FeedbackType.light);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear,
                        size: 30, color: ColorsHelper.themeBlackColor()),
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
                backgroundColor: ColorsHelper.whiteColor(),
                //body
                body: ListView.builder(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            //return category(businessListCategory[index], index);
                            return category(null, index);
                          }
    )
       );
  }

  Widget category(Category businessListData, int index) {
    index == 0 ? isAppreance = true : isAppreance = false;
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        //shrinkWrap:true,
        children: <Widget>[
          Center(
            child: index == 0
                ? Text(
//              businessListData.name,
              "전문가",
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.43),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                  color: ColorsHelper.themeBlackColor(),
                  //fontFamily: FontsHelper.fonts_BMEULJIROTTF,
                  fontSize: 15),
            )
                : Text(
//              businessListData.name,
              "장소",
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.43),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                  color: ColorsHelper.themeBlackColor(),
                  //fontFamily: FontsHelper.fonts_BMEULJIROTTF,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            padding: EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 25,
              crossAxisSpacing: 5,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
//            itemCount: businessListData.children.length,
            itemCount: index == 0 ? catName01.length : catName02.length,
            itemBuilder: (BuildContext context, int index) {
//              return subCategoryItems(businessListData.children[index], index);
              return subCategoryItems(null, index);
              //subCategoryList(businessListData.subcat);
            },
          )
        ],
      ),
    );
  }

  Widget subCategoryItems(Children subCategory, int index) {
    return Container(
//      color: Colors.black12,
      child: InkWell(
        onTap: () {
          Vibrate.feedback(FeedbackType.light);
          SharePreferencesHelper.getInstant().setString(
              SharePreferencesHelper.Type_of_business, subCategory.name);
          SharePreferencesHelper.getInstant()
              .setInt(SharePreferencesHelper.Business_Id, subCategory.id);
          Navigator.of(context).pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     border: Border.all(
                //         color: ColorsHelper.grayColor(), width: 2)),
                width: 45,
                height: 45,
                child: Material(
                  color: Colors.transparent,
//                  child: CachedNetworkImage(
//                    errorWidget: (context, url, error) => Icon(Icons.error),
//                    placeholder: (context, url) => Container(
//                      child: CircularProgressIndicator(
//                        strokeWidth: 2.0,
//                        valueColor: AlwaysStoppedAnimation<Color>(
//                          Colors.black,
//                        ),
//                      ),
//                      width: 60.0,
//                      height: 60.0,
//                      padding: EdgeInsets.all(20.0),
//                    ),
//                    imageUrl: subCategory.logo != null
//                        ? subCategory.logo
//                        : StringHelper.default_Avatar,
//                    width: 60.0,
//                    height: 60.0,
//                    fit: BoxFit.contain,
//                  ),
                  child: GestureDetector(
                    onTap:   () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>
                          UserProfile()));
                    },
                    child: Image.asset(
                      isAppreance ? catImg01[index] : catImg02[index],
                    ),
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  isAppreance ? catName01[index] : catName02[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: ColorsHelper.themeBlackColor(),
                      //fontFamily: FontsHelper.fonts_BMEULJIROTTF,
                      fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





class AddCategoryBody extends StatefulWidget {
  final BuildContext contextx;
AddCategoryBody({Key key, this.contextx}) : super(key: key);
  @override
  _AddCategoryBodyState createState() => _AddCategoryBodyState();
}

class _AddCategoryBodyState extends State<AddCategoryBody> {
  double width;
  double height;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
       color: ColorsHelper.whiteColor(),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              //Title
              Text(
                "Will you add other category?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 18,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "you have to pay 150 usd inapp",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 18,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ), SizedBox(
                height: 40,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: ColorsHelper.themeBlackColor()),
                    child:

                    Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: InkWell(
                        child: Icon(Icons.clear,
                            size: 30, color: ColorsHelper.whiteColor()),
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: ColorsHelper.themeBlackColor()),
                    child:

                    Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: InkWell(
                        child: Icon(Icons.check,
                            size: 30, color: ColorsHelper.whiteColor()),
                        onTap: () {
                          AddCategoryPopup.openPopup(context, 1);
                         },
                      ),
                    ),
                  ),
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}
