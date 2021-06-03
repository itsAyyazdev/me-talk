import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:vibrate/vibrate.dart';

class RegularPayment extends StatefulWidget {
  @override
  _RegularPaymentState createState() => _RegularPaymentState();
}

class _RegularPaymentState extends State<RegularPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Regular Payment"),
        ),
        leading: SizedBox(
            width: 10,
            height: 10,
            child: InkWell(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.of(context).pop();
              },
            )),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
          height: 50,
          decoration: new BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 6,)],
              color: ColorsHelper.dashboardGrid(),
              borderRadius: new BorderRadius.all(
                const Radius.circular(15.0),
              )),
          child: Center(
              child: Text(
            "Select Item",
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorsHelper.whiteColor()),
          )),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              _page(),
              SizedBox(height: 10),
              _pageName(),
              SizedBox(
                height: 20,
              ),
              _Table(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Table() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
            )
          ],
          color: ColorsHelper.whiteColor(),
          borderRadius: new BorderRadius.all(
            const Radius.circular(40.0),
          )),
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 30, bottom: 20),
        child: Column(
          children: <Widget>[
            _tableData1(),
            _tableData2(),
            _tableData3(),
            _tableData4(),
            _tableData5()
          ],
        ),
      ),
    );
  }

  Widget _tableData5() {
    return Row(
      children: <Widget>[
        _tableField("Platinum", 0, 1),
        _tableField("4,5km", 0, 1),
        _tableField("500won", 0, 1),
        _tableField("210,000", 0, 0),
      ],
    );
  }

  Widget _tableData4() {
    return Row(
      children: <Widget>[
        _tableField("Gold", 1, 1),
        _tableField("3,5km", 1, 1),
        _tableField("1000won", 1, 1),
        _tableField("110,000", 1, 0),
      ],
    );
  }

  Widget _tableData3() {
    return Row(
      children: <Widget>[
        _tableField("Silver", 1, 1),
        _tableField("2,5km", 1, 1),
        _tableField("1500won", 1, 1),
        _tableField("60,000", 1, 0),
      ],
    );
  }

  Widget _tableData2() {
    return Row(
      children: <Widget>[
        _tableField("Bronze", 1, 1),
        _tableField("1,5km", 1, 1),
        _tableField("2500won", 1, 1),
        _tableField("10,000", 1, 0),
      ],
    );
  }

  Widget _tableData1() {
    return Row(
      children: <Widget>[
        _tableField(" ", 1, 1),
        _tableField("Radius", 1, 1),
        _tableField("CPA", 1, 1),
        _tableField("monthly", 1, 0),
      ],
    );
  }

  Widget _tableField(String data, int bottomcheck, int rightcheck) {
    return Container(
      width: 70,
      height: 35,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
              width: 2.0,
              color: rightcheck == 1
                  ? ColorsHelper.dashboardGrid()
                  : Colors.white),
          bottom: BorderSide(
              width: 2.0,
              color: bottomcheck == 1
                  ? ColorsHelper.dashboardGrid()
                  : ColorsHelper.whiteColor()),
        ),
      ),
      child: Center(
          child: Text(
        '$data',
      )),
    );
  }

  Widget _pageName() {
    return Container(
      margin: EdgeInsets.only(left: 25,right: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 2, child: _name("Bronze")),
          Expanded(child: _line(4)),
          Expanded(flex: 2, child: _name("Silver")),
          Expanded(child: _line(5)),
          Expanded(flex: 2, child: _name("Gold")),
          Expanded(child: _line(5)),
          Expanded(flex: 3, child: _name("Platinum")),
        ],
      ),
    );
  }

  Widget _name(String text) {
    return Container(
      child: Text("$text"),
    );
  }

  Widget _page() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _rContaienr(1),
          _line(1),
          _rContaienr(2),
          _line(2),
          _rContaienr(3),
          _line(3),
          _rContaienr(4)
        ],
      ),
    );
  }

  Widget _line(int id) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        color: id == 1 || id == 2 ? Colors.black : Colors.transparent,
        height: 2,
        width: id == 1 || id == 2 || id == 3
            ? MediaQuery.of(context).size.width * .1
            : MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5),
      ),
    ]);
  }

  Widget _rContaienr(int id) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(id == 4
                ? "assets/images/rcont2.png"
                : "assets/images/rcont.png")),
      ),
      child: Center(
        child: Text(
          "$id",
          style: TextStyle(
              fontSize: 14, color: id == 4 ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
