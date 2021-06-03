
import 'package:flutter/material.dart';
import 'package:me_talk/src/models/Imported/data/community_detail_data.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/community/report_alert_view.dart';
import 'package:me_talk/src/utils/utility.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';



class MoreOptionsAlertView extends StatefulWidget {

  final int roleId;
  final CommunityDetailData communityDetailData;
  const MoreOptionsAlertView({Key key, this.communityDetailData,this.roleId}) : super(key: key);

  @override
  _MoreOptionsAlertViewState createState() => _MoreOptionsAlertViewState();
}

class _MoreOptionsAlertViewState extends State<MoreOptionsAlertView> {

  TextEditingController controller;
  String commentOnPost;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60,right: 60,bottom: 50),
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: (){
                    //savePostApi(context);
                  },
                  child: Text(
                    StringHelper.str_save_caps,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                    Utility.shareLink(context, widget.communityDetailData.bitlyUrl);
                  },
                  child: Text(
                    StringHelper.str_share_caps,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                    displayDialog();
                  },
                  child: Text(
                    StringHelper.str_report_caps,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    StringHelper.str_cancel_caps,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayDialog() {
    showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ReportAlertView(postId: widget.communityDetailData.id,typeId: 3,roleId: widget.roleId,isCommentReport: false);
        });
  }


//  void savePostApi(BuildContext context) async{
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .savePostRequest(context,widget.communityDetailData.id,3,widget.roleId);
//    Navigator.of(context).pop();
//    if (_response.statusCode==200) {
//      Utility.showToast(context, _response.message);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

}
