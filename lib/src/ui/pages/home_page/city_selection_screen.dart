import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/utils/selectabletags/selectable_tags.dart';


class CitySelectionScreen extends StatefulWidget {
  
  bool isFromReviewList = false;
  CitySelectionScreen({Key key,this.isFromReviewList}):super(key:key);


  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {

  bool isAllCitySelected,isAllPartSelected;
  List<String> cityList;
  List<String> partList;
  List<Tag> cityTags = [];
  List<Tag> partTags = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cityList = ['Seoul', 'Busan', 'Incheon','Daegu', 'Daejeon', 'Gwangju', 'Suwon','Ulsan', 'Goyang', 'Yongin'];
    partList = ['Breast', 'Eyes', 'Nose','Body line', 'Lips', 'Teeth', 'Gynoplasty','Botox', 'Transplantation of fat', 'eyeblows'];


    isAllCitySelected =isAllPartSelected = false;

    int cnt = 0;
    cityList.forEach((item) {
      cityTags.add(Tag(
          id: cnt.toString(),
          title: item,
          active: false,
          icon: null));
      cnt++;
    });

    int pnt = 0;
    partList.forEach((item) {
      partTags.add(Tag(
          id: pnt.toString(),
          title: item,
          active: false,
          icon: null));
      pnt++;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Stack(
           alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: IconButton(
                              icon: Image.asset(
                                ImageAssets.close_dialog,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.contain,
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              }),
                        ),
                        Column(
                          children: <Widget>[
                            Visibility(
                              visible: !widget.isFromReviewList,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50,bottom: 20,left: 70,right: 70),
                                child: Text(
                                  StringHelper.where_do_you,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontFamily: FontsHelper.fonts_regular
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:30,left: 35),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    StringHelper.str_city,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: FontsHelper.fonts_bold
                                    ),
                                  ),
                                  InkWell(
                                      onTap: (){
                                        if(isAllCitySelected){
                                          isAllCitySelected = false;
                                          cityTags.forEach((tag) {
                                            tag.active = false;
                                          });
                                        }else{
                                          isAllCitySelected = true;
                                          cityTags.forEach((tag) {
                                            tag.active = true;
                                          });
                                        }
                                        setState(() {});
                                      },
                                      child:Padding(
                                        padding: const EdgeInsets.only(left: 35),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              StringHelper.check_all,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: FontsHelper.fonts_regular),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Image.asset(
                                                isAllCitySelected?ImageAssets.check_sel:ImageAssets.check_unsel,
                                                width: 15.0,
                                                height: 15.0,
                                                color: Color(0xff87BCBF),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: cityListBuilder(),
                            ),
                            Visibility(
                                visible: widget.isFromReviewList,
                                child: Column(
                                  children: <Widget>[
                                    Divider(
                                      color: Colors.black54,
                                      height: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30,left: 35),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            StringHelper.str_part,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontFamily: FontsHelper.fonts_bold
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                if(isAllPartSelected){
                                                  isAllPartSelected = false;
                                                  partTags.forEach((tag) {
                                                    tag.active = false;
                                                  });
                                                }else{
                                                  isAllPartSelected = true;
                                                  partTags.forEach((tag) {
                                                    tag.active = true;
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child:Padding(
                                                padding: const EdgeInsets.only(left: 35),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      StringHelper.check_all,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontFamily: FontsHelper.fonts_regular),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10),
                                                      child: Image.asset(
                                                        isAllPartSelected?ImageAssets.check_sel:ImageAssets.check_unsel,
                                                        width: 15.0,
                                                        height: 15.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 30),
                                      child: partListBuilder(),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      //gotoHomePage();
                      setState(() {
                        isAllCitySelected = true;
                        cityTags.forEach((tag) {
                          tag.active = true;
                        });

                        isAllPartSelected = true;
                        partTags.forEach((tag) {
                          tag.active = true;
                        });
                      });
                    },
                    child: Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width/2,
                      height: 70,
                      child: Center(
                        child: Text(
                          StringHelper.select_all,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: FontsHelper.fonts_regular),
                        )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      gotoHomePage();
                    },
                    child: Container(
                      color: ColorsHelper.themeBlackColor(),
                      width: MediaQuery.of(context).size.width/2,
                      height: 70,
                      child: Center(
                        child: Text(
                          StringHelper.save_selected,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: FontsHelper.fonts_regular),
                        )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

   void gotoHomePage(){
     //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));

   }

   Widget cityListBuilder (){
     return Padding(
       padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
       child: SelectableTags(
         tags: cityTags,
         columns: 6,
         fontSize: 14,
         offset: 5,
         borderSide: BorderSide(
           color: Colors.black26,
           width: 0.5,
         ),
         margin: EdgeInsets.all(8),
         borderRadius: BorderRadius.all(Radius.circular(8)),
         activeColor: ColorsHelper.themeBlackColor(),
         onPressed: (tag) {
           if(isAllCitySelected) {
             isAllCitySelected = false;
           }
           setState(() {
             print(tag);
           });
         },
       ),
     );
   }

  Widget partListBuilder (){
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: SelectableTags(
        tags: partTags,
        columns: 6,
        fontSize: 14,
        offset: 5,
        borderSide: BorderSide(
          color: Colors.black26,
          width: 0.5,
        ),
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        activeColor: ColorsHelper.themeBlackColor(),
        onPressed: (tag) {
          if(isAllPartSelected) {
            isAllPartSelected = false;
          }
          setState(() {
            print(tag);
          });
        },
      ),
    );
  }

}
