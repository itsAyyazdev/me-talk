
import 'package:flutter/material.dart';
import 'package:me_talk/src/models/Imported/data/community_list_data.dart';
import 'package:me_talk/src/res/colors.dart';

import 'package:me_talk/src/res/image_assets.dart';


class ForumListView extends StatefulWidget {
  int id;
 
 CommunityListData communityListData;
  int index;
  bool isSearch = false;
  bool pic = true;
  ForumListView(
      {Key key,
        this.communityListData,this.index,this.isSearch,this.id,this.pic,
      })
      : super(key: key);

  @override
  _ForumListViewState createState() => _ForumListViewState();
}

class _ForumListViewState extends State<ForumListView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height:63,
          child: Padding(
            padding: const EdgeInsets.only(left: 0,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
//                widget.isSearch ? const EdgeInsets.only(left: 5):
                  const EdgeInsets.only(left: 0),
                  child:
//                widget.isSearch ? Text('') :
                  !widget.pic??true?Padding(padding: EdgeInsets.only(left: 10),): Container(
                    height: 40,
                    width: 40,
                    child: Stack(
                      children: <Widget>[
                        widget.id==1?
                        Center(
                          child: (widget.index<3)? Image.asset(
                            ImageAssets.king_icon,
                            width: 24,
                            height: 24,
                            color: ColorsHelper.pinkStarFillColor(),
                            fit: BoxFit.cover,
                          ):CircleAvatar(
                            radius: 13.5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsHelper.themeBlackColor(),
                                border: Border.all(width: 1,color:ColorsHelper.themeBlackColor() ),
                                shape:BoxShape.circle,
                              ),
                            ),
                          ),
                        ):Text('  '),
                        Center(
                          child: Padding(
                            padding:
                            (widget.index<3 && !widget.isSearch) ? const EdgeInsets.only(top: 8):
                            const EdgeInsets.only(top: 0),
                            child: Text(
                              (widget.index+1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  //fontFamily: FontsHelper.fonts_medium
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left:2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          //widget.communityListData.title??'',
                          'Which Hospital is best in Busan?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12
                            //fontFamily: FontsHelper.fonts_medium,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  //widget.communityListData.subCategoryName??'',
                                  'category',
                                  style: TextStyle(
                                    color: ColorsHelper.pinkStarFillColor(),
                                    fontSize: 9,
                                    //fontFamily: FontsHelper.fonts_medium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30,right: 17),
                                  child: Text(
                                    //widget.communityListData.userName??'',
                                    'Username',
                                    style: TextStyle(
                                      color: ColorsHelper.grey71TextColor(),
                                      fontSize: 9,
                                      //fontFamily: FontsHelper.fonts_medium,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImageAssets.watch_icon,
                                  width: 8,
                                  height: 9,
                                  color: ColorsHelper.themeBlackColor(),
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 10),
                                  child: Text(
                                    //widget.communityListData.timeDifference??'',
                                    '3hr ago',
                                    style: TextStyle(
                                      color: ColorsHelper.grey71TextColor(),
                                      fontSize: 9,
                                      //fontFamily: FontsHelper.fonts_medium,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImageAssets.view_icon,
                                  width: 13,
                                  height: 9,
                                  color: ColorsHelper.themeBlackColor(),
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 12),
                                  child: Text(
                                    //widget.communityListData.viewsCount.toString()??'',
                                    '312',
                                    style: TextStyle(
                                      color: ColorsHelper.grey71TextColor(),
                                      fontSize: 9,
                                      //fontFamily: FontsHelper.fonts_medium,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImageAssets.comment_icon,
                                  width: 12,
                                  height: 12,
                                  color: ColorsHelper.themeBlackColor(),
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 5),
                                  child: Text(
                                    //widget.communityListData.commentsCount.toString()??'',
                                    '21',
                                    style: TextStyle(
                                      color: ColorsHelper.grey71TextColor(),
                                      fontSize: 9,
                                      //fontFamily: FontsHelper.fonts_medium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: ColorsHelper.greyTextColor(),
          height: 0,
          thickness: 0.1,
        )
      ],
    );
  }
}
