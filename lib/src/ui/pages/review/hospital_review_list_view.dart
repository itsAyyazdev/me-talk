import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/review/review_detail_page.dart';
import 'package:me_talk/src/utils/BeforeAfterView/before_after.dart';
import 'package:vibrate/vibrate.dart';

class HospitalReviewListView extends StatefulWidget {
  bool isShowReviewView = false;
  bool isHospitalDetailScreen = false;
  bool isHospital = false;
  int index;
  HospitalReviewListView({
    Key key,
    this.isShowReviewView,
    this.isHospitalDetailScreen,
    this.isHospital,
    this.index,
  }) : super(key: key);

  @override
  _HospitalReviewListViewState createState() => _HospitalReviewListViewState();
}

class _HospitalReviewListViewState extends State<HospitalReviewListView> {
  List<String> imagesReviewBefore = [];
  List<String> imagesSurgeryBefore = [];
  List<String> imagesReviewAfter = [];
  List<String> imagesSurgeryAfter = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("===isHospitalDetailScreen===\n${widget.isHospital}");
    imagesReviewBefore = [
      'assets/images/Reviews/before.png',
      'assets/images/Reviews/before1.png',
      'assets/images/Reviews/before2.png',
      'assets/images/Reviews/before3.png',
      'assets/images/Reviews/before4.png',
    ];

    imagesReviewAfter = [
      'assets/images/Reviews/after.png',
      'assets/images/Reviews/after1.png',
      'assets/images/Reviews/after2.png',
      'assets/images/Reviews/after3.png',
      'assets/images/Reviews/after4.png',
    ];

    imagesSurgeryBefore = [
      'assets/images/Reviews/surgery_before1.png',
      'assets/images/Reviews/surgery_before2.png',
      'assets/images/Reviews/surgery_before3.png',
      'assets/images/Reviews/surgery_before4.png',
      'assets/images/Reviews/surgery_before5.png',
    ];

    imagesSurgeryAfter = [
      'assets/images/Reviews/surgery_after1.png',
      'assets/images/Reviews/surgery_after2.png',
      'assets/images/Reviews/surgery_after3.png',
      'assets/images/Reviews/surgery_after4.png',
      'assets/images/Reviews/surgery_after5.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('On itme click');
        Vibrate.feedback(FeedbackType.light);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReviewDetailPage(
                    isHospital: widget.isHospital,
                  )),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              width: (MediaQuery.of(context).size.width / 2) - 7,
              height: (MediaQuery.of(context).size.width / 2) - 7-8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 4,
                      offset: Offset(0, 1))
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                child: BeforeAfter(
                  thumbRadius: 15,
                  onSlideOpenAfterImage: (value) {
                    setState(() {
                      if (value){
                        onBeforeAfterDetailsClick();
                      }
                    });
                  },
                  imageHeight: (MediaQuery.of(context).size.width / 2) - 5,
                  imageWidth: (MediaQuery.of(context).size.width / 2) - 5 -44,
                  beforeImage: Image.asset(
                    widget.isShowReviewView
                        ? imagesReviewBefore[widget.index]
                        : imagesSurgeryBefore[widget.index],
                    fit: BoxFit.cover,
                  ),
                  afterImage: Image.asset(
                    widget.isShowReviewView
                        ? imagesReviewAfter[widget.index]
                        : imagesSurgeryAfter[widget.index],
                    fit: BoxFit.cover,
                  ),
                ),
                //child:WidgetHelper.beforeAfterView(img1: 'assets/images/Reviews/review-1.png',img2: 'assets/images/Reviews/review-2.png',height:(MediaQuery.of(context).size.width/2)-5,width: (MediaQuery.of(context).size.width/2)-5,isSmallView: true),
              ),
            ),
          ),
          Container(
            //color: Colors.black12,
            width: (MediaQuery.of(context).size.width / 2) - 25,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 15.5,
                        child: Container(
                          width: 31.0,
                          height: 31.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(ImageAssets.bg7)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'USER NAME',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                //fontFamily: FontsHelper.fonts_medium
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      'I hade surgery.I hade surgery.I hade surgery.I hade surgery.I hade surgery.',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        height: 1.3,
                        //fontFamily: FontsHelper.fonts_HyGothic_regular
                      ),
                    ),
                  ),
                  tags(context: context, tags: 'eye,nose,cheekbone,fat,botox'),
//                  widget.isShowReviewView
//                      ? tags(context: context, tags: 'Nail')
//                      : tags(
//                          context: context,
//                          tags: 'eye,nose,cheekbone,fat,botox'),
                  Padding(
                    padding: widget.isShowReviewView
                        ? const EdgeInsets.only(top: 3)
                        : const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          ImageAssets.like_unsel,
                          width: 15,
                          height: 15,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 15,top: 3),
                          child: Text(
                            '31',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              //fontFamily: FontsHelper.fonts_Segoe_regular,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Image.asset(
                            ImageAssets.comment_icon,
                            color: ColorsHelper.grey71TextColor(),
                            width: 15,
                            height: 15,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 8,top: 3),
                          child: Text(
                            '5',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              //fontFamily: FontsHelper.fonts_Segoe_regular,
                            ),
                          ),
                        ),
                        widget.isHospitalDetailScreen
                            ? Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                  'Get info 41',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: ColorsHelper.themeColor(),
                                    fontSize: 11.0,
                                    //fontFamily: FontsHelper.fonts_Segoe_regular
                                  ),
                                ),
                            )
                            : Text(''),
//                        Flexible(
//                          child:Container(
//                            decoration: WidgetHelper.customBoxDecorationWithOutShadow(ColorsHelper.themeBlackColor(), Colors.white, 0, 10),
//                            child: Padding(
//                              padding: const EdgeInsets.only(top: 5,bottom: 3,left:10,right: 10),
//                              child: Text(
//                                'Get info 41',
//                                textAlign: TextAlign.left,
//                                overflow: TextOverflow.ellipsis,
//                                maxLines: 2,
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 12.0,
//                                    fontFamily: FontsHelper.fonts_medium
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onBeforeAfterDetailsClick() {
    Vibrate.feedback(FeedbackType.light);
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ReviewDetailPage(isHospital: !widget.isShowReviewView)));
  }

  tags({BuildContext context, String tags}) {
    List<String> tagList = [];
    if (tags.isNotEmpty) {
      tagList = tags.split(",");
    }
    return Visibility(
        visible: tags.isNotEmpty,
        child: Container(
          //width: MediaQuery.of(context).size.width-100,
          //height: widget.isShowReviewView ? 23 : 40,
          height: 40,
          child: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: tagList
                .map(
                  (tags) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        ImageAssets.star_tag,
//                        width: widget.isShowReviewView ? 18 : 10,
//                        height: widget.isShowReviewView ? 18 : 10,
                        width: 10,
                        height: 10,
                        fit: BoxFit.contain,
                      ),
                      widget.isShowReviewView
                          ? SizedBox(
                              //width: 15,
                              width: 0,
                            )
                          : SizedBox(),
                      Text(
                        tags,
                        maxLines: 5,
                        style: TextStyle(
//                          color: widget.isShowReviewView
//                              ? ColorsHelper.themeColor()
//                              : Colors.black,
//                          fontSize: widget.isShowReviewView ? 15 : 10,
                          color: Colors.black,
                          fontSize: 10,
                          //fontFamily: FontsHelper.fonts_medium
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ));
  }
}
