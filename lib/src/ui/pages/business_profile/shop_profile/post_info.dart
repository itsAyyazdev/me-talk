import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/blocs/bloc_post_info/bloc.dart';
import 'package:me_talk/src/models/postinfobeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:vibrate/vibrate.dart';

class PostInfo extends StatefulWidget {
  final int postId;
  static const String routeName = "postInfo";

  const PostInfo({Key key, this.postId}) : super(key: key);
  @override
  _PostInfoState createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  PostInfoBloc postInfoBloc = PostInfoBloc();
  PostInfoBeansData postInfo;
  bool isDataLoaded = false;
  @override
  initState() {
    super.initState();
    postInfoBloc.getPostInfo(context, widget.postId).then((onValue) {
      setState(() {
        if (onValue != null) {
          postInfo = onValue;
          isDataLoaded = true;
          print(onValue);
        } else {}
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: false,
            child: Scaffold(
              appBar: AppBar(
                elevation: 6,
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
                title: Container(
                  height: MediaQuery.of(context).size.height * 0.128,
                  width: MediaQuery.of(context).size.height * 0.128,
                  child: FlareActor(
                    'assets/logo_chactor.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    animation: "Logo",
                    //controller: controls,
                  ),
                ),
                centerTitle: true,
                actions: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Icon(
                        FontAwesomeIcons.shareAlt,
                        color: ColorsHelper.themeBlackColor(),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              body: BlocProvider(
                create: (BuildContext context) => postInfoBloc,
                child: BlocBuilder(
                  bloc: postInfoBloc,
                  builder: (BuildContext context, PostInfoState state) {
                    if (state is InitialPostInfoState) {
                      return postInfoBody();
                    } else {
                      return Container(
                        color: Colors.black,
                      );
                    }
                  },
                ),
              ),
            )));
  }

  Widget postInfoBody() {
    return isDataLoaded
        ? Container(
            child: Center(
              child: Stack(children: <Widget>[
                Column(
                  children: <Widget>[
                    //galary
                    Container(
                      height: MediaQuery.of(context).size.height * 0.46,
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.black,
                            ),
                          ),
                          width: 120.0,
                          height: 120.0,
                          padding: EdgeInsets.all(60.0),
                        ),
                        imageUrl: postInfo.imageUrl != null
                            ? postInfo.imageUrl
                            : StringHelper.default_Avatar,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //text
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment:
                        //     MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            postInfo.activeName,
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            postInfo.city ?? "City Area",
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            postInfo.shopName ?? "shop name",
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            postInfo.specialtyOf ?? "speciality of",
                            style: TextStyle(
                                color: ColorsHelper.themeColor(),
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //views discounts
                    Container(
                      // height:
                      //     MediaQuery.of(context).size.height * 0.069,
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            width: .5, color: ColorsHelper.themeBlackColor()),
                        bottom: BorderSide(
                            width: .5, color: ColorsHelper.themeBlackColor()),
                      )),
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 0.8,color: ColorsHelper.grayColor())
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            ImageAssets.view_icon,
                          ),
                          Text(
                            postInfo.view.toString() ?? "12",
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 13),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 35,
                            child: Image.asset(
                              ImageAssets.watch_icon,
                              width: 35,
                            ),
                          ),
                          Text(
                            postInfo.gallaryCreated.split(" ")[0] ??
                                "2019.06.20",
                            style: TextStyle(
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                                fontSize: 13),
                          ),
                          postInfo.discount == 1
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    ImageAssets.discount_review,
                                  ))
                              : Container(),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                //
                //User image
                Positioned(
                    top: MediaQuery.of(context).size.height / 2.33,
                    left: 35,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.height / 10,
                      //smargin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 10,
                        backgroundImage: NetworkImage(postInfo.thumbnail),
                      ),
                    )),
                //
                //button to delete post
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonColor(
                      onPressed: () {
                        Vibrate.feedback(FeedbackType.light);
                        // Navigator.of(context).push(PageRouteBuilder(
                        //     opaque: false,
                        //     pageBuilder: (BuildContext context, _, __) {
                        //       return ConfirmDeletePostPopup.openPopup(
                        //           context, widget.postId);
                        //     }));
                      },
                      color: ColorsHelper.themeBlackColor(),
                      width: MediaQuery.of(context).size.width,
                      child: Text(StringHelper.delete_post,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                    ),
                  ),
                )
              ]),
            ),
          )
        : Center(
            child: SpinKitCircle(
              color: ColorsHelper.themeBlackColor(),
              size: 50.0,
            ),
          );
  }
}
