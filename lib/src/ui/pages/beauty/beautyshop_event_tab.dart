
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/home_page/address_search_screen.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:page_indicator/page_indicator.dart';
import 'select_part_shop_screen.dart';
import 'shop_list_view.dart';


class BeautyEventTab extends StatefulWidget {
  @override
  _BeautyEventTabState createState() => _BeautyEventTabState();
}

class _BeautyEventTabState extends State<BeautyEventTab> {

  final PageController pageController = new PageController();
  List<String> categoryList;
  int selectedCategoryId ;
  List<String> images ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = [
      ImageAssets.bg7,
      ImageAssets.bg8,
      ImageAssets.bg9,
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Container(
            color: ColorsHelper.blackBGColor(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => SelectPartShopScreen()
                          )
                      );
                    },
                    child: Container(
                      height: 31,
                      decoration: WidgetHelper.customBoxDecorationWithShadow(ColorsHelper.themeBlackColor(), Colors.white, Colors.black, 0, 15),
                      width: MediaQuery.of(context).size.width-80,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Text(
                            StringHelper.SelectPart,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                //fontFamily: FontsHelper.fonts_HyGothic_regular
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          CupertinoPageRoute(
                              fullscreenDialog: true,
                              //builder: (context) => CitySelectionScreen(isFromReviewList: false,)
                          )
                      );
                    },
                    child: InkWell(
                      onTap: (){
                        //AddressSearchScreen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSearchScreen()));
                      },
                      child: Container(
                        height: 31,
                        decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white, ColorsHelper.themeBlackColor(), Colors.black, 0.5, 5),
                        width: 45,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                                ImageAssets.location_icon,
                                color: ColorsHelper.themeBlackColor(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 110.0,
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
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 9,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 15),
                    child: ShopListView(index: index,));
              },
            ),
          ),
        ],
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

}
