import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:intl/intl.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/consultation_process.dart';

class SelectUser extends StatefulWidget {
  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  var text1 = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic);

  var _date = DateFormat("yyyy MM.dd").format(DateTime.now()).toString();
  var _time = DateFormat("hh:mm").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsHelper.whiteColorBG(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: _bottom(),
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
            actions: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(right: 20, top: 20),
                child: InkWell(
                  child: Image(
                    height: 25,
                    width: 25,
                    image: AssetImage("assets/images/plusborder.png"),
                    color: ColorsHelper.themeBlackColor(),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[_calender(), _userList()],
          ),
        ),
      ),
    );
  }

  Widget _userList() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(itemBuilder: (context, index) {
        return _user();
      }),
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Color(0xffDEDEDE),
    );
  }

  Widget _user() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConsultationProcess()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: CircleAvatar(
                    child: Image(
                      image: AssetImage("assets/images/userPic.png"),
                    ),
                  )),
                  Expanded(
                      child: Text("User Name",
                          style: TextStyle(
                              fontSize: 14,
                              height: 0,
                              shadows: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 1))
                              ],
                              fontFamily: FontsHelper.fonts_bold))),
                  Expanded(
                      child: Text("$_date",
                          textAlign: TextAlign.center, style: text1)),
                  Expanded(
                      child: Text(
                    "$_time",
                    textAlign: TextAlign.center,
                    style: text1,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _calender() {
    return Center(
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: MediaQuery.of(context).size.height * .45,
          width: MediaQuery.of(context).size.width * .9,
          child: CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              this.setState(() => _currentDate2 = date);
              print("$date");
            },
            weekdayTextStyle: TextStyle(color: Colors.black),
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            todayButtonColor: Color(0xff009688),
            thisMonthDayBorderColor: Colors.grey,
            selectedDateTime: _currentDate2,
            selectedDayButtonColor: Color(0xff009688),
            weekFormat: false,
            height: 420.0,
          ),
        ),
      ),
    );
  }

  Widget _bottom() {
    return Container(
      height: 5,
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .25,
          left: MediaQuery.of(context).size.width * .25,
          bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
