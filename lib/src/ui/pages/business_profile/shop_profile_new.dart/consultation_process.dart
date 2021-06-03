import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_catgory_list_view.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/customer_revenue.dart';
import 'package:me_talk/src/ui/pages/business_profile/shop_profile_new.dart/select_date_user.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:vibrate/vibrate.dart';

class ConsultationProcess extends StatefulWidget {
  @override
  _ConsultationProcessState createState() => _ConsultationProcessState();
}

class _ConsultationProcessState extends State<ConsultationProcess> {
  bool cancel = false;
  var text1 = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic);
  var text2 = TextStyle(
      color: Colors.white, fontSize: 12, fontFamily: FontsHelper.fonts_bold);
  var optionRequest = false;
  var optionConsultation = true;
  var optionVisit = true;
  var optionComplete = false;
  var edge = EdgeInsets;
// my variables
  bool deleteCustomer = false;
  bool editclientmemo = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsHelper.whiteColorBG(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: _button(),
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
                Vibrate.feedback(FeedbackType.light);
                Navigator.of(context).pop();
              },
            ),
            title: Container(
              alignment: Alignment.bottomCenter,
              child: Text("Consultation Process",
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
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _userNameInfo(),
                _divider(),
                _requestOptions(),
                _divider(),
                // _editClient(),
                editclientmemo ? _recordmemo() : editClientDetail()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userNameInfo() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: CircleAvatar(
                radius: 30,
                child: Image.asset("assets/images/user.png"),
              )),
          Expanded(
              flex: 3,
              child: Text("USER NAME INFO",
                  style: TextStyle(
                      fontSize: 14,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ],
                      fontFamily: FontsHelper.fonts_bold))),
          Expanded(
              child: Image(
                image: AssetImage("assets/images/userinfo.png"),
              )),
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  print("working");
                },
                child: Container(
                  child: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(ImageAssets.arrow_right),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _requestOptions() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _listTile("Request Talking", 1),
          _listTile("Consultation", 2),
          _listTile("Visit", 3),
          _listTile("Complete", 4),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 1,
      width: double.infinity,
      color: Color(0xffDEDEDE),
    );
  }

  Widget _listTile(
      String text,
      int id,
      ) {
    return ListTile(
      dense: true,
      leading: InkWell(
          onTap: () {
            setState(() {
              id == 1
                  ? optionRequest == false
                  ? optionRequest = true
                  : optionRequest = false
                  : id == 2
                  ? optionConsultation == false
                  ? optionConsultation = true
                  : optionConsultation = false
                  : id == 3
                  ? optionComplete == false
                  ? optionComplete = true
                  : optionComplete = false
                  : optionVisit == false
                  ? optionVisit = true
                  : optionVisit = false;
            });
          },
          child: Image.asset(
            id == 1
                ? optionRequest == true
                ? ImageAssets.black_check
                : ImageAssets.black_uncheck
                : id == 2
                ? optionConsultation == true
                ? ImageAssets.black_check
                : ImageAssets.black_uncheck
                : id == 3
                ? optionComplete == true
                ? ImageAssets.black_check
                : ImageAssets.black_uncheck
                : optionVisit == true
                ? ImageAssets.black_check
                : ImageAssets.black_uncheck,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          )),
      title: Text("$text",
          style: TextStyle(
              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic, fontSize: 14)),
      trailing: id == 4 && editclientmemo
          ? _cancelButton()
          : id == 4
          ? _okButton()
          : id == 3 && cancel == false
          ?
      //_cancelButton()
      _backButton()
          : null,
    );
  }

  Widget _editClient() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("USER NAME INFO",
              style: TextStyle(
                  fontSize: 12,
                  shadows: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
                  ],
                  fontFamily: FontsHelper.fonts_bold)),
          Container(
            width: MediaQuery.of(context).size.width * .3,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xff353A50),
            ),
            child: Center(
              child: Text("Edit Client Name", style: text2),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text("Revenue",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily:
                                FontsHelper.fonts_Nanum_Barun_Gothic)),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 2,
                              offset: Offset(0.1, 0.7))
                        ]),
                        margin: EdgeInsets.only(right: 60, bottom: 10),
                        child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            )),
                      ))
                ],
              )),
          _record(),
        ],
      ),
    );
  }

  Widget _record() {
    return Container(
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
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            width: MediaQuery.of(context).size.width * .92,
            margin: EdgeInsets.only(
              right: 12,
              left: 12,
            ),
            height: MediaQuery.of(context).size.height * .04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff252C3E),
                boxShadow: []),
            child: Text("Record for this complete",
                style: text2.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8.0),
      child: ButtonColor(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (contex) => CustomerRevenue()));
        },
        color: ColorsHelper.themeBlackColor(),
        width: MediaQuery.of(context).size.width,
        child: Text("GO this  user chat room",
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
      ),
    );
  }

  Widget _cancelButton() {
    return InkWell(
        onTap: () {
          setState(() {
            cancel = true;

            //below is created by me

            editclientmemo = false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          height: 30,
          width: MediaQuery.of(context).size.width * .22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 1, offset: Offset(0.2, 1))
              ]),
          child: Center(
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                  fontSize: 14),
            ),
          ),
        ));
  }

  Widget _okButton() {
    return InkWell(
        onTap: () {
          setState(() {
            cancel = false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: MediaQuery.of(context).size.width * .15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 1, offset: Offset(0.2, 1))
              ]),
          child: Center(
            child: Text(
              "OK",
              style: TextStyle(
                  fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                  fontSize: 14),
            ),
          ),
        ));
  }

  Widget _backButton() {
    return InkWell(
        onTap: () {
          setState(() {
            cancel = true;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: MediaQuery.of(context).size.width * .15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 1, offset: Offset(0.2, 1))
              ]),
          child: Center(
            child: Text(
              "Back",
              style: TextStyle(
                  fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                  fontSize: 14),
            ),
          ),
        ));
  }

  Widget editClientDetail() {
    return Container(
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(children: [
          deleteCustomer
              ? button("Delete customer")
              : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [button("Delete customer"), button("No show  ")]),
          changeBookingDate(),
        ]));
  }

  Widget button(text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          !editclientmemo ? editclientmemo = true : null;
          text == "Delete customer" ? deleteCustomer = true : null;
        });
        print("Button pressed");
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * .4,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: text == "No show  " ? Color(0xff2E2E2E) : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(0, 10),
                  blurRadius: 5.0,
                  spreadRadius: 1.0)
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("$text",
              style: TextStyle(
                  color: text == "No show  " ? Colors.white : Color(0xff2E2E2E),
                  fontSize: 13)),
          text == "No show  "
              ? Icon(FontAwesomeIcons.sadTear, color: Colors.white, size: 14)
              : Container()
        ]),
      ),
    );
  }

  Widget changeBookingDate() {
    return Card(
      margin: EdgeInsets.only(top: 30),
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Text("Change booking date",
              style: TextStyle(color: Color(0xff2E2E2E), fontSize: 13)),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  datehelpe("2020"),
                  SizedBox(width: 10),
                  datehelpe("JUN"),
                ],
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  datehelpe("17"),
                  SizedBox(width: 10),
                  datehelpe("13:00"),
                ],
              )),
          deleteCustomer
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectUser()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                width: MediaQuery.of(context).size.width * .35,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff2E2E2E)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          offset: Offset(0, 7),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
                child: Text("Schedule",
                    style: TextStyle(
                        color: Color(0xff2E2E2E), fontSize: 13)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20, left: 10),
              width: MediaQuery.of(context).size.width * .35,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff2E2E2E),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: Offset(0, 7),
                        blurRadius: 5.0,
                        spreadRadius: 1.0)
                  ]),
              child: Text("OK",
                  style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ])
              : Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: MediaQuery.of(context).size.width * .4,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff2E2E2E),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(0, 7),
                      blurRadius: 5.0,
                      spreadRadius: 1.0)
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("OK",
                      style:
                      TextStyle(color: Colors.white, fontSize: 13)),
                ]),
          ),
        ]),
      ),
    );
  }

  Widget datehelpe(text) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(.5), width: 2)),
      child: Text(
        "$text",
        style: TextStyle(color: Color(0xff2E2E2E), fontSize: 13),
      ),
    );
  }

  Widget _recordmemo() {
    return Container(
      //height: MediaQuery.of(context).size.height * .15,

      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            width: MediaQuery.of(context).size.width * .93,
            margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Column(children: [
              Text("Revenue from this customer",
                  style: text2.copyWith(color: Color(0xff252C3E))),
              Container(
                width: 250,
                height: 1,
                color: Colors.grey.withOpacity(.5),
                margin: EdgeInsets.only(top: 20, bottom: 20),
              ),
              Text("Memo about this customer",
                  style: text2.copyWith(color: Color(0xff252C3E))),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, top: 10))),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    // _displayDialog(context);

                    showDialog(context: context, builder: (BuildContext context) => errorDialog(context) );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width * .45,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2E2E2E),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              offset: Offset(0, 10),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Text("start record memo",
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            width: MediaQuery.of(context).size.width * .92,
            margin: EdgeInsets.only(
              right: 12,
              left: 12,
            ),
            height: MediaQuery.of(context).size.height * .04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff252C3E),
                boxShadow: []),
            child: Text("Record for this complete",
                style: text2.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }




  Widget errorDialog(context){
    return Dialog(
        backgroundColor: Colors.transparent,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),

        ), //this right here
        child:
        Container(
          height:400,
          // width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(0),
          color: Colors.transparent,
          child:
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                width: MediaQuery.of(context).size.width * .93,
                margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text("USER NAME INFO",
                            style: TextStyle(color:  Color(0xff2E2E2E),fontSize: 13)),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            // _displayDialog(context);

//showDialog(context: context, builder: (BuildContext context) => errorDialog(context) );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * .4,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2E2E2E),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      offset: Offset(0, 10),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0)
                                ]),
                            child: Text("Edit Client name",
                                style: TextStyle(color: Colors.white, fontSize: 13)),
                          ),
                        ),
                      ),

                      Text("Revenue from this customer",
                          style: text2.copyWith(color: Color(0xff252C3E))),
                      Container(
                        width: 250,
                        height: 1,
                        color: Colors.grey.withOpacity(.5),
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      Text("Memo about this customer",
                          style: text2.copyWith(color: Color(0xff252C3E))),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.withOpacity(.5))),
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 15, top: 10))),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            // _displayDialog(context);

