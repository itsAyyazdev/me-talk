import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/business_profile/revenue_management.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile/business.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/customer_revenue.dart';
import 'package:me_talk/src/ui/pages/review/chat.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

class GenerateNotifications extends StatefulWidget {
  @override
  _GenerateNotificationsState createState() => _GenerateNotificationsState();
}

class _GenerateNotificationsState extends State<GenerateNotifications>
    with SingleTickerProviderStateMixin {
  TabController controller;
  TextEditingController txtController;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            elevation: 1,
            bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      'Counseling',
                      style: TextStyle(
                          fontFamily: 'MontserratMedium', fontSize: 13),
                    )),
                Column(children: [
                  controller.index == 1
                      ? Container()
                      : Container(
                          height: 5,
                          width: 5,
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Color(0xffEA4C89), shape: BoxShape.circle),
                        ),
                  Text('Biz chat',
                      style: TextStyle(
                          fontFamily: 'MontserratMedium', fontSize: 13)),
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(children: [
                    controller.index == 2
                        ? Container()
                        : Container(
                            height: 5,
                            width: 5,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Color(0xffEA4C89),
                                shape: BoxShape.circle),
                          ),
                    Text('History',
                        style: TextStyle(
                            fontFamily: 'MontserratMedium', fontSize: 13)),
                  ]),
                )
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0),
              ),
              controller: controller,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            backgroundColor: ColorsHelper.whiteColor(),
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
            title: Center(
              child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .15),
                  child: Text(
                    'ALARM',
                    style: TextStyle(fontFamily: 'MontserratMedium'),
                  )),
            ),
          ),
          preferredSize: Size.fromHeight(80),
        ),
        body: TabBarView(
          children: [
            _counsel(),
            _bizChat(),
            _history(),
          ],
          controller: controller,
        ));
  }

  Widget _counsel() {
    return ListView(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            height: 31,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.07),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset(
                        ImageAssets.search_box_icon,
                        width: 17,
                        height: 17,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 170,
                      //color: Colors.black12,
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        //textAlign: TextAlign.center,
                        controller: txtController,
                        cursorColor: Color(0xff403F3F),
                        //textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 16),

                          ///suffix: IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
                          //suffixIcon: Icon(Icons.clear),
                        ),
                        style: TextStyle(
                          color: Color(0xff403F3F),
                          fontSize: 10.0,
                        ),
                        onSubmitted: (String searchWord) {
                          if (searchWord.length > 0) {
//                        if(widget.typeId==3){
//                          searchApiCall(searchWord);
//                        }
                          }
                        },
                      ),
                    ),
                    Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 20.0,
                    ),
                  ],
                ),
//            Padding(
//              padding: const EdgeInsets.only(left: 10,right: 10),
//              child: InkWell(
//                onTap: (){
////                  controller.clear();
////                  searchList.clear();
////                  setState(() {});
//                },
//                child: Image.asset(
//                  ImageAssets.search_close,
//                  width: 15,
//                  height: 15,
//                  fit: BoxFit.contain,
//                ),
//              ),
//            ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height - 200,
          child: _counselList(),
        ),
        Divider(
          color: Colors.black54,
        )
      ],
    );
  }

  Widget _bizChat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                  width: 90,
                  height: 30,
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: ColorsHelper.dashboardGrid(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Business()),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 2,
                        ),
                        Text("Business",
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 13,
                                fontFamily: 'MontserratMedium')),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Image.asset(
                                'assets/images/businessPlace.png',
                                scale: 4))
                      ],
                    ),
                  )),
            ),
            Container(
              height: 31,
              width: MediaQuery.of(context).size.width - 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image.asset(
                          ImageAssets.search_box_icon,
                          width: 17,
                          height: 17,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 220,
                        //color: Colors.black12,
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          //textAlign: TextAlign.center,
                          controller: txtController,
                          cursorColor: Color(0xff403F3F),
                          //textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 16),

                            ///suffix: IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
                            //suffixIcon: Icon(Icons.clear),
                          ),
                          style: TextStyle(
                            color: Color(0xff403F3F),
                            fontSize: 10.0,
                          ),
                          onSubmitted: (String searchWord) {
                            if (searchWord.length > 0) {
//                        if(widget.typeId==3){
//                          searchApiCall(searchWord);
//                        }
                            }
                          },
                        ),
                      ),
                      Icon(
                        Icons.clear,
                        color: Colors.black54,
                        size: 20.0,
                      ),
                    ],
                  ),
