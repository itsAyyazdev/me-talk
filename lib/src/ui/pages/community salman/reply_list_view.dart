
import 'package:flutter/material.dart';
import 'package:me_talk/src/models/Imported/data/reply_list_data.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class ReplyListView extends StatefulWidget {

  ReplyListData replyData;
  int index;
  bool isLogin;
  ReplyListView({Key key, this.replyData,this.index,this.isLogin}) : super(key: key);


  @override
  _ReplyListViewState createState() => _ReplyListViewState();
}

class _ReplyListViewState extends State<ReplyListView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius:15,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: widget.replyData==null?AssetImage(ImageAssets.user_default):(widget.replyData.avatar==''||widget.replyData.avatar==null)?AssetImage(ImageAssets.user_default):NetworkImage(widget.replyData.avatar)
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              widget.replyData==null?'':widget.replyData.name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                widget.replyData==null?'':widget.replyData.timeDifference,
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
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Text(
                            widget.replyData==null?'':widget.replyData.reply,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              color: Colors.black87,
              height: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
