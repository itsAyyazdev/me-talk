import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_profile/bloc.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/profile/inconvenient.dart';
import 'package:me_talk/src/ui/pages/profile/saveHistoryS.dart';
import 'package:me_talk/src/ui/pages/profile/yourPost.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import 'package:me_talk/src/utils/popup_dialogs/activate_history_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/business_request_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibrate/vibrate.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "ProfilePage";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  ProfileBloc profileBloc = ProfileBloc();
  bool isEdit = true;
  String userName, userPicture;
  User userData;

  TextEditingController userNameController = TextEditingController();
  final PageController pageController = new PageController();

  FocusNode fnodeUserName = FocusNode();
  List<String> images = [
    ImageAssets.ero1,
    ImageAssets.ero2,
    ImageAssets.ero3,
    ImageAssets.ero4,
    ImageAssets.ero5,
  ];

  @override
  initState() {
    super.initState();
    getUserData();
//    profileBloc.isProfileUpdatedHere.listen((onData) {
//      if (onData) {
//        getUserData();
//      }
//    });
  }

  Future getUserData() async {
    String data = await SharePreferencesHelper()
        .getString(SharePreferencesHelper.User_Data);
    userData = LoginData.fromJson(jsonDecode(data)).user;
    setState(() {
      userPicture = userData.avatar;
      userName = userData.username;
    });

//    userName = await SharePreferencesHelper.getInstant()
//        .getString(SharePreferencesHelper.User_Name);
//    userPicture = await SharePreferencesHelper.getInstant()
//        .getString(SharePreferencesHelper.Avatar);
//    setState(() {});
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
                backgroundColor: ColorsHelper.whiteColor(),
                appBar: AppBar(
                  elevation: 5,
                  backgroundColor: ColorsHelper.whiteColor(),
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
                  title: Text(
                    "User page",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
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
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                body: BlocProvider(
                  create: (BuildContext context) => profileBloc,
                  child: BlocBuilder(
                    bloc: profileBloc,
                    builder: (BuildContext context, ProfileState state) {
                      if (state is InitialProfileState) {
                        return profileBody();
                      } else {
                        return Container(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                ))));
  }

  Widget profileBody() {
    return Container(
      margin: EdgeInsets.only(top: 23),
      color: ColorsHelper.whiteColor(),
      child: ScrollConfiguration(
        behavior: ListViewScrollBehavior(),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Profile Pic
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: ColorsHelper.grayColor(), width: 1)),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    width: 65,
                    height: 65,
                    child: InkWell(
                        onTap: () {
                          // profileBloc.imagePicker(context);
                        },
                        child: CircleAvatar(
                          radius: 33,
                          backgroundImage: AssetImage(ImageAssets.profile_pic),
                        )),
                  ),
                ),
                //User name
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    userName ?? StringHelper.userNameText,
                    style: TextStyle(
                        color: ColorsHelper.themeBlackColor(),
                        fontSize: 16,
                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 13,
            ),
            //Edit account button
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Edit account
                  ButtonColor(
                    height: 30,
                    radius: 25,
                    width: 120,
                    blurRadius: 5,
                    color: ColorsHelper.lightGreenColor(),
                    onPressed: () {
                      Vibrate.feedback(FeedbackType.light);
                      // AppNavigator.launchEditProfile(context);
                      Navigator.pushNamed(context, EditProfile.routeName)
                          .then((onValue) {
                        setState(() {
                          getUserData();
                        });
                      });
                    },
                    child: Text(
                      StringHelper.edit_account,
                      style: TextStyle(
                          color: ColorsHelper.whiteColor(),
                          fontSize: 15,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _selectCountry()));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        ImageAssets.grobal,
                        width: 50,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorsHelper.themeBlackColor(),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              blurRadius: 5,
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            // 4 option box
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Card(
                color: ColorsHelper.themeBlackColor(),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 17, bottom: 17),
                  child: Column(
                    children: <Widget>[
                      //1st row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //Activate History
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xffE69A1B),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50.0),
                                onTap: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  ActivateHistoryPopup.openPopup(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      ImageAssets.history,
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      StringHelper.activate_History,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorsHelper.whiteColor(),
                                          fontSize: 10,
                                          fontFamily: FontsHelper
                                              .fonts_Nanum_Barun_Gothic),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //Saved History
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          new SavedHistory()));
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color(0xff594FDD),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    ImageAssets.save,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    StringHelper.saved_History,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorsHelper.whiteColor(),
                                        fontSize: 10,
                                        fontFamily: FontsHelper
                                            .fonts_Nanum_Barun_Gothic),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 30,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //Your post
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new YourPost()));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Color(0xffC939E5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      ImageAssets.upload,
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      StringHelper.your_Post,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorsHelper.whiteColor(),
                                          fontSize: 10,
                                          fontFamily: FontsHelper
                                              .fonts_Nanum_Barun_Gothic),
                                    ),
                                  ],
                                ),
                              )),
                          //Your business
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xffDD268C),
                              //Color(0xffC939E5),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50.0),
                                onTap: () async {
                                  Vibrate.feedback(FeedbackType.light);
                                  //Navigate to business request page
                                  //await profileBloc.checkBusinessInfo(context).then((onValue) {});
                                  //AppNavigator.launchBusinessRequest(context);
                                  //AppNavigator.launchBusinessProfile(context);
                                  BusinessRequestPopup.openPopup(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      ImageAssets.business,
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      StringHelper.your_Business,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColorsHelper.whiteColor(),
                                          fontSize: 10,
                                          fontFamily: FontsHelper
                                              .fonts_Nanum_Barun_Gothic),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //If you are in other country?\nsee other countries me talk
            // Container(
            //   margin: EdgeInsets.only(top: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Text(
            //         StringHelper.if_you_are_text,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             fontSize: 15, fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         height: 40,
            //         width: 40,
            //         child: Image.asset(
            //           ImageAssets.grobal,
            //           width: 22,
            //         ),
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: ColorsHelper.themeBlackColor()),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Card(
              color: ColorsHelper.whiteColor(),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 155.0,
                    child: PageIndicatorContainer(
                      pageView: PageView.builder(
                        itemBuilder: getPagerView,
                        itemCount: images.length,
                        controller: pageController,
                      ),
                      align: IndicatorAlign.bottom,
                      length: images.length,
                      shape: IndicatorShape.circle(size: 10),
                      indicatorSpace: 10.0,
                      indicatorColor: Colors.white54,
                      indicatorSelectorColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          StringHelper.more,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: ColorsHelper.themeBlackColor(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //logout
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Vibrate.feedback(FeedbackType.light);
                      profileBloc.logoutAction(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          ImageAssets.logout2,
                          width: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          StringHelper.Logout,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Inconvvenient()),
                      );
                    },
                    child: Text(
                      StringHelper.tell_us_your_text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPagerView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        images[index],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _selectCountry() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsHelper.themeBlackColor(),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: InkWell(
              child: Image(
                height: 25,
                width: 25,
                image: AssetImage("assets/images/belln.png"),
                color: ColorsHelper.whiteColor(),
              ),
              onTap: () {},
            ),
          ),
        ],
        title: Center(
          child: Text(
            "Select your staying country",
            style: TextStyle(
              fontSize: 15,
              color: ColorsHelper.whiteColor(),
            ),
          ),
        ),
        leading: SizedBox(
            width: 10,
            height: 10,
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorsHelper.whiteColor(),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )),
      ),
      body: Container(
        color: ColorsHelper.themeBlackColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsHelper.whiteColor().withOpacity(0.3),

                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 2.0,
                          offset: Offset(
                            3.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                      color: ColorsHelper.whiteColor(),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsHelper.whiteColor().withOpacity(0.3),

                            blurRadius: 5.0, // soften the shadow
                            spreadRadius: 2.0,
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        color: ColorsHelper.whiteColor()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
