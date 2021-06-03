import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/event_review_list_view.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:flutter/material.dart';

class HospitalGradeTab extends StatefulWidget {
  @override
  _HospitalGradeTabState createState() => _HospitalGradeTabState();
}

class _HospitalGradeTabState extends State<HospitalGradeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 10),
              child: Text(
                StringHelper.str_event_grade,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    //fontFamily: FontsHelper.fonts_medium
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
                '9.5',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    //fontFamily: FontsHelper.fonts_bold
                ),
              ),
            ),
            WidgetHelper.showStarRatingView(rating: 5,size: 25),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 15),
              child: Text(
                StringHelper.str_level_of_satisfaction,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    //fontFamily: FontsHelper.fonts_medium
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringHelper.str_call,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            //fontFamily: FontsHelper.fonts_medium
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: Text(
                          StringHelper.str_visit,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              //fontFamily: FontsHelper.fonts_medium
                          ),
                        ),
                      ),
                      Text(
                        StringHelper.str_surgery,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            //fontFamily: FontsHelper.fonts_medium
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '9.5',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              //fontFamily: FontsHelper.fonts_medium
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15),
                          child: Text(
                            '9.7',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                //fontFamily: FontsHelper.fonts_medium
                            ),
                          ),
                        ),
                        Text(
                          '9.5',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              //fontFamily: FontsHelper.fonts_medium
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WidgetHelper.showStarRatingView(rating: 5,size: 15),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: WidgetHelper.showStarRatingView(rating: 5,size: 15),
                      ),
                      WidgetHelper.showStarRatingView(rating: 5,size: 15),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 15,bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    StringHelper.str_write_for_people,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        //fontFamily: FontsHelper.fonts_medium
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black87,
              height: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: getReviewListView,
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getReviewListView(BuildContext context, int index) {
    return InkWell(
        onTap: (){

        },
        child: EventReviewView()
    );
  }

}
