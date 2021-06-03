import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WriteReviewData extends StatefulWidget {
  WriteReviewData({this.hospital, this.beautyScreen1});
  bool hospital;
  bool beautyScreen1;
  @override
  _WriteReviewDataState createState() =>
      _WriteReviewDataState(hospital: hospital,beautyScreen1: beautyScreen1);
}

class _WriteReviewDataState extends State<WriteReviewData> {
  _WriteReviewDataState({this.hospital, this.beautyScreen1});
  bool hospital;
  double rating = 0;
  bool beautyScreen1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Text("Review"),
        centerTitle: true,
        actions: <Widget>[
          Container(
              height: 70,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10),
              child: Text(
                "PUBLISH",
                style: TextStyle(
                  color: Color(0xff353A50),
                  fontSize: 13,
                ),
              ))
        ],
        // bottom:PreferredSize(child: tabbar(), preferredSize: Size.fromHeight(50))
      ),
      body: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: <Widget>[
              hospital == true
                  ? inputField("Doctor (not essential)")
                  : beautyScreen1
                      ? InkWell(


                      onTap: (){
                          setState(() {
                          beautyScreen1 = false;
                          print("$beautyScreen1");
                        });
                      },
                      
                                              child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .4),
                            //  padding: EdgeInsets.symmetric(vertical:5),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff353A50),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Picture Attachment",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                      )
                      : Container(),
              hospital ? inputField("Surgical field") : Container(),
              Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Picture attachment",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
              !beautyScreen1
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Icon(Icons.info, color: Colors.white),
                            ),
                            Text(" Select picture that your favorite one",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ]),
                    ),
              beautyScreen1 ? Container() : essential("Before (not essential)"),
              beautyScreen1 ? Container() : essential("After essential"),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Grade",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              SmoothStarRating(
                  allowHalfRating: false,
                  onRatingChanged: (v) {
                    setState(() {
                      rating = v;
                    });
                  },
                  starCount: 5,
                  rating: rating,
                  size: 40.0,
                  // filledIconData: Icons.blur_off,
                  halfFilledIconData: Icons.blur_on,
                  color: Colors.pink,
                  borderColor: Colors.pink,
                  spacing: 0.0),
              beautyScreen1
                  ? Container()
                  : Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                      Text(" Select picture that your favorite one",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ]),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Write Review",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              reviewCard()
            ],
          )),
    );
  }

  Widget inputField(String text) {
    return Container(
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .4, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 6.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10),
              hintText: "$text",
              hintStyle: TextStyle(color: Color(0xff565656), fontSize: 13)),
        ));
  }

  Widget essential(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          child:
              Text("$text", style: TextStyle(color: Colors.grey, fontSize: 15)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(children: [
            Card(
                elevation: 5,
                child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * .17,
                    width: MediaQuery.of(context).size.width * .17,
                    child: Text(
                      "Preview",
                      style: TextStyle(color: Colors.pink),
                      maxLines: 1,
                    ))),
            addcard(),
            addcard(),
            addcard(),
          ]),
        )
      ],
    );
  }

  Widget addcard() {
    return Card(
        margin: EdgeInsets.only(left: 5),
        elevation: 5,
        child: Container(
            child: Container(
                height: MediaQuery.of(context).size.width * .17,
                width: MediaQuery.of(context).size.width * .17,
                child: Icon(Icons.add, color: Colors.grey))));
  }

  Widget reviewCard() {
    return Card(
      elevation: 5,
      //shape:RoundRectangluarBorder(BorderRadius.circular(radius))
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,

        child: TextFormField(
          onTap: () {},
          maxLines: 15,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10),
          ),
        ),
      ),
    );
  }
}
