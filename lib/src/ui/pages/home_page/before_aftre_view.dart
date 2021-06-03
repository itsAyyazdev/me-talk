import 'package:flutter/material.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/review/review_detail_page.dart';
import 'package:me_talk/src/utils/BeforeAfterView/before_after.dart';
import 'package:vibrate/vibrate.dart';

class BeforeAfterView extends StatefulWidget {
  bool isHome = false;
  bool isBeauty = false;
  BeforeAfterView({Key key, this.isHome, this.isBeauty}) : super(key: key);

  @override
  _BeforeAfterViewState createState() => _BeforeAfterViewState();
}

class _BeforeAfterViewState extends State<BeforeAfterView> {
  List<String> images = [];
  List<String> imagesSurgery = [];
  int currentBeforeIndex;

  @override
  void initState() {
    super.initState();

    print("===== Is Home =====\n${widget.isBeauty}");

    images = [
      'assets/images/Reviews/before.png',
      'assets/images/Reviews/before1.png',
      'assets/images/Reviews/before2.png',
      'assets/images/Reviews/before3.png',
      'assets/images/Reviews/before4.png',
      'assets/images/Reviews/after4.png',
      'assets/images/Reviews/after3.png',
      'assets/images/Reviews/after2.png',
      'assets/images/Reviews/after1.png',
      'assets/images/Reviews/after.png',
    ];

    imagesSurgery = [
      'assets/images/Reviews/surgery_before1.png',
      'assets/images/Reviews/surgery_before2.png',
      'assets/images/Reviews/surgery_before3.png',
      'assets/images/Reviews/surgery_before4.png',
      'assets/images/Reviews/surgery_before5.png',
      'assets/images/Reviews/surgery_after5.png',
      'assets/images/Reviews/surgery_after4.png',
      'assets/images/Reviews/surgery_after3.png',
      'assets/images/Reviews/surgery_after2.png',
      'assets/images/Reviews/surgery_after1.png',
    ];

    currentBeforeIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double margin = widget.isHome ? 114 : 130;
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: widget.isHome
          ? (MediaQuery.of(context).size.width - 56)
          : (MediaQuery.of(context).size.width - 65),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  onBeforeAfterDetailsClick();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - margin,
                  height: MediaQuery.of(context).size.width - margin,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    //border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: widget.isHome
                        ? BorderRadius.all(Radius.circular(10))
                        : BorderRadius.all(Radius.circular(19)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 1))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: widget.isHome
                        ? BorderRadius.all(Radius.circular(10))
                        : BorderRadius.all(Radius.circular(19)),
                    child: ClipRRect(
                      borderRadius: widget.isHome
                          ? BorderRadius.all(Radius.circular(10))
                          : BorderRadius.all(Radius.circular(19)),
                      child: BeforeAfter(
                        thumbRadius: 20,
                        imageCornerRadius: widget.isHome ? 10 : 19,
                        onSlideOpenAfterImage: (value) {
                          setState(() {
                            if (value){
                              onBeforeAfterDetailsClick();
                            }
                          });
                        },
                        imageHeight: MediaQuery.of(context).size.width - margin,
                        imageWidth: MediaQuery.of(context).size.width - margin-44,
                        beforeImage: Image.asset(
//                          images[currentBeforeIndex],
                          widget.isBeauty
                              ? imagesSurgery[currentBeforeIndex]
                              : images[currentBeforeIndex],
                          fit: BoxFit.cover,
                        ),
                        afterImage: Image.asset(
//                          images[9 - currentBeforeIndex],
                          widget.isBeauty
                              ? imagesSurgery[9 - currentBeforeIndex]
                              : images[9 - currentBeforeIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
//                      WidgetHelper.beforeAfterView(
//                          img1: images[currentBeforeIndex],
//                          img2: images[7 - currentBeforeIndex],
//                          height: MediaQuery.of(context).size.width - margin,
//                          width: MediaQuery.of(context).size.width - margin),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: widget.isHome
                    ? EdgeInsets.only(top: 20, left: 15)
                    : EdgeInsets.only(top: 12, left: 15),
                child: tags(context: context, tags: 'eye,nose,cheekbone'),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width - 48,
            width: 73,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.only(top: 0),
                  itemCount: 7,
                  itemBuilder: getBeforeAfterView),
            ),
          ),
        ],
      ),
    );
  }

  void onBeforeAfterDetailsClick() {
    print('onBeforeAfterDetailsClick $currentBeforeIndex');
    Vibrate.feedback(FeedbackType.light);
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ReviewDetailPage(isHospital: widget.isBeauty)));
  }

  static tags({BuildContext context, String tags}) {
    List<String> tagList = [];
    if (tags.isNotEmpty) {
      tagList = tags.split(",");
    }
    return Visibility(
        visible: tags.isNotEmpty,
        child: Container(
          //width: MediaQuery.of(context).size.width-100,
          height: 35,
          child: Wrap(
            runSpacing: 3,
            spacing: 8,
            children: tagList
                .map(
                  (tags) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        ImageAssets.star_tag,
                        width: 10,
                        height: 10,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        tags,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ));
  }

  Widget getBeforeAfterView(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          onBeforeListClick(index);
        },
        child: ClipRRect(
          borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
          child: Stack(
            children: <Widget>[
              new Image.asset(
//                images[index % images.length],
                widget.isBeauty
                    ? imagesSurgery[index % imagesSurgery.length]
                    : images[index % images.length],
                height: 47,
                width: 48,
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: index == currentBeforeIndex ? true : false,
                child: Container(
                  height: 47,
                  width: 48,
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      ImageAssets.check_white,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onBeforeListClick(int index) {
    currentBeforeIndex = index;
    setState(() {});
    print('onBeforeListClick');
  }
}
