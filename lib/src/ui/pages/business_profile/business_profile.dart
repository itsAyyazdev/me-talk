import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/models/businessDetailbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import 'package:me_talk/src/utils/popup_dialogs/add_business_category_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/post_business_popup.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibrate/vibrate.dart';

class BusinessProfile extends StatefulWidget {
  final BusinessDetailData businessDetailData;
  static const String routeName = "BusinessProfile";
  BusinessProfile({Key key, this.businessDetailData}) : super(key: key);

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  final formKey = GlobalKey<FormState>();
  final PageController pageController = new PageController();

  @override
  initState() {
    super.initState();
    print(widget.businessDetailData.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColorBG(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
                backgroundColor: ColorsHelper.whiteColorBG(),
                appBar: AppBar(
                  elevation: 6,
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
                  create: (BuildContext context) => businessProfileBloc,
                  child: BlocBuilder(
                    bloc: businessProfileBloc,
                    builder:
                        (BuildContext context, BusinessProfileState state) {
                      if (state is InitialBusinessProfileState) {
                        return businessProfileBody();
                      } else {
                        return Container(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                )
                )));
  }

  Widget businessProfileBody() {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      color: ColorsHelper.whiteColorBG(),
      child: ScrollConfiguration(
        behavior: ListViewScrollBehavior(),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //Profile Pic
            Container(
              width: 130.0,
              height: 130.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Material(
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Container(
                      width: 130.0,
                      height: 130.0,
                      alignment: Alignment.center,
                      child: Icon(Icons.error)),
                  placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.black,
                      ),
                    ),
                    width: 130.0,
                    height: 130.0,
                    padding: EdgeInsets.all(60.0),
                  ),
                  imageUrl: widget.businessDetailData.photo != null
                      ? widget.businessDetailData.photo
                      : StringHelper.default_Avatar,
                  width: 130.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //Recoment code & revenue management
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Stack(
                    children: <Widget>[
                      //you_will_get_text
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 18),
                        height: 55,
                        decoration: BoxDecoration(
                            color: ColorsHelper.whiteColor(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          StringHelper.you_will_get_text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.grayColor(),
                              fontSize: 10,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                      ),
                      //Recoment code
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: double.infinity,
                        child: Text(
                          "${StringHelper.recoment_code} ${widget.businessDetailData.recommendedCode}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 14,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                        decoration: BoxDecoration(
                            color: ColorsHelper.darkBlackColor(),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[700],
                                blurRadius: 4,
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //revenue management
                      ButtonColor(
                        blurRadius: 3,
                        height: 55,
                        radius: 15,
                        width: MediaQuery.of(context).size.width * 0.27,
                        color: ColorsHelper.lightGreenColor(),
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                          AppNavigator.launchRevenueManager(context);
                        },
                        child: Text(
                          StringHelper.revenue_management,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsHelper.whiteColor(),
                              fontSize: 14,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Business category details and status List
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.businessDetailData.subCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return businessCategory(
                    widget.businessDetailData.subCategories[index],
                    index,
                    widget.businessDetailData.subCategories.length);
              },
            ),
            //Credit and request credit
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.105,
              decoration: BoxDecoration(
                  color: ColorsHelper.whiteColor(),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //credits
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        widget.businessDetailData.credits,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsHelper.themeBlackColor(),
                            fontSize: 25,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        StringHelper.credit,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsHelper.grayColor(),
                            fontSize: 15,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                      ),
                    ],
                  ),
                  //request Credit
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorsHelper.themeBlackColor(),
                    child: InkWell(
                      splashColor: ColorsHelper.grayColor(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        AppNavigator.launchpurchaseCredit(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: ColorsHelper.whiteColor(),
                              size: 30,
                            ),
                            Text(
                              StringHelper.request_credit,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsHelper.whiteColor(),
                                  fontSize: 15,
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //Post button
            ButtonColor(
              height: 50,
              radius: 15,
              width: MediaQuery.of(context).size.width * 0.9,
              color: ColorsHelper.themeBlackColor(),
              onPressed: () {
                Vibrate.feedback(FeedbackType.light);
                if (widget.businessDetailData.subCategories.length > 1) {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return PostBusinessPopup.openPopup(context, 0,
                            subCat: widget.businessDetailData.subCategories);
                      }));
                } else
                  AppNavigator.launchUploadPortfolioPics(
                      context,
                      widget.businessDetailData.subCategories[0]
                          .categoryProfileId);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            StringHelper.post,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 15,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorsHelper.whiteColor(),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            // 4 option box
            Card(
              color: ColorsHelper.whiteColor(),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 0, bottom: 0),
                child: Column(
                  children: <Widget>[
                    //1st row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Cerdit History , 1
                        fourActionsButton(StringHelper.CreditHistory, 1,
                            ImageAssets.credit_history),
                        //profile , 2
                        fourActionsButton(
                            StringHelper.Profile, 2, ImageAssets.profile),
                      ],
                    ),
                    Divider(
                      height: 18,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Customer,3
                        fourActionsButton(
                            StringHelper.Customer, 3, ImageAssets.customer),
                        //Scedule ,4
                        fourActionsButton(
                            StringHelper.scedule, 4, ImageAssets.scedule)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Slider
            Card(
              color: ColorsHelper.whiteColor(),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 157.0,
                    child: PageIndicatorContainer(
                      pageView: PageView.builder(
                        itemBuilder: getPagerView,
                        itemCount: widget.businessDetailData.sliders.length,
                        controller: pageController,
                      ),
                      align: IndicatorAlign.bottom,
                      length: widget.businessDetailData.sliders.length,
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
                              fontSize: 16,
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
              height: 20,
            ),
            //contact to manager
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: InkWell(
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                  AppNavigator.launchContactManager(context);
                },
                child: Text(
                  StringHelper.contact_to_manager,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget businessCategory(SubCategories subCategories, int index, int length) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Stack(
                children: <Widget>[
                  //Followers, work compelete, portfolio, Review
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height * 0.115,
                      decoration: BoxDecoration(
                          color: ColorsHelper.whiteColor(),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.6),
                          //     blurRadius: 10.0, // soften the shadow
                          //     spreadRadius: 1.0, //extend the shadow
                          //     offset: Offset(
                          //       0, // Move to right 10  horizontally
                          //       1.4, // Move to bottom 10 Vertically
                          //     ),
                          //   )
                          // ],
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
                                subCategories.followers.toString(),
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
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: ColorsHelper.grayColor(),
                            indent: 30,
                            endIndent: 30,
                          ),
                          //work Complete
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.workComplete.toString(),
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
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: ColorsHelper.grayColor(),
                            indent: 30,
                            endIndent: 30,
                          ),
                          //Portfolio
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.portfolio.toString(),
                                style: TextStyle(
                                  color: ColorsHelper.themeBlackColor(),
                                  fontSize: 17
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
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: ColorsHelper.grayColor(),
                            indent: 30,
                            endIndent: 30,
                          ),
                          //Review
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                subCategories.review.toString(),
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
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic,
                                  fontSize: 10,
                                  // fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  //Category name
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    width: MediaQuery.of(context).size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //category name
                        Text(
                          subCategories.categoryName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsHelper.themeBlackColor(),
                            fontSize: 15,
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                        //category icon
                        Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              placeholder: (context, url) => Container(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                                width: 20.0,
                                height: 20.0,
                                padding: EdgeInsets.all(10.0),
                              ),
                              imageUrl: subCategories.icon != null
                                  ? subCategories.icon
                                  : StringHelper.default_Avatar,
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.cover,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorsHelper.whiteColor(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[700],
                            blurRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(21))),
                  ),
                  //Plus button
                  index == length - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.12),
                              height: 28,
                              width: 28,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Vibrate.feedback(FeedbackType.light);
                                  Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) {
                                        return AddBusinessCategoryPopup
                                            .openPopup(context,
                                                widget.businessDetailData.id);
                                      }));
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: ColorsHelper.darkBlackColor(),
                                  size: 28,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: ColorsHelper.whiteColorBG(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[700],
                                      blurRadius: 4,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                            ),
                          ],
                        )
                      : Container(),
                  //Active status , 0 not active, 1 active
                  subCategories.categoryStatus == 1
                      ? Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .6,
                              right: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            StringHelper.activating,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 12,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[700],
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )
                      : Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .6,
                              right: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            StringHelper.not_active,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 12,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[700],
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget fourActionsButton(String name, int number, String icon) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: ColorsHelper.whiteColor(),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: () {
            Vibrate.feedback(FeedbackType.light);
            switch (number) {
              case 1:
                AppNavigator.launchCreditHistory(context);
                break;
              case 2:
                if (widget.businessDetailData.subCategories.length > 1) {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return PostBusinessPopup.openPopup(context, 1,
                            subCat: widget.businessDetailData.subCategories);
                      }));
                } else
                  businessProfileBloc.getShopCategoryDetails(
                      context,
                      widget.businessDetailData.subCategories[0]
                          .categoryProfileId);
                break;
              case 3:
                break;
              case 4:
                break;
              default:
            }
            // AppNavigator.launchHospitalProfile(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                icon,
                width: 22,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 12,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
            ],
          ),
        ),
      ),
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
          imageUrl: widget.businessDetailData.sliders[index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
