
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';


class ShopListView extends StatefulWidget {
  final int index;
  ShopListView({Key key, @required this.index}) : super(key: key);
  @override
  _ShopListViewState createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView> {

  List<String> images = [
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
    'assets/images/beauty/shop/shop11.png',
    'assets/images/beauty/shop/shop12.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                child: Image.asset(
                  images[widget.index],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width/3.3,
                  height: MediaQuery.of(context).size.width/3.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Shop name',
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'active user name',
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Location',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 9.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular
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
                            fontSize: 13.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: WidgetHelper.customBoxDecorationWithOutShadow(ColorsHelper.themeBlackColor(), Colors.white, 0, 19),
            child: Padding(
              padding: const EdgeInsets.only(top: 6,bottom: 6,left:18,right: 18),
              child: Text(
                '1.8 Km',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    //fontFamily: FontsHelper.fonts_HyGothic_regular
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
