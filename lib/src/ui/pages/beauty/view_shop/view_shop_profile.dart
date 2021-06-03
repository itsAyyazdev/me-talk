import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_view_shop_profile/bloc.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_profile/hospital_profile/hospital_review_tab.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/shop_profile.dart';
import 'package:me_talk/src/ui/pages/image_click_page/image_click_page.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibrate/vibrate.dart';

class ViewShopProfile extends StatefulWidget {
  final ShopDetailsBeansData shopDetailsBeansData;
  static const String routeName = "ViewShopProfile";
  ViewShopProfile({Key key, this.shopDetailsBeansData}) : super(key: key);

  @override
  _ViewShopProfileState createState() => _ViewShopProfileState();
}

class _ViewShopProfileState extends State<ViewShopProfile>
    with SingleTickerProviderStateMixin<ViewShopProfile> {
  final PageController pageController = new PageController();
  ViewShopProfileBloc viewShopProfileBloc = ViewShopProfileBloc();
  ShopDetailsBeansData shopDetailsBeansData;
  int count;
  bool isFollowing = false;
  @override
  initState() {
    super.initState();
    shopDetailsBeansData = widget.shopDetailsBeansData;
    count = shopDetailsBeansData.slider.length;
    if (shopDetailsBeansData.follow == 1) {
      isFollowing = true;
    } else {
      isFollowing = false;
    }
  }

  getshopDetailsBeansData(BuildContext contextx) {
    viewShopProfileBloc
        .getShopCategoryDetails(contextx, widget.shopDetailsBeansData.id)
        .then((onValue) {
      setState(() {
        shopDetailsBeansData = onValue;
        count = shopDetailsBeansData.slider.length;
        if (shopDetailsBeansData.follow == 1) {
          isFollowing = true;
        } else {
          isFollowing = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsHelper.whiteColor(),
      child: SafeArea(
        bottom: false,
        top: false,
        right: false,
        left: false,
        child: Scaffold(
            backgroundColor: ColorsHelper.whiteColor(),
            body: BlocProvider(
              create: (BuildContext context) => viewShopProfileBloc,
              child: BlocBuilder(
                bloc: viewShopProfileBloc,
                builder: (BuildContext context, ViewShopProfileState state) {
                  if (state is InitialViewShopProfileState) {
                    return shopProfileBody();
                  } else {
                    return Container(
                      color: Colors.black,
                    );
                  }
                },
              ),
            )),
      ),
    );
  }

  Widget shopProfileBody() {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        //AppBar
        DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              print(MediaQuery.of(context).size.width);
              return <Widget>[
                SliverAppBar(
                  elevation: 5,
                  floating: false,
                  pinned: true,
                  backgroundColor: ColorsHelper.whiteColor(),
                  leading: IconButton(
                    padding: EdgeInsets.all(0),
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
                  //Report,instagram button
                  actions: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          //report
                          ButtonBlackBroder(
                            blurRadius: 3,
                            child: Text(
                              StringHelper.report,
                              style: TextStyle(
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic),
                            ),
                            width: MediaQuery.of(context).size.width * .2,
                            height: 25,
                            broderWidth: .5,
                            onPressed: () {
                              Vibrate.feedback(FeedbackType.light);
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //instagram
                          ButtonColor(
                            blurRadius: 3,
                            color: ColorsHelper.themeBlackColor(),
                            width: MediaQuery.of(context).size.width * .25,
                            height: 25,
                            child: Text(
                              StringHelper.instagram,
                              style: TextStyle(
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  color: ColorsHelper.whiteColor()),
                            ),
                            onPressed: () {
                              Vibrate.feedback(FeedbackType.light);
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //bell icon
                          Container(
                            margin: EdgeInsets.only(right: 10),
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
                    )
                  ],
                  expandedHeight: 485,
                  // MediaQuery.of(context).size.width > 460
                  //     ? MediaQuery.of(context).size.width
                  //     : 460,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Column(
                      children: <Widget>[
                        //profile image Slider
                        Card(
                          margin: const EdgeInsets.only(top: 125),
                          elevation: 4,
                          color: ColorsHelper.whiteColor(),
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.275,
                              width: MediaQuery.of(context).size.height * 0.275,
                              child: PageIndicatorContainer(
                                pageView: PageView.builder(
                                  itemBuilder: getPagerView,
                                  itemCount: shopDetailsBeansData.slider.length,
                                  controller: pageController,
                                ),
                                align: IndicatorAlign.bottom,
                                length: shopDetailsBeansData.slider.length,
                                shape: IndicatorShape.circle(size: 10),
                                indicatorSpace: 10.0,
                                indicatorColor: Colors.white54,
                                indicatorSelectorColor: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        //Shop name, loacation and add buttom
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Active Name,
                            Text(
                              shopDetailsBeansData.activeName != ""
                                  ? shopDetailsBeansData.activeName
                                  : "Active Name",
                              style: TextStyle(
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                  //fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${shopDetailsBeansData.address.toUpperCase()} . ${shopDetailsBeansData.city.toUpperCase()}",
                              style: TextStyle(
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                  // fontWeight: FontWeight.w700,
                                  color: ColorsHelper.darkGrayColor(),
                                  fontSize: 12),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        //profile pic and follow/unfollow
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: MediaQuery.of(context).size.height / 10,
                                //smargin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Material(
                                  child: ExtendedImage.network(
                                    shopDetailsBeansData.profilePic != null
                                        ? shopDetailsBeansData.profilePic
                                        : StringHelper.default_Avatar,
                                    width:
                                        MediaQuery.of(context).size.height / 10,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    fit: BoxFit.cover,
                                    cache: true,
                                    enableLoadState: true,
                                    //cancelToken: cancellationToken,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(100),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            //follow button
                            isFollowing
                                ? ButtonColor(
                                    color: ColorsHelper.themeBlackColor(),
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    height: 25,
                                    child: Text(
                                      StringHelper.following,
                                      style: TextStyle(
                                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                          color: ColorsHelper.whiteColor()),
                                    ),
                                    onPressed: () {
                                      Vibrate.feedback(FeedbackType.light);
                                      setState(() {
                                        isFollowing = !isFollowing;
                                      });
                                      // viewShopProfileBloc
                                      //     .unFollowBusiness(
                                      //         context, shopDetailsBeansData.id)
                                      //     .then((onValue) {
                                      //   if (onValue) {
                                      //     getshopDetailsBeansData(context);
                                      //   }
                                      // });
                                    },
                                  )
                                : ButtonBlackBroder(
                                    radius: 10,
                                    child: Text(
                                      StringHelper.follow,
                                      style: TextStyle(
                                        //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                        //fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: 25,
                                    broderWidth: 1.5,
                                    onPressed: () {
                                      Vibrate.feedback(FeedbackType.light);
                                      setState(() {
                                        isFollowing = !isFollowing;
                                      });
                                      // viewShopProfileBloc
                                      //     .followBusiness(
                                      //         context, shopDetailsBeansData.id)
                                      //     .then((onValue) {
                                      //   if (onValue) {
                                      //     getshopDetailsBeansData(context);
                                      //   }
                                      // });
                                    },
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    TabBar(
                      indicatorPadding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .15,
                          right: MediaQuery.of(context).size.width * .15),
                      indicatorColor: ColorsHelper.themeBlackColor(),
                      //  isScrollable: true,
                      indicatorWeight: 2,
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                      ),
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                      ),
                      tabs: [
                        Container(
                          child: Text(StringHelper.info_title),
                          margin: EdgeInsets.only(bottom: 6, top: 6),
                        ),
                        Container(
                          child: Text(StringHelper.review_tab),
                          margin: EdgeInsets.only(bottom: 6, top: 6),
                        ),
                      ],
                    ),
                  ),
                  // pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                shopPortfolioTab(shopDetailsBeansData.gallary),
                // ShopPortfolioTab(
                //   gallary: shopDetailsBeansData.gallary,
                // ),
                HospitalReviewTab(),
              ],
            ),
          ),
        ),
        //Bottom buttons
        Container(
          color: Colors.black.withOpacity(0.05),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Post
                InkWell(
                  onTap: () {
                    Vibrate.feedback(FeedbackType.light);
                  },
                  child: Container(
                    decoration: WidgetHelper.customBoxDecorationWithShadow(
                        ColorsHelper.themeBlackColor(),
                        ColorsHelper.themeBlackColor(),
                        Colors.black,
                        0,
                        5),
                    width: MediaQuery.of(context).size.width * .9,
                    height: 45,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                        child: Text(
                          StringHelper.request_to_ask.toUpperCase(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getPagerView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: Material(
        child: ExtendedImage.network(
          shopDetailsBeansData.slider[index].imageUrl,
          width: 40,
          height: 40,
          fit: BoxFit.fill,
          cache: true,
          enableLoadState: true,
          enableMemoryCache: true,
          //cancelToken: cancellationToken,
        ),
      ),
    );
  }

  Widget shopPortfolioTab(List<Gallary> gallary) {
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 5, left: 5, right: 5),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Followers, work compelete, portfolio, Review
            Card(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10),
              elevation: 1,
              color: ColorsHelper.whiteColor(),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                      color: ColorsHelper.whiteColor(),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Followers
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            shopDetailsBeansData.followers.toString(),
                            style: TextStyle(
                              color: ColorsHelper.themeBlackColor(),
                              fontSize: 17,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            StringHelper.followers,
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 10,
                                //fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: ColorsHelper.grayColor(),
                        indent: 8,
                        endIndent: 8,
                      ),
                      //work Complete
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            shopDetailsBeansData.workComplete.toString(),
                            style: TextStyle(
                              color: ColorsHelper.themeBlackColor(),
                              fontSize: 17,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            StringHelper.work_complete,
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 10,
                                //fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: ColorsHelper.grayColor(),
                        indent: 8,
                        endIndent: 8,
                      ),
                      //Portfolio
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            shopDetailsBeansData.portfolio.toString(),
                            style: TextStyle(
                              color: ColorsHelper.themeBlackColor(),
                              fontSize: 17,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            StringHelper.Portfolio,
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 10,
                                //fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: ColorsHelper.grayColor(),
                        indent: 8,
                        endIndent: 8,
                      ),
                      //Review
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            shopDetailsBeansData.review.toString(),
                            style: TextStyle(
                              color: ColorsHelper.themeBlackColor(),
                              fontSize: 17,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            StringHelper.Review,
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 10,
                                //fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            // //Portfolio
            // Container(
            //   padding: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 20),
            //   child: Text(
            //     StringHelper.Portfolio.toUpperCase() + " (${gallary.length})",
            //     style: TextStyle(
            //         fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
            //         fontSize: 13),
            //   ),
            // ),
            //gallery Pics
            GridView.builder(
              padding: EdgeInsets.all(0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: gallary.length,
              itemBuilder: (BuildContext context, int index) {
                return showPortfolioPics(index, gallary);
              },
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }

  Widget showPortfolioPics(int index, List<Gallary> gallary) {
    return Container(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: ColorsHelper.grayColor(),
          onTap: () {
            Vibrate.feedback(FeedbackType.light);
            Navigator.pushNamed(context, ImageClickPage.routeName,
                    arguments: gallary[index].subcategoryGallaryId)
                .then((onValue) {
              // getshopDetailsBeansData(context);
            });
          },
          child: ExtendedImage.network(
            gallary[index].imageUrl,
            height: 90,
            width: 90,
            fit: BoxFit.cover,
            cache: true,
            enableLoadState: true,
            enableMemoryCache: true,
            //cancelToken: cancellationToken,
          ),
        ),
      ),
    );
  }
}
