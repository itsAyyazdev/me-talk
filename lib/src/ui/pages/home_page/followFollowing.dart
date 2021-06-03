import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_portfolio_page.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_profile_page.dart';
import 'package:vibrate/vibrate.dart';

class FollowingBeautyPlaces extends StatefulWidget {
  @override
  _FollowingBeautyPlacesState createState() => _FollowingBeautyPlacesState();
}

class _FollowingBeautyPlacesState extends State<FollowingBeautyPlaces> {
  List<String> imagesBeauty = [
    ImageAssets.imog1,
    ImageAssets.imog2,
    ImageAssets.imog3,
    ImageAssets.imog4,
    ImageAssets.imog5,
    ImageAssets.imog6,
    ImageAssets.imog7,
    ImageAssets.imog8,
    ImageAssets.imog9,
    ImageAssets.imog10,
    ImageAssets.imog11,
    ImageAssets.imog12,
    ImageAssets.imog13,
    ImageAssets.imog14,
    ImageAssets.imog15,
    ImageAssets.imog11,
    ImageAssets.imog8,
    ImageAssets.imog9,
    ImageAssets.imog10,
    ImageAssets.imog2,
    ImageAssets.imog3,

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(

      preferredSize: Size.fromHeight(90.0), // here the desired height
      child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54.withOpacity(0.1),
                  blurRadius: 5.0,
                  offset: Offset(0.1, 0.9)
              )
            ],),
        child: Column(
          children: <Widget>[
            AppBar(
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
              actions: <Widget>[
                Container(

                  margin: EdgeInsets.only(right: 10),

                  child: InkWell(
                    child: Image.asset(
                      ImageAssets.notification,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: InkWell(
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
                ),
              ],
            ),
            Container(
                color: ColorsHelper.whiteColor(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Text(
                        "Your following",
                      style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          fontFamily: 'MontserratMedium'),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SubscritedShop()),
                        );

                      },
                      child: Image.asset('assets/images/ppl.png'),
                    ),
                    Text(
                      "42",
                      style: TextStyle(
                          color: ColorsHelper.themeBlackColor(),
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          fontFamily: 'MontserratMedium'),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ),
    body: Container(
       width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:  new GridView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 10),
        shrinkWrap: true,
        itemCount: 20,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemBuilder: getFollowingBeautyView,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopPortfolioPage()),
          );
        },
        child: Image.asset(
          imagesBeauty.elementAt(index),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
class SubscritedShop extends StatefulWidget {
  @override
  _SubscritedShopState createState() => _SubscritedShopState();
}

class _SubscritedShopState extends State<SubscritedShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,

        title: Center(child: Text("Subscrited Shop")),
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
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
              child: Image.asset(
                ImageAssets.notification,
                width: 25.0,
                height: 25.0,
                fit: BoxFit.contain,
              ),
              onTap: () {},
            ),
          ),
       ],
      ) ,
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: _subscritedShop(),
    ),
    );
  }
  Widget _subscritedShopcard(int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShopProfilePage()),
        );

      },
      child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(

                width: MediaQuery.of(context).size.width * .20,
                height: MediaQuery.of(context).size.height * .085,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(

                    // height: 65,
                    // width: 65,
                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsHelper.dashboardGrid(), width: 1),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(ImageAssets.imog4,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("shop name",
                        style: TextStyle(color:ColorsHelper.dashboardGrid(), fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Montserrat')),
                  ),
                  Container(
                    child: Text("City area",
                        style: TextStyle(color: ColorsHelper.dashboardGrid(), fontSize: 15,fontFamily: 'Montserrat')),
                  ),
                  ],
              ),
              SizedBox(
                width: 10,
              ),


              GestureDetector(
child: Container(
      width: 80,
      height: 30,
      alignment: Alignment.center,
      margin:
      EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
      decoration: BoxDecoration(
          color: ColorsHelper.dashboardGrid(),
          borderRadius: BorderRadius.circular(40),
         ),
      child: Text("Cancel",
          style: TextStyle(
              color: ColorsHelper.whiteColor(),
              fontSize: 13,
              fontFamily: 'MontserratMedium'))),
              )
            ],
          ),
      ),
    );
  }
  Widget _subscritedShop(){
    return Container(
      margin: EdgeInsets.only(top: 20),

      height: MediaQuery.of(context).size.height*.8,
      width: MediaQuery.of(context).size.width,
      child:ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: 34),
        itemBuilder: (BuildContext context, int index) {
          return _subscritedShopcard(index);
        },
      ),
    );

  }
}

