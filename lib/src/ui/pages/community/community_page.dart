
import 'dart:io';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';
import 'add_community.dart';
import 'anonymity_community_tab.dart';
import 'package:me_talk/src/res/colors.dart';

import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';

import 'surgery_community_tab.dart';
import 'talk_community_tab.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with SingleTickerProviderStateMixin{
  bool isUpdatedDataTalk, isUpdatedDataSurgery,isUpdatedDataAnonymity;
  bool isLogin = false;

  final List<Container> communityTabs = <Container>[
    Container(
      child: Text(
        StringHelper.talk_tab,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13.0,
          //fontFamily: FontsHelper.fonts_HyGothic_regular
        ),
      ),
      margin: EdgeInsets.only(bottom: 10),
    ),
    Container(
      child: Text(
        StringHelper.surgery_tab,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13.0,
          //fontFamily: FontsHelper.fonts_HyGothic_regular
        ),
      ),
      margin: EdgeInsets.only(bottom: 10),
    ),
    Container(
      child: Text(
        StringHelper.anonymity_tab,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13.0,
          //fontFamily: FontsHelper.fonts_HyGothic_regular
        ),
      ),
      margin: EdgeInsets.only(bottom: 10),
    ),
  ];
  TabController controller;
  TextEditingController txtController;
  @override
  void initState() {
    // TODO: implement initState
    isUpdatedDataTalk = isUpdatedDataSurgery=isUpdatedDataAnonymity = false;
    controller = TabController(vsync: this, length: communityTabs.length);
    //controller.addListener(_setActiveTabIndex);
    super.initState();
    checkIfLogin();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double margin = (Platform.isIOS ? 99.0 : 25.0 + (Platform.isIOS ? 75 : 62));
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: DefaultTabController(
                length: 3,
                child: Container(
                  color: Colors.white,
                  //padding: EdgeInsets.only(top: margin),
                  child: Scaffold(
//                    appBar: PreferredSize(
//                      preferredSize: MediaQuery.of(context).size.height ==667? Size.fromHeight(30):Size.fromHeight(10),
//                      child: Container(
//                        color: Colors.white,
//                        child: Column(
//                          children: <Widget>[
//                            TabBar(
//                              indicatorColor: ColorsHelper.themeBlackColor(),
//                              controller: controller,
//                              isScrollable: false,
//                              //indicatorWeight: 2,
//                              indicator: UnderlineTabIndicator(
//                                  borderSide: BorderSide(width: 3.0),
//                                  insets: EdgeInsets.symmetric(horizontal:25.0)
//                              ),
//                              unselectedLabelColor: Colors.black,
//                              unselectedLabelStyle: TextStyle(
//                                  color: Colors.black,
//                                  fontSize: 12.0
//                                  //fontFamily: FontsHelper.fonts_HyGothic_regular
//                                ),
//                              labelColor: Colors.black,
//                              labelStyle: TextStyle(
//                                  color: Colors.black,
//                                  fontSize: 12.0
//                                  //fontFamily: FontsHelper.fonts_HyGothic_regular),
//                              ),
//                              onTap: (int currentIndex){
//                                print(currentIndex);
//                              },
//                              tabs: communityTabs,
//                            ),
//                            Divider(
//                              color: ColorsHelper.dividerGreyColor(),
//                              height: 0,
//                              thickness: 0.5,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                    body: Stack(
                      children: <Widget>[
                        TabBarView(
                          controller: controller,
                          children: [
                            TalkCommunityTab(isUpdateData: isUpdatedDataTalk,isLogin: isLogin),
                            SurgeryCommunityTab(isUpdateData: isUpdatedDataSurgery,isLogin: isLogin),
                            AnonymityCommunityTab(isUpdateData: isUpdatedDataAnonymity,isLogin: isLogin),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: WidgetHelper.setBlurEffect(Container(
                            padding: const EdgeInsets.only(top: 44),
                            //height: 38,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 57,
                                  //color: Colors.blue,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        //color: Colors.black12,
                                        height: 51,
                                        width: 75,
                                        padding: EdgeInsets.all(0),
                                        child: FlareActor(
                                          'assets/logo_chactor1.flr',
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          animation: "Logo",
                                          //controller: controls,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                            height: 31,
                                            width: MediaQuery.of(context).size.width - 200,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.07),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                                      child: Image.asset(
                                                        ImageAssets.search_box_icon,
                                                        width: 17,
                                                        height: 17,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width - 250,
                                                      //color: Colors.black12,
                                                      child: TextField(
                                                        textInputAction: TextInputAction.search,
                                                        //textAlign: TextAlign.center,
                                                        controller: txtController,
                                                        cursorColor: Color(0xff403F3F),
                                                        //textAlignVertical: TextAlignVertical.center,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          contentPadding: EdgeInsets.only(bottom: 16),
                                                          hintText: StringHelper.community_search_hint,

                                                          ///suffix: IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
                                                          //suffixIcon: Icon(Icons.clear),
                                                        ),
                                                        style: TextStyle(
                                                          color: Color(0xff403F3F),
                                                          fontSize: 10.0,
                                                        ),
                                                        onSubmitted: (String searchWord) {
                                                          if (searchWord.length > 0) {
//                        if(widget.typeId==3){
//                          searchApiCall(searchWord);
//                        }
                                                          }
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
//            Padding(
//              padding: const EdgeInsets.only(left: 10,right: 10),
//              child: InkWell(
//                onTap: (){
////                  controller.clear();
////                  searchList.clear();
////                  setState(() {});
//                },
//                child: Image.asset(
//                  ImageAssets.search_close,
//                  width: 15,
//                  height: 15,
//                  fit: BoxFit.contain,
//                ),
//              ),
//            ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
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
                                      SizedBox(
                                        width: 15,
                                      ),
                                      //profile
                                      InkWell(
                                        child: Image.asset(
                                          ImageAssets.user_nav,
                                          width: 25.0,
                                          height: 25.0,
                                          fit: BoxFit.contain,
                                        ),
                                        onTap: () {
                                          Vibrate.feedback(FeedbackType.light);
                                           gotoProfile();
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TabBar(
                                    indicatorColor: ColorsHelper.themeBlackColor(),
                                    controller: controller,
                                    isScrollable: false,
                                    //indicatorWeight: 2,
                                    indicator: UnderlineTabIndicator(
                                        borderSide: BorderSide(width: 3.0),
                                        insets: EdgeInsets.symmetric(horizontal:25.0)
                                    ),
                                    unselectedLabelColor: Colors.black,
                                    unselectedLabelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                    ),
                                    labelColor: Colors.black,
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular),
                                    ),
                                    onTap: (int currentIndex){
                                      print(currentIndex);
                                    },
                                    tabs: communityTabs,
                                  ),
                                ),
                                Divider(
                                  color: ColorsHelper.dividerGreyColor(),
                                  height: 0,
                                  thickness: 0.5,
                                ),
                              ],
                            ),
                          ))
//                          ClipRect(
//                            child: BackdropFilter(
//                              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
//                              child: Material(
//                                color: Colors.white.withOpacity(0.8),
//                                child: Container(
//                                  //color: Colors.white,
//                                  padding: const EdgeInsets.only(top: 12),
//                                  height: 36,
//                                  child: Column(
//                                    children: <Widget>[
//                                      TabBar(
//                                        indicatorColor: ColorsHelper.themeBlackColor(),
//                                        controller: controller,
//                                        isScrollable: false,
//                                        //indicatorWeight: 2,
//                                        indicator: UnderlineTabIndicator(
//                                            borderSide: BorderSide(width: 3.0),
//                                            insets: EdgeInsets.symmetric(horizontal:25.0)
//                                        ),
//                                        unselectedLabelColor: Colors.black,
//                                        unselectedLabelStyle: TextStyle(
//                                            color: Colors.black,
//                                            fontSize: 12.0
//                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
//                                        ),
//                                        labelColor: Colors.black,
//                                        labelStyle: TextStyle(
//                                            color: Colors.black,
//                                            fontSize: 12.0
//                                          //fontFamily: FontsHelper.fonts_HyGothic_regular),
//                                        ),
//                                        onTap: (int currentIndex){
//                                          print(currentIndex);
//                                        },
//                                        tabs: communityTabs,
//                                      ),
//                                      Divider(
//                                        color: ColorsHelper.dividerGreyColor(),
//                                        height: 0,
//                                        thickness: 0.5,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          //visible: isLogin,
          visible: true,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100, right: 20),
            child: SizedBox(
              height: 43,
              width: 43,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: ()  async{
                  int categoryId = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCommunity()));
//                  if (categoryId != null) {
//                    setState(() {
//                      if(categoryId == 3){
//                        isUpdatedDataTalk = !isUpdatedDataTalk;
//                      }else if(categoryId == 4){
//                        isUpdatedDataSurgery = !isUpdatedDataSurgery;
//                      }else if(categoryId == 5){
//                        isUpdatedDataAnonymity = !isUpdatedDataAnonymity;
//                      }
//                    });
//                  }
                },
                child: Image.asset(
                  ImageAssets.pencil_icon,
                  width: 21,
                  height: 21,
                  fit: BoxFit.cover,
                ),
                backgroundColor: ColorsHelper.darkBlackColor(),
              ),
            ),
          ),
        )
      ],
    );
  }

  void gotoProfile() async {
    AppNavigator.launchLoginPage(context);
  }

  void checkIfLogin()async{
    isLogin =
        await SharePreferencesHelper().getBool(SharePreferencesHelper.Is_Login);
    setState(() {});
  }

  void setActiveTabIndex() {
    int currentIndex = controller.index;
    print(currentIndex);
    if(controller.indexIsChanging){
      print(controller.previousIndex);
    }
  }

}
