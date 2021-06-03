import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/profile/activateHistory.dart';
import 'package:vibrate/vibrate.dart';

class CategoryStrech extends StatefulWidget {
  CategoryStrech({this.body}) {}

  int body = 0;

  @override
  _CategoryStrechState createState() => _CategoryStrechState();
}

class _CategoryStrechState extends State<CategoryStrech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.body == 0
              ? "Eyes"
              : widget.body == 1
                  ? "Breast"
                  : widget.body == 2
                      ? "Facial contour"
                      : widget.body == 3
                          ? "Lipsuction & Body line"
                          : widget.body == 4 ? "Nose" : "Cheekbone"),
        ),
        leading: SizedBox(
            width: 10,
            height: 10,
            child: InkWell(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Vibrate.feedback(FeedbackType.light);
                Navigator.of(context).pop();
              },
            )),
        actions: <Widget>[
          InkWell(
            child: Image.asset(
              ImageAssets.search,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
            },
          ),
          SizedBox(
            width: 15,
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
            width: 15,
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _category(),
      ),
    );
  }

  Widget _category() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: 34),
        itemBuilder: (BuildContext context, int index) {
          return historyCard(index);
        },
      ),
    );
  }

  Widget historyCard(int index) {
    return Padding(
        padding: EdgeInsets.only(top: 2),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .30,
                height: MediaQuery.of(context).size.height * .12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    index == 0
                        ? ImageAssets.beauty_event1
                        : index == 1
                            ? ImageAssets.beauty_event3
                            : ImageAssets.beauty_event2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text("location. Hospital name",
                        style: TextStyle(
                            color: ColorsHelper.blackBgColor(),
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text("Rear Great Breast(title)",
                        style: TextStyle(
                            color: ColorsHelper.blackBgColor(), fontSize: 14)),
                  ),
                  Container(
                    child: Text("will be ok after opreation (subtitle)",
                        style: TextStyle(
                            color: ColorsHelper.blackBgColor(), fontSize: 9)),
                  ),
                  IconTheme(
                    data: IconThemeData(
                      color: ColorsHelper.pinkStarFillColor(),
                      size: 10,
                    ),
                    child: StarDisplay(value: 3),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text(
                        "32%",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelper.blueTextColor()),
                      ),
                      Text("3300USD",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorsHelper.blackBgColor())),
                      Text("500USD",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: ColorsHelper.blackBGColor())),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}
