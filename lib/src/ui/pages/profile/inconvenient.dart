import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';

class Inconvvenient extends StatefulWidget {
  @override
  _InconvvenientState createState() => _InconvvenientState();
}

class _InconvvenientState extends State<Inconvvenient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(
              color: ColorsHelper.dashboardGrid(),
              borderRadius: BorderRadius.circular(1),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Send",
                style: TextStyle(
                  color: ColorsHelper.whiteColor(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: ColorsHelper.whiteColor(),
        title: Center(
          child: Text("your inconvenient",style: TextStyle(fontSize: 14),),
        ),
        leading: IconButton(
          icon: Image.asset(
            ImageAssets.back_arrow,
            width: 20.0,
            height: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Please tell me your inconvenient\nwe will check about the problem",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'MontserratMedium',
                  color: ColorsHelper.black60Color()),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: new BoxDecoration(
                  color: ColorsHelper.whiteColor(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54.withOpacity(.1),
                      blurRadius:
                          20.0, // has the effect of softening the shadow
                      spreadRadius:
                          5.0, // has the effect of extending the shadow
                      offset: Offset(
                        10.0, // horizontal, move right 10
                        10.0, // vertical, move down 10
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
