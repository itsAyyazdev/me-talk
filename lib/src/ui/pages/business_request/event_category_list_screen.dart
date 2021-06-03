import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/data/repository/category_list_repository.dart';
import 'package:me_talk/src/models/categoryListbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:vibrate/vibrate.dart';

class EventCategoryListScreen extends StatefulWidget {
  static const String routeName = "EventCategoryList";
  @override
  _EventCategoryListScreenState createState() =>
      _EventCategoryListScreenState();
}

class _EventCategoryListScreenState extends State<EventCategoryListScreen> {
  CategoryListData businessListCategory;
  CategoryListApiRepository categoryListApiRepository =
      CategoryListApiRepository();
  List<Category> categoryLists = [];
  List<Children> subCategoryLists = [];
  int selectedIndex;
  bool isTreatmentTab = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(const Duration(microseconds: 100), () {
      getCategoryListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        left: false,
        right: false,
        top: false,
        bottom: true,
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            backgroundColor: ColorsHelper.whiteColor(),
            leading: IconButton(
              onPressed: () {
                Vibrate.feedback(FeedbackType.light);
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear,
                  size: 30, color: ColorsHelper.themeBlackColor()),
            ),
            title: Container(
              width: MediaQuery.of(context).size.height *
                  (Platform.isIOS ? 0.15 : 0.12),
              height: MediaQuery.of(context).size.height *
                  (Platform.isIOS ? 0.11 : 0.10),
              child: FlareActor(
                'assets/logo_chactor.flr',
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "Logo",
              ),
            ),
            centerTitle: true,
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
          body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 30, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                isTreatmentTab = true;
                                setState(() {
                                  //subCategoryLists.clear();
                                  subCategoryLists = categoryLists[0].children;
                                });
                              });
                            },
                            child: Text(
                              StringHelper.treatment_caps,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isTreatmentTab,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 80,
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                isTreatmentTab = false;
                                setState(() {
                                  // subCategoryLists.clear();
                                  subCategoryLists = categoryLists[1].children;
                                });
                              });
                            },
                            child: Text(
                              StringHelper.surgery_caps,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isTreatmentTab,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 80,
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: getCategoryList,
                      itemCount: subCategoryLists.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 30),
                  child: InkWell(
                    onTap: () {
                      Vibrate.feedback(FeedbackType.light);
                      SharePreferencesHelper.getInstant().setString(
                          SharePreferencesHelper.Type_of_business,
                          subCategoryLists[selectedIndex].name);
                      SharePreferencesHelper.getInstant().setInt(
                          SharePreferencesHelper.Business_Id,
                          subCategoryLists[selectedIndex].id);
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      color: ColorsHelper.themeBlackColor(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15),
                        child: Text(
                          StringHelper.reflect,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
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

  Widget getCategoryList(BuildContext context, int index) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              decoration: selectedIndex == null
                  ? null
                  : selectedIndex == index
                      ? BoxDecoration(
                          color: ColorsHelper.themeBlackColor(),
                          borderRadius: BorderRadius.all(Radius.circular(15)))
                      : null,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 8, bottom: 8),
                child: Text(
                  subCategoryLists[index].name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: selectedIndex == index ? 19 : 19,
                      color: selectedIndex == null
                          ? Colors.black
                          : selectedIndex == index
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void getCategoryListApi() async {
    businessListCategory = await categoryListApiRepository.categoryListApiCall(
        context, CategoryListId.Hospital.index.toString());
    categoryLists = businessListCategory.category;
    subCategoryLists = categoryLists[0].children;
    setState(() {});
  }
}
