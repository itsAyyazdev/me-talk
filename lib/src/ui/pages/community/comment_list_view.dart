import 'package:flutter/material.dart';
import 'package:me_talk/src/models/Imported/data/community_detail_data.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';

import 'report_alert_view.dart';

class CommentListView extends StatefulWidget {
  CommunityCommentsData commentsData;
  int postId;
  int index;
  int roleId;
  Function btnLikeClicked;
  Function btnCommentClicked;
  bool isLogin;
  CommentListView(
      {Key key,
      this.commentsData,
      this.index,
      this.postId,
      this.roleId,
      this.btnLikeClicked,
      this.btnCommentClicked,
      this.isLogin})
      : super(key: key);

  @override
  _CommentListViewState createState() => _CommentListViewState();
}

class _CommentListViewState extends State<CommentListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 11, top: 9, right: 11
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 15.5,
                  child: Container(
                    width: 31.0,
                    height: 31.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(ImageAssets.bg7)
                          // image: widget.commentsData==null?AssetImage(ImageAssets.user_default):(widget.commentsData.avatar==''||widget.commentsData.avatar==null)?AssetImage(ImageAssets.user_default):NetworkImage(widget.commentsData.avatar)
                          ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              widget.commentsData == null
                                  ? 'USER NAME'
                                  : widget.commentsData.name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Text(
                                widget.commentsData == null
                                    ? '23 min ago'
                                    : widget.commentsData.timeDifference,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorsHelper.greyTextColor(),
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Text(
                            widget.commentsData == null
                                ? 'but when you scroll back to the top, the menu appears, correct?'
                                : widget.commentsData.comment,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  if (widget.isLogin) {
                                    //widget.btnLikeClicked();
                                  }
                                },
                                child: Row(
                                  children: <Widget>[
//                                  Text(
//                                    StringHelper.str_like_caps,
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                      color: widget.commentsData==null?Colors.black:ColorsHelper.themeColor(),
//                                      //color: widget.commentsData.userCommentLike==null?Colors.black:ColorsHelper.themeColor(),
//                                      fontSize: 14.0,
//                                    ),
//                                  ),
                                    Image.asset(
                                      widget.commentsData == null
                                          ? ImageAssets.like_unsel
                                          : ImageAssets.like_unsel,
                                      width: 15.0,
                                      height: 15.0,
                                      color: widget.commentsData == null
                                          ? ColorsHelper.themeBlackColor()
                                          : ColorsHelper.themeColor(),
                                      fit: BoxFit.contain,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Text(
                                        widget.commentsData == null
                                            ? '1'
                                            : widget.commentsData
                                                        .reviewCommentLikeCount >
                                                    0
                                                ? widget.commentsData
                                                    .reviewCommentLikeCount
                                                    .toString()
                                                : '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // widget.btnCommentClicked();
                                  //widget.isLogin?goToReplyList():widget.commentsData.replyCommentCount>0?goToReplyList():Text('');
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      StringHelper.str_comment_caps,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Text(
                                        widget.commentsData == null
                                            ? ''
                                            : widget.commentsData
                                                        .replyCommentCount >
                                                    0
                                                ? widget.commentsData
                                                    .replyCommentCount
                                                    .toString()
                                                : '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (widget.isLogin) {
                                    //displayDialog();
                                  }
                                },
                                child: Text(
                                  StringHelper.str_report_caps,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Divider(
              color: ColorsHelper.greyTextColor(),
              height: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  goToReplyList() {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => CommentReplyList(commentId: widget.commentsData.id,roleId: widget.roleId,isLogin: widget.isLogin,)));
  }

  displayDialog() {
    showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ReportAlertView(
            postId: widget.commentsData.id,
            roleId: widget.roleId,
            isCommentReport: true,
          );
        });
  }
}
