import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_shop_profile/bloc.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_profile/hospital_profile/hospital_review_tab.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/post_info.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/update_shop_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/upload_portfolio_pics.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibrate/vibrate.dart';

class ShopProfile extends StatefulWidget {
  final ShopDetailsBeansData shopDetailsBeansData;
  static const String routeName = "ShopProfile";
  ShopProfile({Key key, this.shopDetailsBeansData}) : super(key: key);

  @override
  _ShopProfileState createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile>
    with SingleTickerProviderStateMixin<ShopProfile> {
  final PageController pageController = new PageController();
  ShopProfileBloc shopProfileBloc = ShopProfileBloc();
  ShopDetailsBeansData shopDetailsBeansData;
  int count;
  @override
  initState() {
    super.initState();
    shopDetailsBeansData = widget.shopDetailsBeansData;
    count = shopDetailsBeansData.slider.length;
  }

  @override
  void dispose() {
    shopProfileBloc.close();
    super.dispose();
  }

  getshopDetailsBeansData(BuildContext contextx) {
    shopProfileBloc
        .getShopCategoryDetails(contextx, widget.shopDetailsBeansData.id)
        .then((onValue) {
      setState(() {
        shopDetailsBeansData = onValue;
        count = shopDetailsBeansData.slider.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsHelper.whiteColor(),
      child: SafeArea(
        left: false,
        right: false,
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorsHelper.whiteColor(),
            body: BlocProvider(
              create: (BuildContext context) => shopProfileBloc,
              child: BlocBuilder(
                bloc: shopProfileBloc,
                builder: (BuildContext context, ShopProfileState state) {
                  if (state is InitialShopProfileState) {
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
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
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
                  expandedHeight: 450,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Column(
                      children: <Widget>[
                        //profile image Slider
                        Card(
                          margin: const EdgeInsets.only(top: 90),
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
                              child: shopDetailsBeansData.slider.length >= 1
                                  ? PageIndicatorContainer(
                                      pageView: PageView.builder(
                                        itemBuilder: getPagerView,
                                        itemCount:
                                            shopDetailsBeansData.slider.length,
                                        controller: pageController,
                                      ),
                                      align: IndicatorAlign.bottom,
                                      length:
                                          shopDetailsBeansData.slider.length,
                                      shape: IndicatorShape.circle(size: 10),
                                      indicatorSpace: 10.0,
                                      indicatorColor: Colors.white54,
                                      indicatorSelectorColor: Colors.white,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        Vibrate.feedback(FeedbackType.light);
                                        Navigator.pushNamed(context,
                                                UpdateShopProfile.routeName,
                                                arguments:
                                                    shopDetailsBeansData.id)
                                            .then((onValue) {
                                          getshopDetailsBeansData(context);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 60,
                                      ),
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
                                  //fontFamily:FontsHelper.fonts_Nanum_Barun_Gothic,
                                  //fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                            Text(
                              "${shopDetailsBeansData.address.toUpperCase()} . ${shopDetailsBeansData.city.toUpperCase()}",
                              style: TextStyle(
                                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                  // fontWeight: FontWeight.w700,
                                  color: ColorsHelper.darkGrayColor(),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //profile pic and follow/unfollow
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    //smargin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                    child: Material(
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        placeholder: (context, url) =>
                                            Container(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.0,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.black,
                                            ),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          padding: EdgeInsets.all(20.0),
                                        ),
                                        imageUrl: shopDetailsBeansData
                                                    .profilePic !=
                                                null
                                            ? shopDetailsBeansData.profilePic
                                            : StringHelper.default_Avatar,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        fit: BoxFit.cover,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(100),
                                    )),
                              ],
                            ),
                          ],
                        )),
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
                  //  pinned: true,
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
                    Navigator.pushNamed(context, UploadPortfolioPics.routeName,
                            arguments: shopDetailsBeansData.id)
                        .then((onValue) {
                      getshopDetailsBeansData(context);
                    });
                  },
                  child: Container(
                    decoration: WidgetHelper.customBoxDecorationWithShadow(
                        ColorsHelper.themeBlackColor(),
                        ColorsHelper.themeBlackColor(),
                        Colors.black,
                        0,
                        5),
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    height: 45,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                        child: Text(
                          StringHelper.post,
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
                //Edit
                InkWell(
                  onTap: () {
                    Vibrate.feedback(FeedbackType.light);
                    Navigator.pushNamed(context, UpdateShopProfile.routeName,
                            arguments: shopDetailsBeansData.id)
                        .then((onValue) {
                      getshopDetailsBeansData(context);
                    });

                    //   AppNavigator.launchUpdateShopProfile(context);
                  },
                  child: Container(
                    decoration: WidgetHelper.customBoxDecorationWithShadow(
                        ColorsHelper.themeBlackColor(),
                        ColorsHelper.themeBlackColor(),
                        Colors.black,
                        0,
                        5),
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    height: 45,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                        child: Text(
                          StringHelper.edit,
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
        child: CachedNetworkImage(
          placeholder: (context, url) => Container(
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
            ),
            width: 40.0,
            height: 40.0,
            padding: EdgeInsets.all(20.0),
          ),
          imageUrl: shopDetailsBeansData.slider[index].imageUrl,
          fit: BoxFit.fill,
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
            //Portfolio
            Container(
              padding: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 27),
              child: Text(
                StringHelper.Portfolio.toUpperCase() + " (${gallary.length})",
                style: TextStyle(
                    //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                    fontSize: 13),
              ),
            ),
            //Pics
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
            // SizedBox(
            //   height: 70,
            // ),
            // SizedBox(
            //   height: 13,
            // ),
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
              Navigator.pushNamed(context, PostInfo.routeName,
                      arguments: gallary[index].subcategoryGallaryId)
                  .then((onValue) {
                getshopDetailsBeansData(context);
              });
              // AppNavigator.launchTestWidget(context);
            },
            child: Image.network(
              gallary[index].imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            )

            // CachedNetworkImage(
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            //   placeholder: (context, url) => Container(
            //     child: CircularProgressIndicator(
            //       strokeWidth: 2.0,
            //       valueColor: AlwaysStoppedAnimation<Color>(
            //         Colors.black,
            //       ),
            //     ),
            //     width: 120.0,
            //     height: 120.0,
            //     padding: EdgeInsets.all(60.0),
            //   ),
            //   imageUrl: c != null
            //       ? widget.gallary[index].imageUrl
            //       : StringHelper.default_Avatar,
            //   width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
