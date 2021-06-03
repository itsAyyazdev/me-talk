import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_beauty_page/bloc.dart';
import 'package:me_talk/src/models/beautydatabeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_profile_page.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibrate/vibrate.dart';

class BeautyPlacesTab extends StatefulWidget {
  final BuildContext contextx;
  final BeautyData beautyData;

  const BeautyPlacesTab({Key key, this.contextx, this.beautyData})
      : super(key: key);
  @override
  _BeautyPlacesTabState createState() => _BeautyPlacesTabState();
}

class _BeautyPlacesTabState extends State<BeautyPlacesTab> {
  final ScrollController listScrollController = new ScrollController();
  final PageController pageController = new PageController();
  List<String> categoryList;
  int selectedCategoryId;
  String typeOfBusiness;
  BeautyPageBloc beautyPageBloc;
  var arrNail = [];
  var arrShops = [];
  var arrBanner = [];
  @override
  void initState() {
    super.initState();
    arrBanner = [
      'assets/images/beauty/banner_beauty/banner1.png',
      'assets/images/beauty/banner_beauty/banner2.png',
      'assets/images/beauty/banner_beauty/banner3.png',
      'assets/images/beauty/banner_beauty/banner4.png',
      'assets/images/beauty/banner_beauty/banner5.png',
      'assets/images/beauty/banner_beauty/banner6.png',
      'assets/images/beauty/banner_beauty/banner7.png',
    ];
    arrNail = [
      'assets/images/beauty/Nails/nail1.png',
      'assets/images/beauty/Nails/nail2.png',
      //'assets/images/beauty/Nails/nail3.png',
      //'assets/images/beauty/Nails/nail4.png',
      'assets/images/beauty/Nails/nail5.png',
      'assets/images/beauty/Nails/nail6.png',
      'assets/images/beauty/Nails/nail7.png',
      'assets/images/beauty/Nails/nail8.png',
      'assets/images/beauty/Nails/nail9.png',
      'assets/images/beauty/Nails/nail10.png',
    ];
    arrShops = [
      'assets/images/beauty/shop/shop1.png',
      'assets/images/beauty/shop/shop2.png',
      'assets/images/beauty/shop/shop3.png',
      'assets/images/beauty/shop/shop4.png',
      'assets/images/beauty/shop/shop5.png',
      'assets/images/beauty/shop/shop6.png',
      'assets/images/beauty/shop/shop7.png',
      'assets/images/beauty/shop/shop8.png',
      'assets/images/beauty/shop/shop9.png',
      'assets/images/beauty/shop/shop10.png',
    ];
    beautyPageBloc = BlocProvider.of<BeautyPageBloc>(widget.contextx);
  }

