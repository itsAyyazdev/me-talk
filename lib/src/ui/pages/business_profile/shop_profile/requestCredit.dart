import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:vibrate/vibrate.dart';

class RequestCredit extends StatefulWidget {
  @override
  _RequestCreditState createState() => _RequestCreditState();
}

class _RequestCreditState extends State<RequestCredit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        title: Center(
        child: Text("Purchase"),
    ),
    leading: SizedBox(
    width: 10,
    height: 10,
    child:InkWell(
    child: Icon(Icons.arrow_back_ios),
    onTap: () {
    Navigator.of(context).pop();

    },

    )),

    ),
    body: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
  Container(
    width: MediaQuery.of(context).size.width*.8,
    height: MediaQuery.of(context).size.height*.4,

    decoration: BoxDecoration(
        border: Border.all(width: 1,color: ColorsHelper.dashboardGrid().withOpacity(0.4))
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Payment method",style:TextStyle(fontSize: 17,fontFamily: 'MontserratMedium',)),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width*.6,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: ColorsHelper.dashboardGrid().withOpacity(0.4)),
            ),
            child: Padding(
                padding: EdgeInsets.only(top:5 ),
                child: Text('Select',style: TextStyle(color: ColorsHelper.black60Color()),)),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Payment amount",style: TextStyle(fontSize: 17,fontFamily: 'MontserratMedium'),),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width*.6,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: ColorsHelper.dashboardGrid().withOpacity(0.4)),
            ),
            child: Padding(
                padding: EdgeInsets.only(top:5 ),
                child: TextField(
                  maxLines: 1,

                )),

          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              height: 30,
              decoration: new BoxDecoration(
                  color: ColorsHelper.dashboardGrid(),
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(5.0),
                  )
              ),
              child: Center(child: Text("OK",textAlign: TextAlign.center,style: TextStyle(fontFamily:'MontserratMedium',color: ColorsHelper.whiteColor()),)),

            ) ,
          )


        ],
      ),
    ),
  ),
  SizedBox(height: 100,)
],
    ),
    )
    ,
    );
  }
}
