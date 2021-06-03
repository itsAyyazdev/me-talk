import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:me_talk/src/models/Imported/data/community_list_data.dart';
import 'package:me_talk/src/models/Imported/data/userdata.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_catgory_list_view.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:page_indicator/page_indicator.dart';
import 'community_detail_page.dart';
import 'forum_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:me_talk/src/res/colors.dart';

import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';




class AnonymityCommunityTab extends StatefulWidget {

  final bool isUpdateData;
  final bool isLogin;
  const AnonymityCommunityTab({Key key, this.isUpdateData,this.isLogin}) : super(key: key);

  @override
  _AnonymityCommunityTabState createState() => _AnonymityCommunityTabState();
}

class _AnonymityCommunityTabState extends State<AnonymityCommunityTab> {

  bool isPopularTab,isNoMoreData, isPaging;
  final PageController pageController = new PageController();
  List<String> images ;
  List<CommunityListData> communityList = [];
  int subCategoryId,roleId,orderTypeId,pageNo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPopularTab  = true;
    isNoMoreData = false;
    isPaging = false;
    pageNo = 1;
    images = [
      'assets/images/community/com-banner-7.png',
      'assets/images/community/com-banner-5.png',
      'assets/images/community/com-banner-6.png',
    ];
    //getRoleId();
    orderTypeId = CommunityListOrderType.Popular.index;
    new Future.delayed(const Duration(microseconds: 1), () {
        //communityListApi();
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose called Anonimity');
  }

  @override
  void didUpdateWidget(AnonymityCommunityTab oldWidget) {
    if(oldWidget.isUpdateData!=widget.isUpdateData){
      setState(() {
        isNoMoreData = false;
        pageNo = 1;
        isPaging = false;
        communityList.clear();
      });
      //communityListApi();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: ListView(
              shrinkWrap: true,
              //physics: ClampingScrollPhysics(),
              children: <Widget>[
                Container(
//                  height: MediaQuery.of(context).padding.top > 20 ?141:165,
                  height: Platform.isIOS
                      ? MediaQuery.of(context).padding.top > 20 ? 94 : 124
                      : 158,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 90.0,
                  child: PageIndicatorContainer(
                    pageView: PageView.builder(
                      itemBuilder: getPagerView,
                      itemCount: images.length,
                      controller: pageController,
                    ),
                    align: IndicatorAlign.bottom,
                    length: images.length,
                    shape: IndicatorShape.circle(size: 5),
                    indicatorSpace: 10.0,
                    indicatorColor: Colors.transparent,
                    indicatorSelectorColor: Colors.transparent,
                  ),
                ),
                RefreshIndicator(
                  onRefresh: _refresh,
                  backgroundColor: ColorsHelper.themeBlackColor(),
                  color: Colors.white,
                  child: LoadMore(
                    //isFinish: isNoMoreData,
                    //onLoadMore: _loadMore,
                    //whenEmptyLoad: isNoMoreData,
                    delegate: DefaultLoadMoreDelegate(),
                    textBuilder: DefaultLoadMoreTextBuilder.english,
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 100),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: getForumView,
                      itemCount: 15,
                      //itemCount: communityList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 145,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top:2.0,left: 10,right: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width : (MediaQuery.of(context).size.width-35)/2,
                    height:30,
                    decoration: new BoxDecoration(
                      color:ColorsHelper.themeBlackColor(),
                      borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
//                    border: Border.all(
//                      width: 0.5,
//                      color: ColorsHelper.themeBlackColor(),
//                    ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.27),
                          blurRadius: 4.0, // has the effect of softening the shadow
                          //spreadRadius: 1.3, // has the effect of extending the shadow
                          offset: Offset(
                            0, // horizontal, move right 10
                            1, // vertical, move down 10
                          ),
                        )
                      ],
                    ),
                    //decoration: WidgetHelper.customBoxDecorationWithShadow(ColorsHelper.themeBlackColor(), Colors.black12, Colors.black, 0.5, 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 8),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        isPopularTab = true;
                                        orderTypeId = CommunityListOrderType.Popular.index;
                                        setState(() {
                                          isNoMoreData = false;
                                          pageNo = 1;
                                          isPaging = false;
                                          communityList.clear();
                                        });
                                        //communityListApi();
                                      });
                                    },
                                    child: Text(
                                      StringHelper.popular_caps,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        //fontFamily: FontsHelper.fonts_medium,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                    child: Visibility(
                                      visible: isPopularTab,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Container(
                                          width: 50,
                                          height: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Image.asset(
                                ImageAssets.pink_circle_sep,
                                color: Colors.white,
                                width: 7,
                                height: 7,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        isPopularTab = false;
                                        orderTypeId = CommunityListOrderType.Recent.index;
                                        setState(() {
                                          isNoMoreData = false;
                                          pageNo = 1;
                                          isPaging = false;
                                          communityList.clear();
                                        });
                                        //communityListApi();
                                      });
                                    },
                                    child: Text(
                                      StringHelper.recent_caps,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        //fontFamily: FontsHelper.fonts_medium,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                    child: Visibility(
                                      visible: !isPopularTab,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Container(
                                          width: 40,
                                          height: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: (){
                        _displayDialog();
                      },
                      child: Container(
                        width : (MediaQuery.of(context).size.width-35)/2,
                        height:30,
                        decoration: new BoxDecoration(
                          color:Colors.white,
                          borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                          border: Border.all(
                            width: 0.5,
                            color: ColorsHelper.themeBlackColor(),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.27),
                              blurRadius: 4.0, // has the effect of softening the shadow
                              //spreadRadius: 1.3, // has the effect of extending the shadow
                              offset: Offset(
                                0, // horizontal, move right 10
                                1, // vertical, move down 10
                              ),
                            )
                          ],
                        ),
                        //decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white, ColorsHelper.themeBlackColor(),Colors.black, 0.8, 15),
                        child: Center(
                          child: Text(
                            StringHelper.anonymity_category,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorsHelper.themeBlackColor(),
                              fontSize: 15,
                              //fontFamily: FontsHelper.fonts_medium
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
        ],
      ),
    );
  }

  _displayDialog() async{
    int cateId = await showDialog<int>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ShopCategoryListAlertView(
            popup:3,
            categoryTypeId: "5",);
        });

    if(cateId!=null){
      subCategoryId = cateId;
      setState(() {
        isNoMoreData = false;
        pageNo = 1;
        isPaging = false;
        communityList.clear();
      });
      //communityListApi();
    }
  }

  Widget getPagerView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        images[index],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getForumView(BuildContext context, int index) {
    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityDetailPage(isLogin: true,)));
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityDetailPage(communityId:communityList[index].id ,isLogin: widget.isLogin,)));
        },
        child: ForumListView(communityListData: null,index: index,isSearch: !isPopularTab,pic: true,)
        //child: ForumListView(communityListData: communityList[index],index: index,isSearch: !isPopularTab)
    );
  }

  getRoleId()async{
    String data = await SharePreferencesHelper()
        .getString(SharePreferencesHelper.User_Data);
    UserData userData = UserData.fromJson(jsonDecode(data));
    setState(() {
      roleId = userData.user.roles[0].roleId;
    });
  }

  Future<void> _refresh() async {
//    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
//    print("on_refresh");
//    setState(() {
//      isNoMoreData = false;
//      pageNo = 1;
//      isPaging = false;
//      communityList.clear();
//    });
    //communityListApi();
  }

  Future<bool> _loadMore() async {
//    print("onLoadMore");
//    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
//    isPaging = true;
    //communityListApi();
    return true;
  }

//  void communityListApi() async {
//
//      CommunityListResponse _response = await DataManagerInheritedWidget.of(context)
//          .apiRepos
//          .communityListRequest(context, roleId,CategoryListId.Community.index,subCategoryId??0,orderTypeId,pageNo,true);
//      if (_response.statusCode == 200) {
//        pageNo = pageNo+1;
//        setState(() {
//          if(_response.data.length<10){
//            isNoMoreData = true;
//          }
//          communityList.addAll(_response.data);
//        });
//      } else{
//        setState(() {
//          isNoMoreData = true;
//        });
//        if(!isPaging){
//          Utility.showToast(context, _response.message);
//        }
//      }
//  }

}
