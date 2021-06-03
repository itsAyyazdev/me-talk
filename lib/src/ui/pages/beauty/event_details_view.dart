import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class EventDetailsView extends StatelessWidget {
  final int index;
  EventDetailsView({Key key, @required this.index}) : super(key: key);
  List<String> images = [
    ImageAssets.beauty_event1,
    ImageAssets.beauty_event2,
    ImageAssets.beauty_event3,
    ImageAssets.beauty_event4,
    ImageAssets.beauty_event5,
    ImageAssets.beauty_event6,
    ImageAssets.beauty_event7,
    ImageAssets.beauty_event8,
    ImageAssets.beauty_event9,
    ImageAssets.beauty_event10,
    ImageAssets.beauty_event11,
    ImageAssets.beauty_event12,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: 94,
            height: 90,
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Location, Hostiptal Name',
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
                  height: 3,
                ),
                Text(
                  'Rear Great breast (title)',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    //fontFamily: FontsHelper.fonts_HyGothic_regular
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Will be ok aftre option (subtitle)',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.0,
                    // fontFamily: FontsHelper.fonts_HyGothic_regular
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                WidgetHelper.showStarRatingView(rating: 5, size: 15),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '32%',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsHelper.blueTextColor(),
                        fontSize: 12.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3200USD',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5000USD',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 9.0,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
