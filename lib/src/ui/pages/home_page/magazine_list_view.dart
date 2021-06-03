import 'package:flutter/material.dart';

import 'package:me_talk/src/res/image_assets.dart';

class MagazineListView extends StatelessWidget {
  final List<String> images = [
    ImageAssets.ero1,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMagazineGridView(context),
    );
  }

  Widget getMagazineGridView(BuildContext context) {
    return new InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              child: Image.asset(
                images[0],
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2 - 80,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'The word "the" is one of the most common words',
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black87,
                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                  fontWeight: FontWeight.w700,
                  fontSize: 11.0),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
