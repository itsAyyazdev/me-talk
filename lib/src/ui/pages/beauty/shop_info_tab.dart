import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_portfolio_page.dart';
import 'package:vibrate/vibrate.dart';

class ShopInfoTab extends StatefulWidget {
  @override
  _ShopInfoTabState createState() => _ShopInfoTabState();
}

class _ShopInfoTabState extends State<ShopInfoTab> {
  List<String> imagesBeauty = [
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_1.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_2.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_3.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_4.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_5.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_6.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_7.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_8.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_9.png',
  'assets/images/beauty/Portfolio_profile_pics/Screenshot_10.png',
    'assets/images/beauty/Portfolio_profile_pics/Screenshot_11.png',
    'assets/images/beauty/Portfolio_profile_pics/Screenshot_12.png',
    'assets/images/beauty/Portfolio_profile_pics/Screenshot_13.png',
    'assets/images/beauty/Portfolio_profile_pics/Screenshot_14.png',
    'assets/images/beauty/Portfolio_profile_pics/Screenshot_15.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 13.0, left: 16, right: 16,),
              child: Container(
                height: 58,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: ColorsHelper.skyColor().withOpacity(0.08),
                          offset: Offset(0, 4),
                          blurRadius: 16),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "125",
                                style: TextStyle(
                                    fontSize: 20,
                                    //fontFamily: FontsHelper.fonts_Gibson_Semibold
                                ),
                              ),
                              Text(
                                "Flowers",
                                style: TextStyle(
                                    fontSize: 11,
                                    //fontFamily: FontsHelper.fonts_Gibson_Regular
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 1,
                        child: Container(
                          color: ColorsHelper.dividerColor(),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "150",
                                style: TextStyle(
                                    fontSize: 20,
                                    //fontFamily: FontsHelper.fonts_Gibson_Semibold
                                   ),
                              ),
                              Text(
                                "work complete",
                                style: TextStyle(
                                    fontSize: 11,
                                    //fontFamily: FontsHelper.fonts_Gibson_Regular
                                  ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 1,
                        child: Container(
                          color: ColorsHelper.dividerColor(),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "211",
                                style: TextStyle(
                                    fontSize: 20,
                                    //fontFamily: FontsHelper.fonts_Gibson_Semibold
                                  ),
                              ),
                              Text(
                                "Portfolio",
                                style: TextStyle(
                                    fontSize: 11,
                                    //fontFamily: FontsHelper.fonts_Gibson_Regular
                                  ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 1,
                        child: Container(
                          color: ColorsHelper.dividerColor(),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "41",
                                style: TextStyle(
                                    fontSize: 20,
                                    //fontFamily: FontsHelper.fonts_Gibson_Semibold
                                ),
                              ),
                              Text(
                                "Review",
                                style: TextStyle(
                                    fontSize: 11,
                                    //fontFamily: FontsHelper.fonts_Gibson_Regular
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 75),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                //height: MediaQuery.of(context).size.width - 20,
                child: new GridView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 12),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemBuilder: getFollowingBeautyView,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFollowingBeautyView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: InkWell(
        onTap: () {
          Vibrate.feedback(FeedbackType.light);
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => ShopPortfolioPage()),);
        },
        child: Image.asset(
          imagesBeauty.elementAt(index),
          //height: 55,
          // width: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
