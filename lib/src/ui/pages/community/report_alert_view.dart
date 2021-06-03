
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class ReportAlertView extends StatefulWidget {

  final int postId;
  final int typeId;
  final int  roleId;
  final bool  isCommentReport;

  const ReportAlertView({Key key, this.postId,this.typeId,this.roleId,this.isCommentReport}) : super(key: key);


  @override
  _ReportAlertViewState createState() => _ReportAlertViewState();
}

class _ReportAlertViewState extends State<ReportAlertView> {

  TextEditingController controller;
  String reportReason;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: controller,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringHelper.enter_the_report_reason,
                      ),
                      onSubmitted: (String comment){
                        reportReason = comment;
                      },
                      onChanged: (String comment){
                        reportReason = comment;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        StringHelper.str_cancel_caps,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: ColorsHelper.themeBlackColor(),
                            fontSize: 14.0,
                            //fontFamily: FontsHelper.fonts_medium
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        if(reportReason!=null||reportReason.length!=0){
                          if(widget.isCommentReport){
                            //reportOnCommentApi(context);
                          }else{
                            //reportOnPostApi(context);
                          }

                        }
                      },
                      child: Text(
                        StringHelper.str_report_caps,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: ColorsHelper.themeBlackColor(),
                            fontSize: 14.0,
                            //fontFamily: FontsHelper.fonts_medium
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
    );
  }

//  void reportOnPostApi(BuildContext context) async{
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .reportOnPostRequest(context,widget.postId,widget.typeId,widget.roleId,reportReason);
//
//    Navigator.of(context).pop();
//    if (_response.statusCode==200) {
//      Utility.showToast(context, _response.message);
//      reportReason = null;
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }
//
//  void reportOnCommentApi(BuildContext context) async{
//    BaseResponse _response = await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .reportOnCommentRequest(context,widget.postId,widget.roleId,reportReason);
//
//    Navigator.of(context).pop();
//    if (_response.statusCode==200) {
//      Utility.showToast(context, _response.message);
//      reportReason = null;
//      controller.clear();
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

}
