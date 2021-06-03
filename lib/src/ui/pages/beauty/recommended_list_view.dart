import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';

class RecommendedListView extends StatelessWidget {
  final int index;
  RecommendedListView({Key key, @required this.index}) : super(key: key);
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
    return Container(
      child: getRecommendedView(context),
    );
  }

  Widget getRecommendedView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
              borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
              child: Image.asset(
                images[index],
                width: 135,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Rear Great breast (title)',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 11.0,
                //fontFamily: FontsHelper.fonts_HyGothic_regular
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
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
          ),
        ],
      ),
    );
  }
}
