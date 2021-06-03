import 'package:flutter/material.dart';
import 'package:me_talk/src/blocs/bloc_beauty_page/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

class SliderClickPage extends StatefulWidget {
  static const String routeName = "SliderClickPage";
  SliderClickPage({Key key}) : super(key: key);

  @override
  _SliderClickPageState createState() => _SliderClickPageState();
}

class _SliderClickPageState extends State<SliderClickPage> {
  final ScrollController listScrollController = new ScrollController();
  final PageController pageController = new PageController();
  List<String> categoryList;
  int selectedCategoryId;
  List<String> images;
  String typeOfBusiness;
  var arrNail = [
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
  var arrShops = [
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

  BeautyPageBloc beautyPageBloc = BeautyPageBloc();

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          typeOfBusiness ?? StringHelper.category_name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
        ),
        centerTitle: true,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Image.asset(
                  ImageAssets.search,
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => EventSearchScreen(
                  //               typeId: typeId,
                  //             )));
                },
              ),
              SizedBox(
                width: 10,
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
                width: 10,
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
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: ColorsHelper.whiteColor(),
        child: Stack(
          children: <Widget>[
//stack below body
            ListView(
              padding: EdgeInsets.only(top: 75),
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                //recent new photo List
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      //recent new photo
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            StringHelper.recent_new_photo,
                            style: TextStyle(
                                color: ColorsHelper.themeBlackColor(),
                                fontSize: 15,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
                          ),
                          IconButton(
                            icon: Image.asset(
                              ImageAssets.arrow_right,
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {
                              Vibrate.feedback(FeedbackType.light);
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          controller: listScrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            padding: EdgeInsets.only(
                                left: 0, right: 5, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                                color: ColorsHelper.whiteColor(),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(8.0)),
                              child: Image.asset(
                                arrNail[index],
                                fit: BoxFit.fill,
                                height: 64,
                                width: 64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Category List
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15),
                          child: categoryListbody(index));
                    },
                  ),
                ),
              ],
            ),
//Slect category and location
            Container(
              color: Colors.transparent,
              padding:
                  const EdgeInsets.only(left: 30, right: 30, bottom: 8, top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Select part
                  Container(
                    height: 31,
                    width: MediaQuery.of(context).size.width,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //icon
                            Image.asset(
                              ImageAssets.category_for_review,
                              width: 16,
                            ),
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
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Request suggest business profile
                  Container(
                    height: 31,
                    width: MediaQuery.of(context).size.width,
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
                          AppNavigator.launchShopRequest(context);
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Center(
                          child: Text(
                            StringHelper.request_suggest_business,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 13.0,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryListbody(int index) {
    return InkWell(
      onTap: () {
        // beautyPageBloc.categoryProfileId = 30;
        // beautyPageBloc.getShopCategoryDetails(context);
        // //widget.businessDetailData.subCategories[0].categoryProfileId);
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
                ClipRRect(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  child: Image.asset(
                    "${arrShops[index]}",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                  ),
                ),
                //Text details
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'active user name',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                              color: ColorsHelper.darkBlackColor(),
                              fontSize: 17.0,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'shop name',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorsHelper.darkBlackColor(),
                              fontSize: 15.0,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Location,',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: ColorsHelper.grayColor(),
                            fontSize: 13.0,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'speciality of',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: ColorsHelper.themeColor(),
                            fontSize: 14.0,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
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
                    top: 0, bottom: 3, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '1.8 Km',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsHelper.yellowDistanceColor(),
                        fontSize: 14.0,
                        fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
