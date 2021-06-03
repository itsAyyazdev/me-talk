import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as prefix;
import 'package:me_talk/src/blocs/bloc_homepage/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/event_detail_screen.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_portfolio_page.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/business.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/ui/pages/home_page/extendBeforeAfter.dart';
import 'package:me_talk/src/ui/pages/home_page/followFollowing.dart';
import 'package:me_talk/src/ui/pages/profile/activateHistory.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibrate/vibrate.dart';

import 'before_aftre_view.dart';
import 'categoryStrech.dart';
import 'event_details_view.dart';
import 'magazine_list_view.dart';
import 'recent_order_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomepageBloc homepageBloc = HomepageBloc();

  List<String> images = [
    ImageAssets.b1,
    ImageAssets.b2,
    ImageAssets.b3,
    ImageAssets.b4,
  ];

  List<String> imagesBeauty = [
    ImageAssets.imog1,
    ImageAssets.imog2,
    ImageAssets.imog3,
    ImageAssets.imog4,
    ImageAssets.imog5,
    ImageAssets.imog6,
    ImageAssets.imog7,
    ImageAssets.imog8,
    ImageAssets.imog9,
    ImageAssets.imog10,
    ImageAssets.imog11,
    ImageAssets.imog12,
    ImageAssets.imog13,
    ImageAssets.imog14,
    ImageAssets.imog15,
  ];
  List<String> tagList = ['Eyes','Breast','Facial contour','Liposuction & Body line' ,'Nose', 'Cheekbone',];

  List<String> carePlaceList;

  double latitude, longitude;
  int currentBeforeIndex;
  String cityId;
  String currentLocation = "";
  bool isFeaturedPostList;

  prefix.Location _locationService = new prefix.Location();
  bool _permission = false;
  String error;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = new PageController();

  @override
  void dispose() {
    super.dispose();
    homepageBloc.close();
  }

  @override
  void initState() {
    // homepageBloc.add(GetHomePageData(context));
    super.initState();
    cityId = '783';
    currentBeforeIndex = 0;
    isFeaturedPostList = true;
    carePlaceList = [
      StringHelper.care_place_caps,
      StringHelper.visited_place_caps,
      StringHelper.business_place_caps
    ];
    /* new Future.delayed(const Duration(microseconds: 100), () {
      getCurrentLocation();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          body: BlocProvider(
        create: (BuildContext context) => homepageBloc,
        child: BlocBuilder(
          bloc: homepageBloc,
          builder: (BuildContext context, HomepageState state) {
            return homeBody();
            // if (state.homePageData != null) {
            //   return homeBody();
            // } else {
            //   return Container(
            //     color: Colors.black,
            //   );
            // }
          },
        ),
      )),
    );
  }

  Widget homeBody() {
    double margin =
        (Platform.isIOS ? 102.0 : 25.0 + (Platform.isIOS ? 75 : 62));
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: margin,
            color: Colors.white,
          ),
//Banner
          Visibility(
            visible: isFeaturedPostList,
            child: SizedBox(
              //height: MediaQuery.of(context).size.height * 0.17,
              height: 140,
              child: PageIndicatorContainer(
                pageView: PageView.builder(
                  itemBuilder: getPagerView,
                  itemCount: images.length,
                  controller: pageController,
                ),
                align: IndicatorAlign.bottom,
                length: images.length,
                shape: IndicatorShape.circle(size: 5),
                indicatorSpace: 10.0,
                indicatorColor: Colors.white54,
                indicatorSelectorColor: Colors.white,
              ),
            ),
          ),
//Care place heading
          Visibility(
            visible: true,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 22, left: 28.0, right: 28.0, bottom: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    carePlacesListView(context, 0),
                    carePlacesListView(context, 1),
                    carePlacesListView(context, 2)
                  ],
                ),
              ),
            ),
//            child: Container(
//             // width: MediaQuery.of(context).size.width,
//              //color: Colors.black12,
//              height: MediaQuery.of(context).size.width / 2.65,
//              child: Padding(
//                padding:
//                    const EdgeInsets.only(top: 15.0),
//                child: new GridView.builder(
//                  padding: EdgeInsets.zero,
//                  gridDelegate:
//                  new SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 1,
//                      childAspectRatio: 1,),
//                  shrinkWrap: true,
//                  scrollDirection: Axis.horizontal,
//                  itemCount: carePlaceList.length,
//                  itemBuilder: carePlacesListView,
//                ),
//              ),
//            ),
          ),
          //Your Booking to visit heading
          Visibility(
            visible: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 17.0, right: 15.0),
                  child: Text(
                    StringHelper.your_booking,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                    ),
                  ),
                ),
                //Booking place Body
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 15),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  //physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        // height: 100,
                        child: RecentOrderListView(
                      index: index,
                    ));
                  },
                ),
              ],
            ),
          ),

          //your_following_beauty_place heading
          Visibility(
            visible: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 21.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        StringHelper.your_following_beauty_place,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                      ),
                      InkWell(

                        child: Image.asset(
                          ImageAssets.arrow_right,
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => new FollowingBeautyPlaces()));

                        },
                      ),
                    ],
                  ),
                ),
                //your_following_beauty_place body
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 10,
                    //height: MediaQuery.of(context).size.width - 20,
                    child: new GridView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1),
                      itemBuilder: getFollowingBeautyView,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 22, bottom: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => new FollowingBeautyPlaces()));

                    },
                    child: Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ],
                        color: ColorsHelper.themeBlackColor(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            StringHelper.seeMore,
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 14,
                                color: ColorsHelper.whiteColor()),
                          ),
                          Image.asset(
                            ImageAssets.more_white,
                            width: 40.0,
                            height: 5.0,
                            //color: Colors.white,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //belleTal_Magazine heading & body
          Visibility(
            visible: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        StringHelper.belleTal_Magazine,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          ImageAssets.arrow_right,
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10),
                  child: new GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (BuildContext context, int index) {
                      return MagazineListView();
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xffDEDEDE),
            height: 0,
            thickness: 0.5,
          ),
          //Before After body and heading
          Visibility(
            visible: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 17.0, right: 17.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Before  After',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          ImageAssets.arrow_right,
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => ExtendBeforeAfter()));

                         },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 13, right: 17),
                  child: BeforeAfterView(
                    isHome: true,
                    isBeauty: false,
                  ),
                )
              ],
            ),
          ),
//          Visibility(
//            visible: false,
//            child: SizedBox(
//              height: 345,
//              child: SectionTableView(
//                sectionCount: tagList.length,
//                numOfRowInSection: (section) {
//                  return 1;
//                },
//                cellAtIndexPath: (section, row) {
//                  return getCategoryCellView(context, section);
//                },
//                headerInSection: (section) {
//                  return getCategoryHeaderView(context, section);
//                },
//              ),
//            ),
          Visibility(
            visible: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(top: 0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: tagList.length,
              shrinkWrap: true,
              itemBuilder: getCategoryHeaderView,
            ),
          ),
          Container(
            width: double.infinity,
            height: margin,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget carePlacesListView(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          carePlaceList[index],
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            color: ColorsHelper.dashboardGrid(),
            fontSize: 12,
            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
            //fontWeight: FontWeight.w700
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
//            width: MediaQuery.of(context).size.width / 4.9,
//            height: MediaQuery.of(context).size.width / 4.9,
            width: 77,
            height: 77,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorsHelper.themeBlackColor().withOpacity(0.37),
                    blurRadius: 15,
                    offset: Offset(0, 10),
                  )
                ],
                color: index == 0
                    ? ColorsHelper.pinkDropDown()
                    : ColorsHelper.whiteColor()),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                  if (index == 0) {
                    Vibrate.feedback(FeedbackType.light);
                    Navigator.pushNamed(context, TypeOfBusiness.routeName,
                            arguments: CategoryListId.Shop.index.toString())
                        .then((onValue) {
                      setState(() {});
                    });
                  }
                  if (index == 1) {
                    Vibrate.feedback(FeedbackType.light);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => new HistoryRequest(body: 1,)));

                  }
                  if (index == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Business()));
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(15.0)),
                      ),
                      Image.asset(
                        index == 0
                            ? 'assets/images/category.png'
                            : index == 1
                                ? 'assets/images/visited.png'
                                : 'assets/images/business_home.png',
                        fit: BoxFit.contain,
                      )
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

  Widget getFollowingBeautyView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: InkWell(
        onTap: () {
          Vibrate.feedback(FeedbackType.light);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopPortfolioPage()),
          );
        },
        child: Image.asset(
          imagesBeauty.elementAt(index),
          //height: 55,
          // width: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    //await _locationService.changeSettings(interval: 1000);
    prefix.LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        await _locationService.requestPermission().then((onValue){
          prefix.PermissionStatus status = onValue;
          _permission =  status == prefix.PermissionStatus.GRANTED?true:false;
        });
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();
          latitude = location.latitude;
          longitude = location.longitude;

          final List<Placemark> placeMarks =
              await Geolocator().placemarkFromCoordinates(latitude, longitude);

          if (placeMarks != null && placeMarks.isNotEmpty) {
            print("=====${placeMarks[0].locality}");
            currentLocation = placeMarks[0].locality;
          }

          getCurrentCountryCode();
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          if (_permission) {
            location = await _locationService.getLocation();
            latitude = location.latitude;
            longitude = location.longitude;
            getCurrentCountryCode();
          }
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }
  }

  static tags({BuildContext context, String tags}) {
    List<String> tagList = [];
    if (tags.isNotEmpty) {
      tagList = tags.split(",");
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Visibility(
          visible: tags.isNotEmpty,
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 35,
            child: Wrap(
              runSpacing: 0,
              spacing: 8,
              children: tagList
                  .map(
                    (tags) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          ImageAssets.star_tag,
                          width: 10,
                          height: 10,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          tags,
                          maxLines: 5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }

  Widget getBeforeAfterView(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          onBeforeListClick(index);
        },
        child: ClipRRect(
          borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
          child: Stack(
            children: <Widget>[
              new Image.asset(
                images[index % images.length],
                height: 55,
                width: 60,
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: index == currentBeforeIndex ? true : false,
                child: Container(
                  height: 55,
                  width: 60,
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      ImageAssets.check_white,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCategoryHeaderView(BuildContext context, int section) {
    return InkWell(
      onTap: () {
        onHeaderItemClick(section);
      },
      child: Column(
        children: <Widget>[
          Divider(
            color: ColorsHelper.dividerGreyColor(),
            height: 0,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 15.0, top: 25, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  tagList[section],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.0,
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    ImageAssets.arrow_right,
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.contain,
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CategoryStrech(body: section,)));
                  },
                ),
              ],
            ),
          ),
//          getCategoryCellView(context, section),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 34),
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return _buildCarousel(context, index ~/ 2);
              } else {
                return Container(
                  color: Colors.black,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget getCategoryCellView(BuildContext context, int section) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 345,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: new GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.35),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    onCellItemClick(section, index);
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 10, bottom: 10),
                      child: EventDetailsView(
                        index: index,
                      )),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  void onHeaderItemClick(int section) async {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => EventListScreen(
    //               isFromHomeTab: true,
    //               eventCategory: tagList[section],
    //             )));
  }

  void onCellItemClick(int section, int row) async {
    print('Header $section  Row $row');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }

  Widget getItemView(BuildContext context, int index) {
    return SizedBox(
      height: 100,
      child: Image.asset(
        images[0],
        fit: BoxFit.cover,
        height: 100,
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

  Widget recentOrderItem(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      child: new Image.asset(
        images[index % images.length],
        fit: BoxFit.fill,
      ),
    );
  }

  void onBeforeListClick(int index) {
    currentBeforeIndex = index;
    setState(() {});
    print('onBeforeListClick');
  }

  void onBeforeAfterDetailsClick() {
    print('onBeforeAfterDetailsClick $currentBeforeIndex');
  }

  // _displayDialog() {
  //   showDialog<void>(
  //       barrierDismissible: true,
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           color: Colors.green,
  //         );
  //         // ShopCategoryListAlertView(
  //         //   categoryTypeId: "2",
  //         // );
  //       });
  // }

  void featuredPostApi() async {
    // FeaturedPostResponse _response =
    //     await DataManagerInheritedWidget.of(context)
    //         .apiRepos
    //         .featuredPostRequest(context, cityId);

    // if (_response.statusCode == 200) {
    //   if (_response.data.length > 0) {
    //     featuredPostList.clear();
    //     setState(() {
    //       isFeaturedPostList = true;
    //       featuredPostList = _response.data;
    //     });
    //   } else {
    //     isFeaturedPostList = false;
    //   }
    // } else {
    //   Utility.showAlertDialogCallBack(
    //       context: context, message: _response.message);
    // }
  }

  void carePlacesItemClicked(int index) {
    Vibrate.feedback(FeedbackType.light);
    if (index == 0) {
      Navigator.pushNamed(context, TypeOfBusiness.routeName,
              arguments: CategoryListId.Shop.index.toString())
          .then((onValue) {
        setState(() {
          //setTypeOfBusiness();
        });
      });
    } else if (index == 1) {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => LatestVisitedScreen()));
    } else if (index == 2) {
      //AppNavigator.launchProfilePage(context);
      AppNavigator.launchBusinessProfile(context, null);
    } else {}
  }

  void getCurrentCountryCode() async {
    // CommonResponse _response = await DataManagerInheritedWidget.of(context)
    //     .apiRepos
    //     .getCurrentCity(
    //         context: context, latitude: latitude, longitude: longitude);
    // if (_response.statusCode == 200) {
    //   Map<String, dynamic> data = _response.data;
    //   String dataString = jsonEncode(data);
    //   await SharePreferencesHelper()
    //       .setString(SharePreferencesHelper.Country_Data, dataString);
    // }
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    //12: number of item in event list
    //3: number of item display per page
    int division = 9 ~/ 3;
    int reminder = (9 % 3);
    int pageLenght = reminder == 0 ? division : division + 1;
    return SizedBox(
      // you may want to use an aspect ratio here for tablet support
      height: 345.0,
      child: PageView.builder(
        pageSnapping: true,
        itemCount: pageLenght,
        // store this controller in a State to save the carousel scroll position
        controller: PageController(
          viewportFraction: 0.79,
        ),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, itemIndex, reminder, division);
        },
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int index, int reminder, int division) {
    int itemIndex = index * 3;
    List<Widget> item = [];
    if (reminder != 0 && index == division) {
      if (reminder == 1) {
        item.add(
          EventDetailsView(
            index: itemIndex,
          ),
        );
      } else {
        item.add(
          EventDetailsView(
            index: itemIndex,
          ),
        );
        item.add(SizedBox(
          height: 23,
        ));
        item.add(
          EventDetailsView(
            index: itemIndex + 1,
          ),
        );
      }
    } else {
      item.add(
        EventDetailsView(
          index: itemIndex,
        ),
      );
      item.add(SizedBox(
        height: 23,
      ));
      item.add(
        EventDetailsView(
          index: itemIndex + 1,
        ),
      );
      item.add(SizedBox(
        height: 23,
      ));
      item.add(
        EventDetailsView(
          index: itemIndex + 2,
        ),
      );
    }
    return Container(
      transform: Matrix4.translationValues(-25.0, 0, 0),
      child: Column(
        children: item,
      ),
    );
  }
}
