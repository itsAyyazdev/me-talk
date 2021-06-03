import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/review/review_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vibrate/vibrate.dart';

class WriteReview extends StatefulWidget {
  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  double rating = 0;
  int pagechanger = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: ColorsHelper.whiteColor(),
          title: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Center(
              child: Text(
                "REVIEW",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
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
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10),
              child: InkWell(
                child: Text(
                  "PUBLISH",
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));

                },
              ),
            ),
          ],
        ),
        body: pagechanger == 1 ? _reviewBody() : _picturReview());
  }

  Widget _reviewBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                pagechanger = 2;
              });
            },
            child: Container(
                width: MediaQuery.of(context).size.width * .5,
                height: 40,
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(top: 30, bottom: 30, left: 0, right: 15),
                decoration: BoxDecoration(
                  color: ColorsHelper.dashboardGrid(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Picture attachment",
                    style: TextStyle(
                        color: ColorsHelper.whiteColor(),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: 15,
                  width: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/warn.png',
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              Text("Select picture that your favorite one",
                  style: TextStyle(
                      color: ColorsHelper.dashboardGrid(),
                      fontSize: 12,
                      fontFamily: 'MontserratMedium',
                      fontWeight: FontWeight.normal)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Grade",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'MontserratMedium',
                color: ColorsHelper.black60Color()),
          ),
          SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: (v) {
                rating = v;
                setState(() {});
              },
              starCount: 5,
              rating: rating,
              size: 40.0,
              color: ColorsHelper.themeColor(),
              borderColor: ColorsHelper.themeColor(),
              spacing: 0.0),
          SizedBox(
            height: 20,
          ),
          Text(
            "Write review",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'MontserratMedium',
                color: ColorsHelper.black60Color()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 8,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
          ),
        ],
      ),
    );
  }

  Widget _picturReview() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Picture attachment",
            style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Before(not essential)",
            style: TextStyle(
                fontFamily: 'MontserratMedium',
                fontSize: 20,
                color: ColorsHelper.black60Color()),
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                  decoration: new BoxDecoration(
                      color: ColorsHelper.whiteColor(),

                      boxShadow: [
                    BoxShadow(
                      color: ColorsHelper.black60Color().withOpacity(0.2),
                      blurRadius: 2.0,
                      // has the effect of softening the shadow
                      spreadRadius: 2.0,
                      // has the effect of extending the shadow
                      offset: Offset(
                        2.0, // horizontal, move right 10
                        2.0, // vertical, move down 10
                      ),
                    )
                  ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                  width: 60,
                  height: 60,
                     child: new Center(
                    child:Text("Preview",style: TextStyle(color: ColorsHelper.themeColor(),),textAlign: TextAlign.center,),
                  )),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: new Container(

                  decoration: new BoxDecoration(
                      color: ColorsHelper.whiteColor(),

                      boxShadow: [
                    BoxShadow(
                      color: ColorsHelper.black60Color().withOpacity(0.2),
                      blurRadius: 2.0,
                      // has the effect of softening the shadow
                      spreadRadius: 2.0,
                      // has the effect of extending the shadow
                      offset: Offset(
                        2.0, // horizontal, move right 10
                        2.0, // vertical, move down 10
                      ),
                    )
                  ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                  width: 60,
                  height: 60,
                  child: new Center(
                    child: Image.asset(
                      'assets/images/add.png',
                    ),
                  )) ,
            ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: new Container(
                    decoration: new BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: ColorsHelper.black60Color().withOpacity(0.2),
                        blurRadius: 2.0,
                        // has the effect of softening the shadow
                        spreadRadius: 2.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          2.0, // horizontal, move right 10
                          2.0, // vertical, move down 10
                        ),
                      )
                    ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    width: 60,
                    height: 60,
                    child: new Center(
                      child: Image.asset(
                        'assets/images/add.png',
                      ),
                    )) ,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: new Container(
                    decoration: new BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: ColorsHelper.black60Color().withOpacity(0.2),
                        blurRadius: 2.0,
                        // has the effect of softening the shadow
                        spreadRadius: 2.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          2.0, // horizontal, move right 10
                          2.0, // vertical, move down 10
                        ),
                      )
                    ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    width: 60,
                    height: 60,
                    child: new Center(
                      child: Image.asset(
                        'assets/images/add.png',
                      ),
                    )) ,
              ),

            ],
          ),
          SizedBox(
            height: 25,
          ),

          Text(
            "After",
            style: TextStyle(
                fontFamily: 'MontserratMedium',
                fontSize: 20,
                color: ColorsHelper.black60Color()),
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                  decoration: new BoxDecoration(
                      color: ColorsHelper.whiteColor(),

                      boxShadow: [
                        BoxShadow(
                          color: ColorsHelper.black60Color().withOpacity(0.2),
                          blurRadius: 2.0,
                          // has the effect of softening the shadow
                          spreadRadius: 2.0,
                          // has the effect of extending the shadow
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        )
                      ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                  width: 60,
                  height: 60,
                  child: new Center(
                    child:Text("Preview",style: TextStyle(color: ColorsHelper.themeColor(),),textAlign: TextAlign.center,),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: new Container(

                    decoration: new BoxDecoration(
                        color: ColorsHelper.whiteColor(),

                        boxShadow: [
                          BoxShadow(
                            color: ColorsHelper.black60Color().withOpacity(0.2),
                            blurRadius: 2.0,
                            // has the effect of softening the shadow
                            spreadRadius: 2.0,
                            // has the effect of extending the shadow
                            offset: Offset(
                              2.0, // horizontal, move right 10
                              2.0, // vertical, move down 10
                            ),
                          )
                        ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    width: 60,
                    height: 60,
                    child: new Center(
                      child: Image.asset(
                        'assets/images/add.png',
                      ),
                    )) ,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: new Container(
                    decoration: new BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: ColorsHelper.black60Color().withOpacity(0.2),
                        blurRadius: 2.0,
                        // has the effect of softening the shadow
                        spreadRadius: 2.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          2.0, // horizontal, move right 10
                          2.0, // vertical, move down 10
                        ),
                      )
                    ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    width: 60,
                    height: 60,
                    child: new Center(
                      child: Image.asset(
                        'assets/images/add.png',
                      ),
                    )) ,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: new Container(
                    decoration: new BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: ColorsHelper.black60Color().withOpacity(0.2),
                        blurRadius: 2.0,
                        // has the effect of softening the shadow
                        spreadRadius: 2.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          2.0, // horizontal, move right 10
                          2.0, // vertical, move down 10
                        ),
                      )
                    ], borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    width: 60,
                    height: 60,
                    child: new Center(
                      child: Image.asset(
                        'assets/images/add.png',
                      ),
                    )) ,
              ),

            ],
          ),
          SizedBox(
            height: 20,
          ),

          Text(
            "Grade",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'MontserratMedium',
                color: ColorsHelper.black60Color()),
          ),
          SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: (v) {
                rating = v;
                setState(() {});
              },
              starCount: 5,
              rating: rating,
              size: 40.0,
              color: ColorsHelper.themeColor(),
              borderColor: ColorsHelper.themeColor(),
              spacing: 0.0),
          SizedBox(
            height: 20,
          ),
          Text(
            "Write review",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'MontserratMedium',
                color: ColorsHelper.black60Color()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 8,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
          ),
        ],
      ),
    );
  }
}
