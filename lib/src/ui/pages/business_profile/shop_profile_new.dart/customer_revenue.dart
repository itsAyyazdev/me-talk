import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:intl/intl.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/business.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/shop_profile.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/update_shop_profile.dart';

class CustomerRevenue extends StatefulWidget {
  @override
  _CustomerRevenueState createState() => _CustomerRevenueState();
}

class _CustomerRevenueState extends State<CustomerRevenue> {
  var _date = DateFormat("yyyy MM.dd").format(DateTime.now()).toString();
  var text2 = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsHelper.whiteColorBG(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: _bottomButton(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorsHelper.whiteColor(),
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
            title: Container(
              alignment: Alignment.bottomCenter,
              child: Text("Record of this Customer",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic)),
            ),
            centerTitle: true,
            actions: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(right: 20, top: 5),
                child: InkWell(
                  child: Image(
                    height: 25,
                    width: 25,
                    image: AssetImage("assets/images/belln.png"),
                    color: ColorsHelper.themeBlackColor(),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          body:ListView.builder(itemBuilder: (context,index){
            return _revenue();
          })
        ),
      ),
    );
  }

  Widget _revenue() {
    return Container(
      margin: EdgeInsets.only(bottom:5),
      height: MediaQuery.of(context).size.height * .15,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[700],
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 60, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                        height: 30,
                        width: 30,
                        image: AssetImage("assets/images/eyeBrow.png")),
                    Text(
                      "Revenue",
                      style: text2.copyWith(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            width:double.infinity,
            margin: EdgeInsets.only(
              right: 12,
              left: 12,
            ),
            height: MediaQuery.of(context).size.height * .04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff252C3E),
            ),
            child: Text("$_date", style: text2.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Business()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xff353A50),
                child: Center(
                    child: Text("OK",
                        style:
                            text2.copyWith(height: 0.5, color: Colors.white))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              height: 5,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
