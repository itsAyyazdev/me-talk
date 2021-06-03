import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_info_tab.dart';
import 'package:me_talk/src/ui/pages/business_profile/hospital_profile/hospital_review_tab.dart';
import 'package:me_talk/src/ui/pages/review/request_consultation.dart';
import 'package:me_talk/src/utils/silver_header_delegate.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

class ShopProfilePage extends StatefulWidget {
  ShopProfilePage({
      this.beautyshop,
    this.review
  }){
     review == null ? review = false : review = review;

    beautyshop == null ? beautyshop = false : beautyshop = beautyshop;
  }
  bool review;
  bool beautyshop;
  @override
  _ShopProfilePageState createState() => _ShopProfilePageState(beautyshop: beautyshop,review: review);
}

class _ShopProfilePageState extends State<ShopProfilePage> {
   _ShopProfilePageState({
      this.beautyshop,
    this.review
  }){
     review == null ? review = false : review = review;

    beautyshop == null ? beautyshop = false : beautyshop = beautyshop;
  }
  bool review;
  bool beautyshop;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 54,
                          ),
//                                  Divider(
//                                    thickness: 0.5,
//                                    height:0,
//                                    color: ColorsHelper.greyTextColor(),
//                                  ),
                          Padding(
                            padding: EdgeInsets.only(top: 34, bottom: 18),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.16),
                                            blurRadius: 6,
                                            offset: Offset(3, 3))
                                      ],
                                      border: Border.all(color: ColorsHelper.greyTextColor(),width: 0.01)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(
                                      ImageAssets.beauty_shop4,
                                      width: MediaQuery.of(context).size.width - 154,
                                      height: MediaQuery.of(context).size.width - 154,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              'Main NAME (activity name)',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                //fontFamily: FontsHelper.fonts_semibold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Location, City',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 11.0,
                                //fontFamily: FontsHelper.fonts_regular
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:14.0),
                                child: Container(
                                  height: 79,
                                  width: 79,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(39.5)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(39.5)),
                                    child: InkWell(
                                      onTap: () {
                                        print("ShopProfilePage Click");
                                        Vibrate.feedback(FeedbackType.light);
                                      },
                                      child: Image.asset(
                                        "assets/images/beauty/shop/portfolio_dp.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 11),
                                child: Container(
                                  height: 24,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: ColorsHelper.themeBlackColor(),width: 2)
                                  ),
                                  child: Center(
                                    child: Material(
//                                color: ColorsHelper.themeBlackColor(),
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {},
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        child: Text(
                                          StringHelper.follow,
                                          textAlign: TextAlign.center,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 2,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15,left: 60,right: 60),
                            child: Container(
                              height: 25,
                              //color: Colors.black12,
                              child: TabBar(
                                indicatorColor: ColorsHelper.themeBlackColor(),
                                //isScrollable: true,
                                //indicatorWeight: 2,
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(width: 2.0),
                                    insets:
                                    EdgeInsets.symmetric(horizontal: 79.0)),
                                unselectedLabelColor: Colors.black,
                                unselectedLabelStyle: TextStyle(
                                  color: ColorsHelper.darkBlackColor(),
                                  fontSize: 11.0,
                                  //fontFamily: FontsHelper.fonts_regular
                                ),
                                labelColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: ColorsHelper.darkBlackColor(),
                                  fontSize: 11.0,
                                  //fontFamily: FontsHelper.fonts_regular
                                ),
                                tabs: [
                                  Tab(
                                    text: StringHelper.info_title,
                                  ),
                                  Tab(
                                    text: StringHelper.review_tab,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: TabBarView(
                              children: [
                                ShopInfoTab(),
//                      HospitalInfoTab(),
                                HospitalReviewTab(isShopReview: true,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                WidgetHelper.setBlurEffect(Container(
                  height: 98,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 44),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Image.asset(
                            ImageAssets.back_arrow,
                            width: 19.0,
                            height: 19.0,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.16),
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      border: Border.all(color: ColorsHelper.blackBgColor(),width: 1),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    height: 27,
                                    width:77,
                                    child: Center(
                                      child: Text(
                                        StringHelper.report,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: ColorsHelper.blackBgColor(),
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Vibrate.feedback(FeedbackType.light);
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.27),
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: ColorsHelper.blackBgColor(),
                                    ),
                                    height: 27,
                                    width:96,
                                    child: Center(
                                      child: Text(
                                        StringHelper.instagram,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          //fontFamily: FontsHelper.fonts_medium
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Vibrate.feedback(FeedbackType.light);
                                  },
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: InkWell(
                                child: Image.asset(
                                  ImageAssets.notification,
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                                onTap: () {
                                  Vibrate.feedback(FeedbackType.light);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top:98.0),
                  child: Divider(
                    thickness: 0.5,
                    height:0,
                    color: ColorsHelper.greyTextColor(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: InkWell(
                        onTap: () {
                          print("clicked beauty");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RequestConsultation(beautyshop: beautyshop,review: review)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                          Radius.circular(5),
                              ),
                              color: ColorsHelper.themeBlackColor(),
                              boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.72),
                            blurRadius: 6,
                            offset: Offset(3, 3),
                          )
                              ]),
                          width: MediaQuery.of(context).size.width - 30,
                          height: 46,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                        child: Text(
                          StringHelper.request_to_ask,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontFamily: FontsHelper.fonts_medium
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
              ],
            ),
          ),
//          NestedScrollView(
//            headerSliverBuilder:
//                (BuildContext context, bool innerBoxIsScrolled) {
//              return <Widget>[
//                SliverAppBar(
//                  expandedHeight: 472.0,
//                  elevation: 0,
//                  floating: false,
//                  pinned: true,
//                  leading: IconButton(
//                    padding: const EdgeInsets.all(0),
//                    icon: Image.asset(
//                      ImageAssets.back_arrow,
//                      width: 19.0,
//                      height: 19.0,
//                      fit: BoxFit.contain,
//                    ),
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                  ),
//                  actions: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        InkWell(
//                          child: Container(
//                            decoration: BoxDecoration(
//                              boxShadow: [
//                                BoxShadow(
//                                    color: Colors.black.withOpacity(0.16),
//                                    blurRadius: 6,
//                                    offset: Offset(0, 3))
//                              ],
//                              borderRadius: BorderRadius.all(
//                                Radius.circular(10),
//                              ),
//                              border: Border.all(color: ColorsHelper.blackBgColor(),width: 1),
//                              color: Colors.white,
//                            ),
//                            height: 27,
//                            width:77,
//                            child: Center(
//                              child: Text(
//                                StringHelper.report,
//                                textAlign: TextAlign.center,
//                                overflow: TextOverflow.ellipsis,
//                                maxLines: 1,
//                                style: TextStyle(
//                                  color: ColorsHelper.blackBgColor(),
//                                  fontSize: 15.0,
//                                ),
//                              ),
//                            ),
//                          ),
//                          onTap: () {
//                            Vibrate.feedback(FeedbackType.light);
//                          },
//                        ),
//                        SizedBox(
//                          width: 5,
//                        ),
//                        InkWell(
//                          child: Container(
//                            decoration: BoxDecoration(
//                              boxShadow: [
//                                BoxShadow(
//                                    color: Colors.black.withOpacity(0.27),
//                                    blurRadius: 6,
//                                    offset: Offset(0, 3))
//                              ],
//                              borderRadius: BorderRadius.all(
//                                Radius.circular(10),
//                              ),
//                              color: ColorsHelper.blackBgColor(),
//                            ),
//                            height: 27,
//                            width:96,
//                            child: Center(
//                              child: Text(
//                                StringHelper.instagram,
//                                textAlign: TextAlign.center,
//                                overflow: TextOverflow.ellipsis,
//                                maxLines: 1,
//                                style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 15.0,
//                                  //fontFamily: FontsHelper.fonts_medium
//                                ),
//                              ),
//                            ),
//                          ),
//                          onTap: () {
//                            Vibrate.feedback(FeedbackType.light);
//                          },
//                        ),
//                      ],
//                      mainAxisSize: MainAxisSize.min,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(
//                          left: 10.0, right: 15.0),
//                      child: InkWell(
//                        child: Image.asset(
//                          ImageAssets.notification,
//                          width: 24.0,
//                          height: 24.0,
//                          fit: BoxFit.contain,
//                        ),
//                        onTap: () {
//                          Vibrate.feedback(FeedbackType.light);
//                        },
//                      ),
//                    ),
//                  ],
//                  flexibleSpace: FlexibleSpaceBar(
//                    centerTitle: true,
//                    background: Column(
//                      children: <Widget>[
//                        SizedBox(
//                          height: 54,
//                        ),
////                                  Divider(
////                                    thickness: 0.5,
////                                    height:0,
////                                    color: ColorsHelper.greyTextColor(),
////                                  ),
//                        Padding(
//                          padding: EdgeInsets.only(top: 34, bottom: 18),
//                          child: SizedBox(
//                            width: MediaQuery.of(context).size.width,
//                            child: Center(
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: Colors.black.withOpacity(0.16),
//                                          blurRadius: 6,
//                                          offset: Offset(3, 3))
//                                    ],
//                                    border: Border.all(color: ColorsHelper.greyTextColor(),width: 0.01)
//                                ),
//                                child: ClipRRect(
//                                  borderRadius: BorderRadius.all(
//                                      Radius.circular(10)),
//                                  child: Image.asset(
//                                    ImageAssets.beauty_shop4,
//                                    width: MediaQuery.of(context).size.width - 154,
//                                    height: MediaQuery.of(context).size.width - 154,
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 0),
//                          child: Text(
//                            'Main NAME (activity name)',
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 16.0,
//                              //fontFamily: FontsHelper.fonts_semibold
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 4),
//                          child: Text(
//                            'Location, City',
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              color: Colors.black54,
//                              fontSize: 11.0,
//                              //fontFamily: FontsHelper.fonts_regular
//                            ),
//                          ),
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.only(top:14.0),
//                              child: Container(
//                                height: 79,
//                                width: 79,
//                                decoration: BoxDecoration(
//                                  boxShadow: [
//                                    BoxShadow(
//                                        color: Colors.black.withOpacity(0.16),
//                                        blurRadius: 6,
//                                        offset: Offset(0, 3))
//                                  ],
//                                  color: Colors.white,
//                                  borderRadius: BorderRadius.all(Radius.circular(39.5)),
//                                ),
//                                child: ClipRRect(
//                                  borderRadius: BorderRadius.all(Radius.circular(39.5)),
//                                  child: InkWell(
//                                    onTap: () {
//                                      print("ShopProfilePage Click");
//                                      Vibrate.feedback(FeedbackType.light);
//                                    },
//                                    child: Image.asset(
//                                      "assets/images/beauty/shop/portfolio_dp.png",
//                                      fit: BoxFit.fill,
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.only(
//                                  top: 10.0, left: 11),
//                              child: Container(
//                                height: 24,
//                                width: 80,
//                                decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(10),
//                                    border: Border.all(color: ColorsHelper.themeBlackColor(),width: 2)
//                                ),
//                                child: Center(
//                                  child: Material(
////                                color: ColorsHelper.themeBlackColor(),
//                                    borderRadius: BorderRadius.circular(10),
//                                    child: InkWell(
//                                      onTap: () {},
//                                      borderRadius:
//                                      BorderRadius.circular(10),
//                                      child: Text(
//                                        StringHelper.follow,
//                                        textAlign: TextAlign.center,
//                                        overflow:
//                                        TextOverflow.ellipsis,
//                                        maxLines: 1,
//                                        style: TextStyle(
//                                            color: Colors.black,
//                                            fontSize: 13.0),
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            )
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                SliverPersistentHeader(
//                  delegate: SliverAppBarDelegate(
//                    TabBar(
//                      indicatorColor: ColorsHelper.themeBlackColor(),
//                      //isScrollable: true,
//                      //indicatorWeight: 2,
//                      indicator: UnderlineTabIndicator(
//                          borderSide: BorderSide(width: 2.0),
//                          insets:
//                          EdgeInsets.symmetric(horizontal: 75.0)),
//                      unselectedLabelColor: Colors.black,
//                      unselectedLabelStyle: TextStyle(
//                        color: ColorsHelper.darkBlackColor(),
//                        fontSize: 11.0,
//                        //fontFamily: FontsHelper.fonts_regular
//                      ),
//                      labelColor: Colors.black,
//                      labelStyle: TextStyle(
//                        color: ColorsHelper.darkBlackColor(),
//                        fontSize: 11.0,
//                        //fontFamily: FontsHelper.fonts_regular
//                      ),
//                      tabs: [
//                        Tab(
//                          text: StringHelper.info_title,
//                        ),
//                        Tab(
//                          text: StringHelper.review_tab,
//                        ),
//                      ],
//                    ),
//                    70,
//                  ),
//                  pinned: true,
//                ),
//              ];
//            },
//            body: TabBarView(
//              children: [
//                ShopInfoTab(),
////                      HospitalInfoTab(),
//                HospitalReviewTab(isShopReview: true,),
//              ],
//            ),
//          ),
        ),
      ),
    );
  }
}
