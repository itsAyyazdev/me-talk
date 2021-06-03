import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class EventReviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(right: 15),
//                    child: Text(
//                      StringHelper.str_call,
//                      textAlign: TextAlign.left,
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontSize: 14,
//                          fontFamily: FontsHelper.fonts_medium),
//                    ),
//                  ),
//                  WidgetHelper.showStarRatingView(context: context,rating: 5,size: 15),
//                ],
//              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 12.5,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(ImageAssets.bg7)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'USER NAME',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 6.0,
                                  color: Colors.black.withOpacity(0.16),
                                )
                              ],
                              color: Colors.black,
                              fontSize: 12.0,
                              //fontFamily: FontsHelper.fonts_Poppins_Medium
                          ),
                        ),
                      ],
                    ),
                  ),
                  WidgetHelper.showStarRatingView(
                      context: context, rating: 5, size: 15),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  'orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(0.0, 3.0),
                          blurRadius: 6.0,
                          color: Colors.black.withOpacity(0.16),
                        )
                      ],
                      color: Colors.black,
                      fontSize: 11,
                      //fontFamily: FontsHelper.fonts_Poppins_Medium
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  //mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      ImageAssets.like_unsel,
                      width: 17,
                      height: 17,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: Text(
                        '31',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          //fontFamily: FontsHelper.fonts_Segoe_regular,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Image.asset(
                        ImageAssets.comment_icon,
                        width: 17,
                        height: 17,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 8),
                      child: Text(
                        '5',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          //fontFamily: FontsHelper.fonts_Segoe_regular,
                        ),
                      ),
                    ),
//                        Flexible(
//                          child:Container(
//                            decoration: WidgetHelper.customBoxDecorationWithOutShadow(ColorsHelper.themeBlackColor(), Colors.white, 0, 10),
//                            child: Padding(
//                              padding: const EdgeInsets.only(top: 5,bottom: 3,left:10,right: 10),
//                              child: Text(
//                                'Get info 41',
//                                textAlign: TextAlign.left,
//                                overflow: TextOverflow.ellipsis,
//                                maxLines: 2,
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 12.0,
//                                    fontFamily: FontsHelper.fonts_medium
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
                  ],
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.only(bottom: 10),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  //mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    InkWell(
//                      child: Image.asset(
//                        ImageAssets.next_arrow,
//                        width: 20.0,
//                        height: 20.0,
//                        fit: BoxFit.contain,
//                      ),
//                      onTap: () {
//
//                      },
//                    ),
//                  ],
//                ),
//              ),
            ],
          ),
        ),
        Divider(
          color: ColorsHelper.darkGrayColor(),
          height: 0,
          thickness: 0.1,
        ),
      ],
    );
  }
}