//showDialog(context: context, builder: (BuildContext context) => errorDialog(context) );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * .4,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2E2E2E),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      offset: Offset(0, 10),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0)
                                ]),
                            child: Text("Complete",
                                style: TextStyle(color: Colors.white, fontSize: 13)),
                          ),
                        ),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                width: MediaQuery.of(context).size.width * .92,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                ),
                height: MediaQuery.of(context).size.height * .04,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff252C3E),
                    boxShadow: []),
                child: Text("Record for this complete",
                    style: text2.copyWith(color: Colors.white)),
              ),

            ],
          ),
        )
    );

  }







//  _displayDialog(context) {
//   showDialog<Widget>(
//       barrierDismissible: true,
//       context: context,
//       builder: (context) {
//         return  Container(
//     //height: MediaQuery.of(context).size.height * .15,

//     child: Stack(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.only(top: 30, left: 20, right: 20),
//           width: MediaQuery.of(context).size.width * .93,
//           margin: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 2,
//                   offset: Offset(0, 1),
//                 )
//               ]),
//           child: Column(children: [
//             Text("Revenue from this customer",
//                 style: text2.copyWith(color: Color(0xff252C3E))),
//             Container(
//               width: 250,
//               height: 1,
//               color: Colors.grey.withOpacity(.5),
//               margin: EdgeInsets.only(top: 20, bottom: 20),
//             ),
//             Text("Memo about this customer",
//                 style: text2.copyWith(color: Color(0xff252C3E))),
//             SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 90,
//               margin: EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Colors.grey.withOpacity(.5))),
//               child: TextFormField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.only(left: 15, top: 10))),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: (){
//                   _displayDialog();
//                 },
//                                 child: Container(
//                   margin: EdgeInsets.only(bottom: 20),
//                   width: MediaQuery.of(context).size.width * .45,
//                   height: 30,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xff2E2E2E),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey.withOpacity(.5),
//                             offset: Offset(0, 10),
//                             blurRadius: 5.0,
//                             spreadRadius: 1.0)
//                       ]),
//                   child: Text("start record memo",
//                       style: TextStyle(color: Colors.white, fontSize: 13)),
//                 ),
//               ),
//             ),
//           ]),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
//           width: MediaQuery.of(context).size.width * .92,
//           margin: EdgeInsets.only(
//             right: 12,
//             left: 12,
//           ),
//           height: MediaQuery.of(context).size.height * .04,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Color(0xff252C3E),
//               boxShadow: []),
//           child: Text("Record for this complete",
//               style: text2.copyWith(color: Colors.white)),
//         ),
//       ],
//     ),
//   );
//         // ShopCategoryListAlertView(
//         //   categoryTypeId: "2",
//         // );
//       });
// }

}

