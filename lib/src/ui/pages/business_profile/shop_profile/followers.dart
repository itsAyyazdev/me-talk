import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
class FollowerBusiness extends StatefulWidget {
  @override
  _FollowerBusinessState createState() => _FollowerBusinessState();
}

class _FollowerBusinessState extends State<FollowerBusiness> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        elevation: 5,

        title: Center(child: Text("Followers")),
        backgroundColor: ColorsHelper.whiteColor(),
        leading: IconButton(
          icon: Image.asset(
            ImageAssets.back_arrow,
            width: 20.0,
            height: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
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
                  child: Text("username",
                      style: TextStyle(color:ColorsHelper.dashboardGrid(), fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Montserrat')),
                ),
                Container(
                  child: Text("City area",
                      style: TextStyle(color: ColorsHelper.dashboardGrid(), fontSize: 15,fontFamily: 'Montserrat')),
                ),
              ],
            ),
            SizedBox(
              width:90,
            ),


           index==0||index==2||index==2?GestureDetector(
             child: Container(
               width: 30,
               height: 60,
               alignment: Alignment.center,
               margin:
               EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
               decoration: BoxDecoration(
                 color: ColorsHelper.pinkDropDown(),
                 borderRadius: BorderRadius.circular(5),
               ),
               child:  Image.asset(
                 ImageAssets.history,
                 width: 30,
               ),
             ),
           ): SizedBox(
             width: 65,

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

