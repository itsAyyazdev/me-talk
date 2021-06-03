
import 'package:flutter/material.dart';
import 'package:me_talk/src/models/Imported/data/reply_list_data.dart';
import 'comment_list_view.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

import 'reply_list_view.dart';

class CommentReplyList extends StatefulWidget {

  final int commentId,roleId;
  final bool isLogin;

  CommentReplyList({Key key, this.commentId,this.isLogin,this.roleId}) : super(key: key);

  @override
  _CommentReplyListState createState() => _CommentReplyListState();
}

class _CommentReplyListState extends State<CommentReplyList> {

  TextEditingController controller;
  String replyOnComment;

  List<ReplyListData> replyList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    replyList = [];
    new Future.delayed(const Duration(microseconds: 1), () {
       //replyListApi();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Image.asset(
            ImageAssets.back_arrow,
            width: 25.0,
            height: 25.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          StringHelper.reply_caps,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: FontsHelper.fonts_HyGothic_regular
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Padding(
                padding: widget.isLogin?const EdgeInsets.only(bottom: 80,top: 10):const EdgeInsets.only(bottom: 0,top: 10),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: getCommentListView,
                      itemCount: replyList.length,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.isLogin,
                child: Container(
                  color: Colors.white,
                  height: 80,
                  child: Column(
                    children: <Widget>[
                      Divider(
                        color: Colors.black45,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  controller: controller,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: StringHelper.reply_on_the_comment,
                                  ),
                                  onSubmitted: (String comment){
                                    replyOnComment = comment;
                                  },
                                  onChanged: (String comment){
                                    replyOnComment = comment;
                                  },
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                if(replyOnComment!=null||replyOnComment.length!=0){
                                  //replyOnCommentApi();
                                }
                              },
                              child: Text(
                                StringHelper.reply_caps,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: ColorsHelper.themeColor(),
                                    fontSize: 16.0,
                                    //fontFamily: FontsHelper.fonts_medium
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCommentListView(BuildContext context, int index) {
    return InkWell(
        onTap: (){
        },
        child: ReplyListView(replyData: replyList[index],index: index,)
    );
  }

//  void replyListApi() async {
//    ReplyListResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .replyListRequest(context,widget.commentId,widget.roleId);
//    replyList.clear();
//    if (_response.statusCode==200) {
//      replyList = _response.data;
//      setState(() {});
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

//  void replyOnCommentApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .replyOnCommentRequest(context,widget.commentId,widget.roleId,replyOnComment);
//    if (_response.statusCode==200) {
//      replyListApi();
//      replyOnComment = null;
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }


}
