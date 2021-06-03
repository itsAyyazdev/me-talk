import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_type_of_business/bloc.dart';
import 'package:me_talk/src/models/categoryListbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:vibrate/vibrate.dart';

class TypeOfBusiness extends StatefulWidget {
  final String type;
  static const String routeName = "TypeOfBusiness";
  TypeOfBusiness({Key key, this.type}) : super(key: key);

  @override
  _TypeOfBusinessState createState() => _TypeOfBusinessState();
}

class _TypeOfBusinessState extends State<TypeOfBusiness> {
  TypeOfBusinessBloc typeOfBusinessBloc = TypeOfBusinessBloc();
  List<Category> businessListCategory = [];
  List<String> catImg01 = [];
  List<String> catImg02 = [];
  List<String> catName01 = [];
  List<String> catName02 = [];
  bool isAppreance = true;

  @override
  void dispose() {
    super.dispose();
    typeOfBusinessBloc.close();
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
    typeOfBusinessBloc.add(GetBusinessListData(context, widget.type));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
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
                body: BlocProvider(
                  create: (BuildContext context) => typeOfBusinessBloc,
                  child: BlocBuilder(
                    bloc: typeOfBusinessBloc,
                    builder: (BuildContext context, TypeOfBusinessState state) {
                      if (state.businessListCategory != null) {
                        businessListCategory =
                            state.businessListCategory.category;
                        return ListView.builder(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            //return category(businessListCategory[index], index);
                            return category(null, index);
                          },
                        );
                      } else {
                        return Container(
                          color: Colors.white,
                        );
                      }
                    },
                  ),
                ))));
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
                  child: Image.asset(
                    isAppreance ? catImg01[index] : catImg02[index],
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
