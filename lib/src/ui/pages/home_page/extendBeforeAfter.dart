import 'package:flutter/material.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/review/hospital_review_list_view.dart';
import 'package:vibrate/vibrate.dart';

class ExtendBeforeAfter extends StatefulWidget {
  @override
  _ExtendBeforeAfterState createState() => _ExtendBeforeAfterState();
}

class _ExtendBeforeAfterState extends State<ExtendBeforeAfter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
            width: 10,
            height: 10,
            child:InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Vibrate.feedback(FeedbackType.light);
            Navigator.of(context).pop();

          },

        )),
        actions: <Widget>[
          InkWell(
            child: Image.asset(
              ImageAssets.search,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
            },
          ),
          SizedBox(
            width: 15,
          ),
          InkWell(
            child: Image.asset(
              ImageAssets.notification,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
            },
          ),
          SizedBox(
            width: 15,
          ),
          //profile
          InkWell(
            child: Image.asset(
              ImageAssets.user_nav,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
              },
          ),
          SizedBox(
            width: 10,
          ),

        ],
      ),

body: Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
  child: _review(),
),
    );
  }
  Widget _review(){
    return    Padding(

      padding:  const EdgeInsets.only(
          left: 16, right: 16, top:  5),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: getReviewList,
        itemCount: 5,
      ),
    );


  }
  Widget getReviewList(BuildContext context, int index) {
    return Padding(
      padding:EdgeInsets.only(top: 0),
      child: InkWell(
          onTap: () {},
          child: HospitalReviewListView(
            isShowReviewView: false,
            isHospitalDetailScreen: false,
            isHospital: true,
            index: index,
          )),
    );
  }

}
