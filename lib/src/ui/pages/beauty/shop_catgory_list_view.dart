import 'package:me_talk/src/models/categoryListbeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:flutter/material.dart';

class ShopCategoryListAlertView extends StatefulWidget {
  String categoryTypeId;
  bool isAddPost;
  int popup;

  ShopCategoryListAlertView(
      {Key key, this.categoryTypeId, this.isAddPost, this.popup})
      : super(key: key);

  @override
  _ShopCategoryListAlertViewState createState() =>
      _ShopCategoryListAlertViewState();
}

class _ShopCategoryListAlertViewState extends State<ShopCategoryListAlertView> {
  List<CategoryListData> categoryList = [];
  int selectedCategoryId;

  //List<String> cateList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cateList = ['Eye brows','Hair','Tattoo','Nail art','Hair extensions','Waxing','Eyelashes','Massage','Skin','Make up'];
    new Future.delayed(const Duration(microseconds: 100), () {
      //shopCategoryListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.popup == 1
          ? AlertDialog(
              contentPadding:
                  EdgeInsets.only(top: 0, left: 35, right: 35, bottom: 10),
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // backgroundColor: ColorsHelper.themeBlackColor(),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Talk',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'For woman',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'For man',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Fashion',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Beauty',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Teenager',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Twenties',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Thirties',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Beauty job',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Job',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                            SizedBox(height: 13),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'Diet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )),
                          ],
                        )),
                    // Container(
                    //   margin: EdgeInsets.only(top:10),
                    //   height: MediaQuery.of(context).size.height - 400,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.vertical,
                    //     itemCount: categoryList.length,
                    //     //itemCount: cateList.length,
                    //     shrinkWrap: true,
                    //     physics: ClampingScrollPhysics(),
                    //     itemBuilder: getCategoryListView,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 5),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xff353A50),
                        child: IconButton(
                            icon: Image.asset(
                              ImageAssets.close_dialog,
                              width: 15.0,
                              height: 15.0,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                    /* Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    child: Text(
                      StringHelper.str_cancel_caps,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )*/
                  ],
                ),
              ),
            )
          : widget.popup == 2
              ? AlertDialog(
                  contentPadding:
                      EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  // backgroundColor: ColorsHelper.themeBlackColor(),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'SURGERY CATEGORY',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'All',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Surgery question',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Surgery talk',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Exparience',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'For man',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 16),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'About hospital',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                              ],
                            )),
                        // Container(
                        //   margin: EdgeInsets.only(top:10),
                        //   height: MediaQuery.of(context).size.height - 400,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.vertical,
                        //     itemCount: categoryList.length,
                        //     //itemCount: cateList.length,
                        //     shrinkWrap: true,
                        //     physics: ClampingScrollPhysics(),
                        //     itemBuilder: getCategoryListView,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 5),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xff353A50),
                            child: IconButton(
                                icon: Image.asset(
                                  ImageAssets.close_dialog,
                                  width: 15.0,
                                  height: 15.0,
                                  color: Colors.white,
                                  fit: BoxFit.contain,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ),
                        /* Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    child: Text(
                      StringHelper.str_cancel_caps,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )*/
                      ],
                    ),
                  ),
                )
              : AlertDialog(
                  contentPadding:
                      EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  // backgroundColor: ColorsHelper.themeBlackColor(),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'ANONYMITY CATEGORY',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 13),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'All',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 13),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Sexual',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 13),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Woe',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 13),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Experience',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                                SizedBox(height: 13),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'TALK',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    )),
                              ],
                            )),
                        // Container(
                        //   margin: EdgeInsets.only(top:10),
                        //   height: MediaQuery.of(context).size.height - 400,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.vertical,
                        //     itemCount: categoryList.length,
                        //     //itemCount: cateList.length,
                        //     shrinkWrap: true,
                        //     physics: ClampingScrollPhysics(),
                        //     itemBuilder: getCategoryListView,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 5),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xff353A50),
                            child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ),
                        /* Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    child: Text(
                      StringHelper.str_cancel_caps,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )*/
                      ],
                    ),
                  ),
                ),
    );
  }

  String getTitle() {
    String categoryTitle = '';
    if (widget.categoryTypeId == '3') {
      categoryTitle = StringHelper.talk_category;
    } else if (widget.categoryTypeId == '4') {
      categoryTitle = StringHelper.surgery_category;
    } else if (widget.categoryTypeId == '5') {
      categoryTitle = StringHelper.anonymity_category;
    } else {
      categoryTitle = '';
    }
    return categoryTitle;
  }

  Widget getCategoryListView(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategoryId = 1;
          Navigator.of(context).pop(selectedCategoryId);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: Offset(0, 1))
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'cate name',
                //cateList[index],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: selectedCategoryId == index
                      ? ColorsHelper.themeBlackColor()
                      : Colors.black,
                  fontSize: 20.0,
                  //fontFamily: FontsHelper.fonts_medium
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//  void shopCategoryListApi() async {
//    CategoryListResponse _response =
//        await DataManagerInheritedWidget.of(context)
//            .apiRepos
//            .categoryList(context, widget.categoryTypeId);
//    categoryList.clear();
//    setState(() {
//      if(widget.categoryTypeId == '3'||widget.categoryTypeId=='4'||widget.categoryTypeId=='5'){
//        if(widget.isAddPost==null){
//          categoryList.add(new CategoryListData(0,'All'));
//        }
//        categoryList.addAll(_response.data);
//      }else{
//        categoryList = _response.data;
//      }
//    });
//    if (_response.statusCode == 200) {
//      //Utility.showAlertDialogCallBack(context: context, message: _response.message);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
}
