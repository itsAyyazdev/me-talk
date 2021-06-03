import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/ui/pages/beauty/event_review_list_view.dart';
import 'package:me_talk/src/ui/pages/review/hospital_review_list_view.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class HospitalReviewTab extends StatefulWidget {
  bool isShopReview = false;

  HospitalReviewTab({Key key, this.isShopReview}) : super(key: key);

  @override
  _HospitalReviewTabState createState() => _HospitalReviewTabState();
}

class _HospitalReviewTabState extends State<HospitalReviewTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: widget.isShopReview
            ? EdgeInsets.only(left: 16, right: 16, top: 15)
            : EdgeInsets.only(left: 16, right: 16, top: 39),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '9.5',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(0.0, 3.0),
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(0.16),
                      )
                    ],

                    color: Colors.black,
                    fontSize: 30,
                    //fontFamily: FontsHelper.fonts_Poppins_Medium
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                WidgetHelper.showStarRatingView(rating: 5, size: 22),
              ],
            ),
            widget.isShopReview
                ? Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 9, top: 4),
                    child: Text(
                      "review  (211)",
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            Padding(
              padding: widget.isShopReview
                  ? const EdgeInsets.only(top: 0)
                  : const EdgeInsets.only(top: 30),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: getReviewList,
                itemCount: 3,
              ),
            ),
            Divider(
              color: ColorsHelper.darkGrayColor(),
              height: 0,
              thickness: 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: getReviewListView,
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getReviewList(BuildContext context, int index) {
    return InkWell(
        onTap: () {},
        child: HospitalReviewListView(
          isShowReviewView: widget.isShopReview,
          isHospitalDetailScreen: !widget.isShopReview,
          isHospital: !widget.isShopReview,
          index: index,
        ));
  }

  Widget getReviewListView(BuildContext context, int index) {
    return InkWell(onTap: () {}, child: EventReviewView());
  }
}
