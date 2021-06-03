import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:me_talk/src/models/Imported/data/community_detail_data.dart';
import 'package:me_talk/src/models/Imported/data/userdata.dart';
import 'package:me_talk/src/models/Imported/response/community_detail_response.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/constants.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/utility.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:vibrate/vibrate.dart';

import 'comment_list_view.dart';
import 'more_option_alert.dart';

class CommunityDetailPage extends StatefulWidget {
  int communityId;
  bool isLogin;

  CommunityDetailPage({Key key, this.communityId, this.isLogin})
      : super(key: key);

  @override
  _CommunityDetailPageState createState() => _CommunityDetailPageState();
}

class _CommunityDetailPageState extends State<CommunityDetailPage> {
  TextEditingController controller;
  CommunityDetailData communityDetailData;
  int roleId, commentIndexForReply;
  String commentOnPost;
  FocusNode myFocusNode;
  bool isReplyComment;
  int opac=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    myFocusNode = FocusNode();
    isReplyComment = false;
    new Future.delayed(const Duration(microseconds: 1), () {
      //getCommunityDetailsApi(context, widget.communityId);
    });
    //getRoleId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
//      appBar: AppBar(
//        backgroundColor: ColorsHelper.whiteColor(),
//        elevation: 0,
//        leading: IconButton(
//          icon: Image.asset(
//            ImageAssets.back_arrow,
//            width: 20.0,
//            height: 20.0,
//            fit: BoxFit.contain,
//          ),
//          onPressed: () {
//            Vibrate.feedback(FeedbackType.light);
//            Navigator.of(context).pop();
//          },
//        ),
//        centerTitle: true,
//        title: Container(
//          margin: const EdgeInsets.only(top: 7),
//          width: MediaQuery.of(context).size.height *
//              (Platform.isIOS ? 0.15 : 0.12),
//          height: MediaQuery.of(context).size.height *
//              (Platform.isIOS ? 0.11 : 0.10),
//          child: FlareActor(
//            'assets/logo_chactor.flr',
//            alignment: Alignment.center,
//            fit: BoxFit.cover,
//            animation: "Logo",
//            //controller: controls,
//          ),
//        ),
//        actions: <Widget>[
//          Container(
//            margin: EdgeInsets.only(right: 25),
//            child: InkWell(
//              child: Image.asset(
//                ImageAssets.notification,
//                width: 24.0,
//                height: 24.0,
//                fit: BoxFit.contain,
//              ),
//              onTap: () {
//                Vibrate.feedback(FeedbackType.light);
//              },
//            ),
//          ),
//        ],
//      ),
      body: 
       GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child:
        Container(
          color: Colors.white,

          child: 
          SafeArea(
            top: false,
            bottom: false,
            child:
             Stack(
              //alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          height: 103,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5),
                          child: Row(
                            children: <Widget>[
                              Text(
                                //communityDetailData==null?'':communityDetailData.categoryName,
                                'Category',
                                style: TextStyle(
                                  color: ColorsHelper.themeColor(),
                                  fontSize: 13,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, right: 10),
                                child: Text(
                                  //communityDetailData==null?'':communityDetailData.subCategoryName,
                                  'subCategory',
                                  style: TextStyle(
                                    color: ColorsHelper.themeColor(),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 11),
                          child: Text(
                            //communityDetailData==null?'':communityDetailData.title,
                            'TItle',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 22, top: 6, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 15.5,
                                    child: Container(
                                      width: 31.0,
                                      height: 31.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/community/comm_post_dp.png'
                                            )
                                            //image: communityDetailData==null?AssetImage(ImageAssets.user_default):(communityDetailData.avatar==''||communityDetailData.avatar==null)?AssetImage(ImageAssets.user_default):NetworkImage(communityDetailData.avatar)
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          communityDetailData == null
                                              ? 'user name'
                                              : communityDetailData.userName,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                        Text(
                                          communityDetailData == null
                                              ? '2019.11.10'
                                              : communityDetailData.createdAt,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: widget.isLogin,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  icon: Image.asset(
                                    ImageAssets.more_icon,
                                    width: 23.0,
                                    height: 10.0,
                                    fit: BoxFit.contain,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      opac=1;
                                    });
                                 displayDialog();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 28, right: 28, top: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              color: Colors.black12,
                              child: Image.asset(
                                //communityDetailData==null?'':communityDetailData.image,
                                'assets/images/community/comm_post_dp.png',
                                width: MediaQuery.of(context).size.width - 56,
                                height: MediaQuery.of(context).size.width - 56-15,
                                fit: BoxFit.cover,
                              ),
//                            Image.network(
//                              //communityDetailData==null?'':communityDetailData.image,
//                              ImageAssets.bg7,
//                              width: MediaQuery.of(context).size.width -50,
//                              height: MediaQuery.of(context).size.width -50,
//                              fit: BoxFit.cover,
//                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25, top: 10, right: 25),
                          child: Text(
                            communityDetailData == null
                                ? 'ur philosophy comes straight from our Greek heritage; that '
                                : communityDetailData.description,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ColorsHelper.greyTextColor(),
                                fontSize: 13.0,
                                //fontFamily: FontsHelper.fonts_Segoe_regular
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 38, top: 86, right: 38, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    StringHelper.str_like_caps,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: ColorsHelper.greyTextColor(),
                                        fontSize: 13.0,
                                        //fontFamily: FontsHelper.fonts_Segoe_regular
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      communityDetailData == null
                                          ? '41'
                                          : communityDetailData.likesCount
                                              .toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: ColorsHelper.greyTextColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_Segoe_regular
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    StringHelper.str_comment_caps,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: ColorsHelper.greyTextColor(),
                                        fontSize: 13.0,
                                        //fontFamily: FontsHelper.fonts_Segoe_regular
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      communityDetailData == null
                                          ? '6'
                                          : communityDetailData.commentsCount
                                              .toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: ColorsHelper.greyTextColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_Segoe_regular
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    StringHelper.str_view_caps,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: ColorsHelper.greyTextColor(),
                                        fontSize: 13.0,
                                        //fontFamily: FontsHelper.fonts_Segoe_regular
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      communityDetailData == null
                                          ? '124'
                                          : communityDetailData.viewsCount
                                              .toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: ColorsHelper.greyTextColor(),
                                          fontSize: 13.0,
                                          //fontFamily: FontsHelper.fonts_Segoe_regular
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
//                      Divider(
//                        color: Colors.black45,
//                        height: 0.5,
//                      ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffECDBE2),width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                IconButton(
                                  padding: const EdgeInsets.all(0),
                                  icon: Image.asset(
                                    communityDetailData == null
                                        ? ImageAssets.like_unsel
                                        : communityDetailData.userIsLike == 1
                                            ? ImageAssets.like_sel
                                            : ImageAssets.like_unsel,
                                    width: 22.0,
                                    height: 20.0,
                                    color: communityDetailData == null
                                        ? ColorsHelper.themeBlackColor()
                                        : communityDetailData.userIsLike == 1
                                            ? ColorsHelper.themeColor()
                                            : ColorsHelper.themeBlackColor(),
                                    fit: BoxFit.contain,
                                  ),
                                  onPressed: () {
                                    if (widget.isLogin) {
                                      //likeOnPostApi();
                                    }
                                  },
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(0),
                                  icon: Image.asset(
                                    ImageAssets.comment_icon,
                                    width: 20.0,
                                    height: 19.0,
                                    color: ColorsHelper.themeBlackColor(),
                                    fit: BoxFit.contain,
                                  ),
                                  onPressed: () {
                                    if (isReplyComment) {
                                      isReplyComment = false;
                                      setState(() {});
                                    }
                                    FocusScope.of(context)
                                        .requestFocus(myFocusNode);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
//                      Divider(
//                        color: Colors.black45,
//                        height: 0.5,
//                      ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 66),
                          physics: ScrollPhysics(),
                          itemBuilder: getCommentListView,
                          itemCount: communityDetailData == null
                              ? 10
                              : communityDetailData.comments.length,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: WidgetHelper.setBlurEffect(Container(
                        height: 103,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 44),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
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
                              Container(
                                margin: const EdgeInsets.only(top: 7),
                                width: MediaQuery.of(context).size.height *
                                    (Platform.isIOS ? 0.15 : 0.12),
                                height: MediaQuery.of(context).size.height *
                                    (Platform.isIOS ? 0.11 : 0.10),
                                child: FlareActor(
                                  'assets/logo_chactor.flr',
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  animation: "Logo",
                                  //controller: controls,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 25),
                                child: InkWell(
                                  child: Image.asset(
                                    ImageAssets.notification,
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.contain,
                                  ),
                                  onTap: () {
                                    Vibrate.feedback(FeedbackType.light);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))

//                    ClipRect(
//                      child: BackdropFilter(
//                        filter:ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                        child: Material(
//                          color:Colors.white.withOpacity(0.8),
//                          child: Container(
//                            height: 103,
//                            child: Padding(
//                              padding:  EdgeInsets.only(top: 44),
//                              child: Row(
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                //mainAxisSize: MainAxisSize.min,
//                                children: <Widget>[
//                                  IconButton(
//                                    icon: Image.asset(
//                                      ImageAssets.back_arrow,
//                                      width: 20.0,
//                                      height: 20.0,
//                                      fit: BoxFit.contain,
//                                    ),
//                                    onPressed: () {
//                                      Vibrate.feedback(FeedbackType.light);
//                                      Navigator.of(context).pop();
//                                    },
//                                  ),
//                                  Container(
//                                    margin: const EdgeInsets.only(top: 7),
//                                    width: MediaQuery.of(context).size.height *
//                                        (Platform.isIOS ? 0.15 : 0.12),
//                                    height: MediaQuery.of(context).size.height *
//                                        (Platform.isIOS ? 0.11 : 0.10),
//                                    child: FlareActor(
//                                      'assets/logo_chactor.flr',
//                                      alignment: Alignment.center,
//                                      fit: BoxFit.cover,
//                                      animation: "Logo",
//                                      //controller: controls,
//                                    ),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.only(right: 25),
//                                    child: InkWell(
//                                      child: Image.asset(
//                                        ImageAssets.notification,
//                                        width: 24.0,
//                                        height: 24.0,
//                                        fit: BoxFit.contain,
//                                      ),
//                                      onTap: () {
//                                        Vibrate.feedback(FeedbackType.light);
//                                      },
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:103.0),
                      child: Divider(
                        height: 0.5,
                        color: ColorsHelper.greyTextColor(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: WidgetHelper.setBlurEffect(Container(
                    decoration:BoxDecoration(
                        border: Border(
                          top: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
                          right: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
                          left: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
                        )
                    ),
                    height: 66,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10,top: 0),
                              child: TextField(
                                textInputAction: TextInputAction.done,
                                textAlignVertical: TextAlignVertical.top,
                                controller: controller,
                                focusNode: myFocusNode,
                                cursorColor: ColorsHelper.grey71TextColor(),
                                textCapitalization:
                                TextCapitalization.sentences,
                                style: TextStyle(
                                  color: ColorsHelper.grey71TextColor(),
                                  fontSize: 12.0,
                                  //ontFamily: FontsHelper.fonts_medium
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: isReplyComment
                                      ? StringHelper.reply_on_the_comment
                                      : StringHelper.comment_on_the_post,
                                  contentPadding: EdgeInsets.only(bottom: 16),
                                ),
                                onSubmitted: (String comment) {
                                  commentOnPost = comment;
                                  if (isReplyComment) {
                                    isReplyComment = false;
                                    setState(() {});
                                  }
                                },
                                onChanged: (String comment) {
                                  commentOnPost = comment;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: InkWell(
                              onTap: () {
                                if (commentOnPost != null ||
                                    commentOnPost.length != 0) {
                                  if (isReplyComment) {
                                    //replyOnCommentApi();
                                  } else {
                                    //commentOnPostApi();
                                  }
                                }
                              },
                              child: Text(
                                isReplyComment
                                    ? StringHelper.reply_caps
                                    : StringHelper.publish,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color:
                                  ColorsHelper.themeBlackColor(), //353A50
                                  fontSize: 12.0,
                                  //fontFamily: FontsHelper.fonts_medium
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
//                ClipRect(
//                  child: BackdropFilter(
//                    filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
//                    child: Material(
//                      color: Colors.white.withOpacity(0.8),
//                      child: Container(
//                        decoration:BoxDecoration(
//                            border: Border(
//                                top: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
//                              right: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
//                              left: BorderSide(color: ColorsHelper.themeBlackColor(),width: 0.5),
//                            )
//                        ),
//                        height: 66,
//                        child: Padding(
//                          padding:
//                              const EdgeInsets.only(left: 20, right: 20),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Flexible(
//                                child: Padding(
//                                  padding: const EdgeInsets.only(right: 10,top: 0),
//                                  child: TextField(
//                                    textInputAction: TextInputAction.done,
//                                    textAlignVertical: TextAlignVertical.top,
//                                    controller: controller,
//                                    focusNode: myFocusNode,
//                                    cursorColor: ColorsHelper.grey71TextColor(),
//                                    textCapitalization:
//                                        TextCapitalization.sentences,
//                                    style: TextStyle(
//                                        color: ColorsHelper.grey71TextColor(),
//                                        fontSize: 12.0,
//                                        //ontFamily: FontsHelper.fonts_medium
//                                    ),
//                                    decoration: InputDecoration(
//                                      border: InputBorder.none,
//                                      hintText: isReplyComment
//                                          ? StringHelper.reply_on_the_comment
//                                          : StringHelper.comment_on_the_post,
//                                      contentPadding: EdgeInsets.only(bottom: 16),
//                                    ),
//                                    onSubmitted: (String comment) {
//                                      commentOnPost = comment;
//                                      if (isReplyComment) {
//                                        isReplyComment = false;
//                                        setState(() {});
//                                      }
//                                    },
//                                    onChanged: (String comment) {
//                                      commentOnPost = comment;
//                                    },
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(top: 11),
//                                child: InkWell(
//                                  onTap: () {
//                                    if (commentOnPost != null ||
//                                        commentOnPost.length != 0) {
//                                      if (isReplyComment) {
//                                        //replyOnCommentApi();
//                                      } else {
//                                        //commentOnPostApi();
//                                      }
//                                    }
//                                  },
//                                  child: Text(
//                                    isReplyComment
//                                        ? StringHelper.reply_caps
//                                        : StringHelper.publish,
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                        color:
//                                            ColorsHelper.themeBlackColor(), //353A50
//                                        fontSize: 12.0,
//                                        //fontFamily: FontsHelper.fonts_medium
//                                    ),
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCommentListView(BuildContext context, int index) {
    return InkWell(
        onTap: () {},
        child: CommentListView(
          //commentsData: communityDetailData.comments[index],
          index: index,
          //postId: communityDetailData.id,
          //roleId: roleId,
          isLogin: widget.isLogin,
          btnLikeClicked: () {
            //likeOnCommentApi(communityDetailData.comments[index]);
          },
          btnCommentClicked: () {
            isReplyComment = true;
            setState(() {});
            commentIndexForReply = index;
            FocusScope.of(context).requestFocus(myFocusNode);
          },
        ));
  }

  displayDialog() {
    showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return MoreOptionsAlertView(
            communityDetailData: communityDetailData,
            roleId: roleId,
          );
        });
  }

  void getCommunityDetailsApi(BuildContext context, int communityID) async {
    //http://belletalk.concetto-project-progress.com/api/auth/community/detail?community_id=2

    String apiUrl;
    bool isLogin =
        await SharePreferencesHelper().getBool(SharePreferencesHelper.Is_Login);

    if (isLogin) {
      apiUrl = 'auth/community/detail?community_id=$communityID';
    } else {
      apiUrl = 'community/detail?community_id=$communityID';
    }

    WidgetHelper.progressBarShow(context: context, isDismissible: true);
    var request = new http.MultipartRequest(
        "GET", Uri.parse('${Constants.baseUri}$apiUrl'));
    Map<String, String> header = {};
    final String autoToken = await SharePreferencesHelper()
        .getAccessToken(SharePreferencesHelper.Access_Token);

    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/vnd.belletalk.v1+json';
    if (isLogin) {
      header['Authorization'] = 'Bearer $autoToken';
    }
//    Map<String, String> headers = {
//      "Accept": "application/vnd.belletalk.v1+json",
//      "Content-Type": "application/x-www-form-urlencoded"
//    };
    request.headers.addAll(header);
    http.Response response =
        await http.Response.fromStream(await request.send());
    Navigator.of(context).pop();
    final Map parsed = json.decode(response.body);
    final responseCommunity = CommunityDetailResponse.fromJson(parsed);
    if (response.statusCode == 200) {
      communityDetailData = responseCommunity.data;
      setState(() {});
    } else if (response.statusCode == 401) {
      Utility.showAlertDialogCallBack(
          context: context,
          message: responseCommunity.message,
          isConfirmationDialog: true,
          onOkClick: () {
            Utility.gotoLoginScreen(context);
          });
    } else {
      Utility.showAlertDialogCallBack(
          context: context, message: responseCommunity.message);
    }
  }

  getRoleId() async {
    String data = await SharePreferencesHelper()
        .getString(SharePreferencesHelper.User_Data);
    UserData userData = UserData.fromJson(jsonDecode(data));
    setState(() {
      roleId = userData.user.roles[0].roleId;
    });
  }

//  void commentOnPostApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .commentOnPostRequest(context,communityDetailData.id.toString(),'3',roleId,commentOnPost);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//      commentOnPost = null;
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void replyOnCommentApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .replyOnCommentRequest(context,communityDetailData.comments[commentIndexForReply].id,roleId,commentOnPost);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//      commentOnPost = null;
//      isReplyComment = false;
//      setState(() {});
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void likeOnPostApi() async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .likeOnPostRequest(context,communityDetailData.id.toString(),'3',roleId,communityDetailData.userIsLike==1?0:1);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void likeOnCommentApi(CommunityCommentsData commentsData) async {
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .likeOnCommentRequest(context,commentsData.id,roleId,commentsData.userCommentLike==1?0:1);
//    if (_response.statusCode==200) {
//      getCommunityDetailsApi(context, widget.communityId);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

}
