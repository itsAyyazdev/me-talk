import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:flutter/material.dart';

class SelectPartScreen extends StatefulWidget {
  @override
  _SelectPartScreenState createState() => _SelectPartScreenState();
}

class _SelectPartScreenState extends State<SelectPartScreen> {

  List<String> cateList;
  int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cateList = ['Eyes','Nose','Brest','Liposuction','Facial contour','Transplantation of fat','Hair line','Tooth'];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Image.asset(
                ImageAssets.back_arrow,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.contain,
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            title: Image.asset(
              ImageAssets.nav_app_logo,
              width: 100.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
//            Text(
//              StringHelper.SelectPart,
//              textAlign: TextAlign.center,
//              overflow: TextOverflow.ellipsis,
//              maxLines: 1,
//              style: TextStyle(
//                  fontSize: 17.0,
//                fontFamily: FontsHelper.fonts_medium
//              ),
//            ),
            actions: <Widget>[
//              MaterialButton(
//                onPressed: (){
//
//                },
//                elevation: 0,
//                child: Text(
//                  StringHelper.publish,
//                  textAlign: TextAlign.center,
//                  overflow: TextOverflow.ellipsis,
//                  maxLines: 1,
//                  style: TextStyle(
//                      fontSize: 15.0,
//                    color: ColorsHelper.themeColor()
//                  ),
//                ),
//              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.black26,
                  height: 0.5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: getCategoryList,
                      itemCount: cateList.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70,bottom: 30),
                  child: InkWell(
                    child:Container(
                      width: MediaQuery.of(context).size.width-100,
                      color: ColorsHelper.themeBlackColor(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15),
                        child: Text(
                          StringHelper.reflect,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCategoryList(BuildContext context, int index) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: (){
            selectedIndex = index;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Container(
              decoration:  selectedIndex==null?null:selectedIndex==index ? BoxDecoration(
                  color: ColorsHelper.themeBlackColor(),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ):null,
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 8,bottom: 8),
                child: Text(
                  cateList[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: selectedIndex==index ?14:18,
                      color: selectedIndex==null?Colors.black:selectedIndex==index ?Colors.white:Colors.black
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