//            Padding(
//              padding: const EdgeInsets.only(left: 10,right: 10),
//              child: InkWell(
//                onTap: (){
////                  controller.clear();
////                  searchList.clear();
////                  setState(() {});
//                },
//                child: Image.asset(
//                  ImageAssets.search_close,
//                  width: 15,
//                  height: 15,
//                  fit: BoxFit.contain,
//                ),
//              ),
//            ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Container(
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height - 270,
          child: _bizChatList(),
        ),
        Divider(
          color: Colors.black54,
        )
      ],
    );
  }

  Widget _history() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height - 500,
          child: _hospitalList(),
        ),
        Divider(
          color: Colors.black54,
        )
      ],
    );
  }

  Widget _counselCard(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chat(
                      nofificationtype: "Counseling",
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .10,
              height: MediaQuery.of(context).size.height * .045,
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.imog4),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text("Hospital name",
                      style: TextStyle(
                          color: ColorsHelper.dashboardGrid(),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
                Container(
                  child: Text("Hi",
                      style: TextStyle(
                          color: ColorsHelper.dashboardGrid(),
                          fontSize: 12,
                          fontFamily: 'Montserrat')),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
            ),
            Text('45 min')
          ],
        ),
      ),
    );
  }

  Widget _counselList() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      // height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        scrollDirection: Axis.vertical,
        //  padding: EdgeInsets.only(bottom: 34),
        itemBuilder: (BuildContext context, int index) {
          return _counselCard(index);
        },
      ),
    );
  }

  Widget _bizChatCard(int index) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Chat(
                        nofificationtype: "Biz",
                      )));
        },
        child: Row(
          children: <Widget>[
            Container(
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .10,
                      height: MediaQuery.of(context).size.height * .045,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(ImageAssets.imog4),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text("username",
                              style: TextStyle(
                                  color: ColorsHelper.dashboardGrid(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                        Container(
                          child: Text("Hi",
                              style: TextStyle(
                                  color: ColorsHelper.dashboardGrid(),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat')),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Image.asset(
                      ImageAssets.cat01_1,
                      scale: 6,
                    ),
                    Text('45 min'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .12,
                    ),
                  ],
                ),
                secondaryActions: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    color: ColorsHelper.purpleColor(),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerRevenue()));
                      },
                      child: Image.asset(
                        ImageAssets.history,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .06,
            ),
            Container(
              height: 60,
              width: 30,
              color: ColorsHelper.blackBgColor(),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }

  Widget _bizChatList() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      // height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(bottom: 34),
        itemBuilder: (BuildContext context, int index) {
          return _bizChatCard(index);
        },
      ),
    );
  }

  Widget _hospitalCard(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .10,
              height: MediaQuery.of(context).size.height * .045,
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.imog4),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text("Hospital name",
                      style: TextStyle(
                          color: ColorsHelper.dashboardGrid(),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
                Container(
                  child: Text("Booking request completed",
                      style: TextStyle(
                          color: ColorsHelper.dashboardGrid(),
                          fontSize: 12,
                          fontFamily: 'Montserrat')),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
            ),
            Text('45 min')
          ],
        ),
      ),
    );
  }

  Widget _hospitalList() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      // height: MediaQuery.of(context).size.height * .8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(bottom: 34),
        itemBuilder: (BuildContext context, int index) {
          return _hospitalCard(index);
        },
      ),
    );
  }
}
