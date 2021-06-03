import 'package:flutter/material.dart';

import 'chat.dart';

class RequestConsultation extends StatefulWidget {
  RequestConsultation({

    this.beautyshop,
    this.review
  }){
     review == null ? review = false : review = review;

    beautyshop == null ? beautyshop = false : beautyshop = beautyshop;
  }
  bool review;
  bool beautyshop;
  @override
  _RequestConsultationState createState() => _RequestConsultationState(beautyshop: beautyshop,review: review);
}

class _RequestConsultationState extends State<RequestConsultation> {
   _RequestConsultationState({

    this.beautyshop,
    this.review
  }){
     review == null ? review = false : review = review;

    beautyshop == null ? beautyshop = false : beautyshop = beautyshop;
  }
  bool review;
  bool beautyshop;
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
        title: Text("REQUEST CONSULTATION",
            style: TextStyle(
                color: Color(0xff2E2E2E),
                fontSize: 16,
                fontWeight: FontWeight.w500)),

        centerTitle: true,

        //  bottom:PreferredSize(child: tabbar(), preferredSize: Size.fromHeight(50))
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          print("Bottom pressed");
          print("review"+'$review');
          print('beauty $beautyshop');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat(beautyshop: beautyshop,review: review,)));
        },
              child: Container(
          height:70,

          color:Color(0xff353A50),
          width:MediaQuery.of(context).size.width
          ,alignment: Alignment.center,
          child: Text("REQUEST",style:TextStyle(color:Colors.white,fontSize: 15)),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: ListView(children: [
          Container(
            child: Text(
              "PHONE",
              style: TextStyle(
                  color: Color(0xff2E2E2E),
                  shadows: [
                    Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 5.0),
                  ],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 5.0),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "+82",
                            style: TextStyle(
                                color: Color(0xff2E2E2E), fontSize: 13),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.grey)
                        ],
                      )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 40,
                      // width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 5.0),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 10),
                            hintText: "RE VERIFY",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Color(0xff2E2E2E), fontSize: 13)),
                      ),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Discount reqirement (Review)",
              style: TextStyle(
                  color: Color(0xff2E2E2E),
                  shadows: [
                    Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 5.0),
                  ],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              child: Row(
            children: <Widget>[
              button("Agree"),
              SizedBox(width: 20),
              button("NO")
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Discount reqirement (Review)",
              style: TextStyle(
                  color: Color(0xff2E2E2E),
                  shadows: [
                    Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 5.0),
                  ],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 5.0),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "No use",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff2E2E2E), fontSize: 13),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget button(text) {
    return GestureDetector(
      onTap: () {
        print("Button pressed");
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: 100,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Color(0xff2E2E2E), width: 2)),
        child: Text(
          "$text",
          style: TextStyle(color: Color(0xff2E2E2E), fontSize: 13),
        ),
      ),
    );
  }

}
