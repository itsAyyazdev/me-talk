import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:vibrate/vibrate.dart';

class PurchaseCredit extends StatefulWidget {
  PurchaseCredit({Key key}) : super(key: key);
  static const String routeName = "PurchaseCredit";
  @override
  _PurchaseCreditState createState() => _PurchaseCreditState();
}

class _PurchaseCreditState extends State<PurchaseCredit> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  @override
  void dispose() {
    businessProfileBloc.close();
    super.dispose();
  }

  TextEditingController paymentAmount = TextEditingController();
  String payMethod = StringHelper.select;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
            color: ColorsHelper.whiteColor(),
            child: SafeArea(
              left: false,
              right: false,
              top: false,
              bottom: true,
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 6,
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
                    title: Text(
                      StringHelper.Purchase,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                  ),
                  body: BlocProvider(
                    create: (BuildContext context) => businessProfileBloc,
                    child: BlocBuilder(
                      bloc: businessProfileBloc,
                      builder:
                          (BuildContext context, BusinessProfileState state) {
                        if (state is InitialBusinessProfileState) {
                          return purchaseCredit();
                        } else {
                          return Container(
                            color: Colors.black,
                          );
                        }
                      },
                    ),
                  )),
            )));
  }

  Widget purchaseCredit() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 70),
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                  border:
                      Border.all(color: ColorsHelper.grayColor(), width: 0.7),
                  //   boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey, blurRadius: 0.4, spreadRadius:0.1, ),
                  // ],
                  color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(StringHelper.PaymentMethod,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
//Dropdown for dropdown method
//
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.55,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: DropdownButton<String>(
                        value: payMethod,
                        isExpanded: true,
                        onChanged: (str) {
                          setState(() {
                            payMethod = str;
                          });
                        },
                        items: new List.generate(3, (int index) {
                          return new DropdownMenuItem<String>(
                              value: index == 0
                                  ? StringHelper.select
                                  : StringHelper.paymentMethods
                                      .elementAt(index),
                              child: new Container(
                                child: new Text(
                                  index == 0
                                      ? StringHelper.select
                                      : StringHelper.paymentMethods
                                          .elementAt(index),
                                  textAlign: TextAlign.center,
                                ),
                                width: 200.0, //200.0 to 100.0
                                // ),
                              ));
                        }),
                        iconSize: 0,
                        underline: SizedBox(
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(StringHelper.PaymentAmount,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    //text field payment amount
//
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: TextField(
                        controller: paymentAmount,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.4)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.6)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      StringHelper.atleast_200000,
                      style: TextStyle(fontSize: 11,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //
                    //ok button
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: RaisedButton(
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                          if (payMethod.contains(StringHelper.select))
                            PopupDialogs.displayMessageOnly(context,
                                StringHelper.payment_method_not_selected);
                          else if (paymentAmount.text.isEmpty)
                            PopupDialogs.displayMessageOnly(
                                context, StringHelper.empty_payment_amount);
                          else
                            print("call Api HEre !!!!");
                        },
                        color: ColorsHelper.themeBlackColor(),
                        splashColor: Colors.white38,
                        child: Text(
                          StringHelper.OK,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