  Future setTypeOfBusiness() async {
    typeOfBusiness = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Type_of_business);
    selectedCategoryId = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Business_Id);
    print(typeOfBusiness);
    print(selectedCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    double margin = (Platform.isIOS ? 53.0 : 25.0 + (Platform.isIOS ? 75 : 62));
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.only(top: 0),
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //Slider
            Container(
              height: MediaQuery.of(context).viewPadding.top > 0 ?133:153,
              color: Colors.white,
            ),
            Container(
              height: 49,
              color: Color(0xfff0f0f0),
            ),
            InkWell(
              onTap: () {
                AppNavigator.launchSliderClickPage(context);
              },
              child: Container(
                height: 94.0,
                child: PageIndicatorContainer(
                  pageView: PageView.builder(
                    itemBuilder: getPagerView,
                    itemCount: widget.beautyData.sliders.length,
                    controller: pageController,
                  ),
                  align: IndicatorAlign.bottom,
                  length: widget.beautyData.sliders.length,
                  shape: IndicatorShape.circle(size: 5),
                  indicatorSpace: 10.0,
                  indicatorColor: Colors.transparent,
                  indicatorSelectorColor: Colors.transparent,
                ),
              ),
            ),
            //recent new photo List
            Container(
              padding: EdgeInsets.only(left: 13, right: 7, top: 0, bottom: 5),
              child: Column(
                children: <Widget>[
                  //recent new photo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        StringHelper.recent_new_photo,
                        style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontSize: 15,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          ImageAssets.arrow_right,
                          width: 14.0,
                          height: 23.0,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //image list
                  Container(
                    height: 64,
                    child: ListView.builder(
                      controller: listScrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.beautyData.recentPhoto.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            color: ColorsHelper.whiteColor(),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 6,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(5.0),
                            child: Image.asset(
                              arrNail[index],
                              fit: BoxFit.fill,
                              height: 64,
                              width: 64,
                            ),
                          ),
//                          child: ClipRRect(
//                            borderRadius:
//                                new BorderRadius.all(new Radius.circular(6.0)),
//                            child: Material(
//                              child: ExtendedImage.network(
//                                "http://via.placeholder.com/350x150",
////                                widget.beautyData.recentPhoto[index].imageUrl !=
////                                        null
////                                    ? widget
////                                        .beautyData.recentPhoto[index].imageUrl
////                                    : StringHelper.default_Avatar,
//                                width: 62,
//                                height: MediaQuery.of(context).size.width * .15,
//                                fit: BoxFit.cover,
//                                cache: true,
//                                enableLoadState: true,
//                                //cancelToken: cancellationToken,
//                              ),
//
//                              //  cacheManager: CustomCacheManager(),
//                              // placeholder: (context, h) => Image.asset(
//                              //     ImageAssets.laodingg,
//                              //  ),
//
//                              clipBehavior: Clip.antiAlias,
//                            ),
//                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Category List
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //itemCount: widget.beautyData.beauty.length,
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, bottom: 10),
                      child: categoryListbody(null, index));
                  //child: categoryListbody(widget.beautyData.beauty[index], index));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 13, right: 7, bottom: 5, top: 10),
              child: Column(
                children: <Widget>[
                  //sponsor_new_photo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        StringHelper.sponsor_new_photo,
                        style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontSize: 15,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          ImageAssets.arrow_right,
                          width: 14.0,
                          height: 23.0,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //image list
                  Container(
                    height: 64,
                    child: ListView.builder(
                      controller: listScrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.beautyData.recentPhoto.length,
                      itemBuilder: (BuildContext context, int index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          color: ColorsHelper.whiteColor(),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 6,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(7.0),
                            child: Image.asset(
                              arrNail[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
//                          child: ClipRRect(
//                            borderRadius:
//                                new BorderRadius.all(new Radius.circular(6.0)),
//                            child: Material(
//                              child: ExtendedImage.network(
//                                "http://via.placeholder.com/350x150",
////                                widget.beautyData.recentPhoto[index].imageUrl !=
////                                        null
////                                    ? widget
////                                        .beautyData.recentPhoto[index].imageUrl
////                                    : StringHelper.default_Avatar,
//                                width: 62,
//                                height: MediaQuery.of(context).size.width * .15,
//                                fit: BoxFit.cover,
//                                cache: true,
//                                enableLoadState: true,
//                                //cancelToken: cancellationToken,
//                              ),
//
//                              //  cacheManager: CustomCacheManager(),
//                              // placeholder: (context, h) => Image.asset(
//                              //     ImageAssets.laodingg,
//                              //  ),
//
//                              clipBehavior: Clip.antiAlias,
//                            ),
//                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Category List
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 70),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //itemCount: widget.beautyData.beauty.length,
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 10),
                      child: categoryListbody(null, index));
                  //child: categoryListbody(widget.beautyData.beauty[index], index));
                },
              ),
            ),
          ],
        ),
        Positioned(
          top: 134,
          left: 0,
          right: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Material(
                color: Colors.white.withOpacity(0.7),
                child: Container(
                  height: 49,
                  //color: Color(0xfff0f0f0),
                  padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //distance and popular
                      Container(
                          height: 35,
//                    color: Colors.blue,
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //popular
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    StringHelper.popular,
                                    style: TextStyle(
                                      fontSize: 13,
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(top: 5),
                                    height: 3,
                                    width: MediaQuery.of(context).size.width * .13,
                                  ),
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                    color: ColorsHelper.themeBlackColor(),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              //distance
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    StringHelper.distance,
                                    style: TextStyle(
                                      fontSize: 13,
                                      //fontFamily: FontsHelper.fonts_HyGothic_regular
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: ColorsHelper.themeBlackColor(),
                                        borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(top: 5),
                                    height: 3,
                                    width: MediaQuery.of(context).size.width * .11,
                                  )
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 25,
                      ),
                      //Select part
                      Flexible(
                        child: Container(
                          height: 30,
                          decoration: WidgetHelper.customBoxDecorationWithShadow(
                              ColorsHelper.themeBlackColor(),
                              ColorsHelper.whiteColor(),
                              Colors.black,
                              0,
                              15),
                          child: Material(
                            color: ColorsHelper.themeBlackColor(),
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              onTap: () {
                                Vibrate.feedback(FeedbackType.light);
                                Navigator.pushNamed(context, TypeOfBusiness.routeName,
                                    arguments:
                                    CategoryListId.Shop.index.toString())
                                    .then((onValue) {
                                  setState(() {
                                    //setTypeOfBusiness();
                                  });
                                });
                              },
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                alignment: AlignmentDirectional.centerStart,
                                children: <Widget>[
                                  //icon
                                  Container(
                                    margin: EdgeInsets.only(left: 18),
                                    child: Image.asset(
                                      ImageAssets.category_for_review,
                                      width: 16,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // //icon
                                      // Image.asset(
                                      //   ImageAssets.category_for_review,
                                      //   width: 16,
                                      // ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      //select part
                                      Text(
                                        typeOfBusiness ?? StringHelper.SelectPart,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: ColorsHelper.whiteColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_HyGothic_regular
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget categoryListbody(Beauty beauty, int index) {
    return InkWell(
      onTap: () {
        //beautyPageBloc.categoryProfileId = beauty.id;
        //beautyPageBloc.getShopCategoryDetails(context);
        //widget.businessDetailData.subCategories[0].categoryProfileId);
        print("tapped in beauty places Class for Shopprofilepage");
        Vibrate.feedback(FeedbackType.light);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShopProfilePage(beautyshop: true,review: false,)),
        );
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //thubnail image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    color: ColorsHelper.whiteColor(),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          blurRadius: 6,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(7.0),
                    child: Image.asset(
                      arrShops[index],
                      width: MediaQuery.of(context).size.width * .240,
                      height: MediaQuery.of(context).size.width * .240,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
//                ClipRRect(
//                  borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
//                  child: Material(
//                    child: ExtendedImage.network(
//                      "http://via.placeholder.com/350x150",
////                      beauty.thumbnail != null
////                          ? beauty.thumbnail
////                          : StringHelper.default_Avatar,
//                      width: MediaQuery.of(context).size.width * .240,
//                      height: MediaQuery.of(context).size.width * .240,
//                      fit: BoxFit.cover,
//                      cache: true,
//                      enableLoadState: true,
//                      //cancelToken: cancellationToken,
//                    ),
//                    clipBehavior: Clip.antiAlias,
//                  ),
//                ),
                //Text details
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          //beauty.activeName =null ?? 'active user name',
                          'active user name',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            // color: ColorsHelper.darkBlackColor(),
                            fontSize: 15.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular,
                            //fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          //beauty.shopName =null??
                          'shop name',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: ColorsHelper.darkBlackColor(),
                            fontSize: 13.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          //beauty.city = null??
                          'Location',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            //color: ColorsHelper.gray,
                            fontSize: 12.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          //beauty.specialtyOf = null ??
                          'speciality of',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: ColorsHelper.themeColor(),
                            fontSize: 12.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //Distance and discount
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      //"${beauty.distance.toStringAsFixed(1)} Km" ??
                      '1.8 Km',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsHelper.yellowDistanceColor(),
                        fontSize: 13.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    index % 2 == 0
                        ? Image.asset(
                            ImageAssets.discount_review,
                            width: 45,
                          )
                        : Container(),
                  ],
                ),
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
        arrBanner[index],
        fit: BoxFit.cover,
      ),
//      child: Material(
//        child: CachedNetworkImage(
//          placeholder: (context, url) => Image.asset('assets/images/add.png'),
////          placeholder: (context, url) => Container(
////            child: CircularProgressIndicator(
////              strokeWidth: 1.0,
////              valueColor: AlwaysStoppedAnimation<Color>(
////                Colors.transparent,
////              ),
////            ),
////            width: 40.0,
////            height: 40.0,
////            padding: EdgeInsets.all(20.0),
////          ),
//          width: 40.0,
//          height: 40.0,
////          imageUrl: widget.beautyData.sliders[index],
//          imageUrl: "http://via.placeholder.com/350x150",
//          fit: BoxFit.fill,
//        ),
//      ),
    );
  }
}
