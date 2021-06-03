import 'dart:convert';
import 'dart:io';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luban/flutter_luban.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_catgory_list_view.dart';
import 'package:me_talk/src/utils/bottom_sheet_trade_finder.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/utility.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibrate/vibrate.dart';

class AddCommunity extends StatefulWidget {



  @override
  _AddCommunityState createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {

  TextEditingController titleController,descriptionController;
  bool autoValidation,isImageSelected, isCategorySelected, isTalkSel,isSurgerySel,isAnonymitySel ;
  String title, description;
  final formKey = GlobalKey<FormState>();
  var imageSource;
  File selectedFilePath; //save the result of camera file

  int roleId,subCategoryId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoleId();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    autoValidation = isImageSelected = isCategorySelected = isTalkSel = isSurgerySel = isAnonymitySel = false;

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
            width: 19.0,
            height: 19.0,
            //color: ColorsHelper.themeColor(),
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Vibrate.feedback(FeedbackType.light);
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Container(
          //  margin: const EdgeInsets.only(top: 45, bottom: 15),
          width: MediaQuery.of(context).size.height *
              (Platform.isIOS ? 0.15 : 0.12),
          height: MediaQuery.of(context).size.height *
              (Platform.isIOS ? 0.10 : 0.15),
          child: FlareActor(
            'assets/logo_chactor.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: "Logo",
            //controller: controls,
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: (){
              onPublish();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                StringHelper.publish,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: ColorsHelper.themeBlackColor(),
                    fontSize: 13.0,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
            child: ScrollConfiguration(
              behavior: ListViewScrollBehavior(),
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Divider(
                    color: Color(0xffDEDEDE),
                    height: 0.5
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          StringHelper.str_category_caps,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    displayDialog('3');
                                    isTalkSel = true;
                                    isSurgerySel = false;
                                    isAnonymitySel = false;
                                  },
                                  child: Container(
                                     decoration:  isTalkSel ? BoxDecoration(
                                      color: ColorsHelper.themeBlackColor(),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ):null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3,bottom: 3,left: 10,right: 10),
                                      child: Text(
                                        StringHelper.talk_tab,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: isTalkSel ? Colors.white :Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0,right: 0),
                                  child: InkWell(
                                    onTap: (){
                                      displayDialog('4');
                                      isTalkSel = false;
                                      isSurgerySel = true;
                                      isAnonymitySel = false;
                                    },
                                    child: Container(
                                      decoration:  isSurgerySel ? BoxDecoration(
                                          color: ColorsHelper.themeBlackColor(),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ):null,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3,bottom: 3,left: 10,right: 10),
                                        child: Text(
                                          StringHelper.surgery_tab,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: isSurgerySel ? Colors.white :Colors.black,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    displayDialog('5');
                                    isTalkSel = false;
                                    isSurgerySel = false;
                                    isAnonymitySel = true;
                                  },
                                  child: Container(
                                    decoration:  isAnonymitySel ? BoxDecoration(
                                        color: ColorsHelper.themeBlackColor(),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ):null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3,bottom: 3,left: 10,right: 10),
                                      child: Text(
                                        StringHelper.anonymity_tab,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: isAnonymitySel ? Colors.white :Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
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
                  Divider(
                      color: Color(0xffDEDEDE),
                      height: 0.5
                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(top: 40,bottom: 40,left: 30,right: 30),
//                    child: Form(
//                        key: formKey,
//                        autovalidate: autoValidation,
//                        child: formField()),
//                  ),
//                  Visibility(
//                    visible: isImageSelected,
//                    child: Padding(
//                      padding: const EdgeInsets.only(bottom: 30,left: 30,right: 30),
//                      child: Container(
//                        height: 150,
//                        decoration: BoxDecoration(
//                          shape: BoxShape.rectangle,
//                          borderRadius: BorderRadius.all(Radius.circular(5)),
//                          image: DecorationImage(
//                              fit: BoxFit.cover,
//                              image: selectedFilePath == null
//                                  ? AssetImage(
//                                  ImageAssets.user_default)
//                                  : FileImage(selectedFilePath)
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:250.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 20),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: Image.asset(
                                  ImageAssets.cam_icon,
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.contain,
                                ),
                                onPressed: () {
                                  imagePicker(context);
                                },
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: Image.asset(
                                ImageAssets.menu_black,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.contain,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  bool validateData(){
    if (!isCategorySelected){
      Utility.showAlertDialogCallBack(
          context: context, message: StringHelper.error_select_category);
      return false;
    }

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }else{
      setState(() {
        autoValidation = true;
      });
      return false;
    }

    if (!isImageSelected){
      Utility.showAlertDialogCallBack(
          context: context, message: StringHelper.error_select_image);
      return false;
    }

    return true;
  }

  formField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetHelper.commonTextFormFieldWithoutImageOutLineBorder(
            hint: StringHelper.hint_title,
            validation: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_enter_title;
              } else{
                return null;
              }
            },
            controller: titleController,
            textCapitalization: TextCapitalization.sentences,
            textInputType: TextInputType.text,
            maxLine: 2,
            save: (String value) {
              return title = value;
            }),
        SizedBox(
          height: 15,
        ),
        WidgetHelper.commonTextFormFieldWithoutImageOutLineBorder(
            hint: StringHelper.hint_description,
            validation: (value) {
              if (value.isEmpty) {
                return StringHelper.error_msg_enter_description;
              } else{
                return null;
              }
            },
            controller: descriptionController,
            textCapitalization: TextCapitalization.sentences,
            textInputType: TextInputType.text,
            maxLine: 2,
            save: (String value) {
              return description = value;
            }),

      ],
    );
  }

  displayDialog(String typeId) async{
    int id=await showDialog<int>(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return ShopCategoryListAlertView(categoryTypeId: typeId,isAddPost: true,);
        });

    if(id!=null){
      subCategoryId = id;
      isCategorySelected = true;
      setState(() {});
      print(id);
    }
  }

  void imagePicker(BuildContext context) {
    showModalTradeFinderBottomSheet(
        context: context,
        builder: (builder) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        StringHelper.str_choose_from,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            //fontFamily: FontsHelper.fonts_bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.camera,
                        color: Colors.black,
                      ),
                      title: Text(
                        StringHelper.str_camera,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        _onCameraClick(context);
                      }),
                  ListTile(
                      leading: Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      title: Text(
                        StringHelper.str_gallery,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        _onGalleryClick(context);
                      }),
                ],
              ),
            ),
          );
        });
  }

  Future _onCameraClick(BuildContext context) async {
    imageSource = ImageSource.camera;
    Navigator.pop(context);
    try {
      var filePath = await ImagePicker.pickImage(source: imageSource);
      print("You selected camera image : " + filePath.path);
      setState(() {
        // Navigator.pop(context);
        isImageSelected = true;
        selectedFilePath = filePath;
      });

      final tempDir = await getTemporaryDirectory();

      CompressObject compressObject = CompressObject(
        imageFile: filePath,
        //image
        path: tempDir.path,
        //compress to path
        quality: 80,
        //first compress quality, default 80
        step: 6,
        //compress quality step, The bigger the fast, Smaller is more accurate, default 6
        mode: CompressMode.LARGE2SMALL, //default AUTO
      );
      Luban.compressImage(compressObject).then((_path) {
        setState(() {
          selectedFilePath = File(_path);
        });
      });
    } on Exception {}
  }

  Future _onGalleryClick(BuildContext context) async {
    imageSource = ImageSource.gallery;
    Navigator.pop(context);
    try {
      var filePath = await ImagePicker.pickImage(source: imageSource);
      print("You selected gallery image : " + filePath.path);

      setState(() {
        isImageSelected = true;
        selectedFilePath = filePath;
      });

      final tempDir = await getTemporaryDirectory();
      CompressObject compressObject = CompressObject(
        imageFile: filePath,
        //image
        path: tempDir.path,
        //compress to path
        quality: 80,
        //first compress quality, default 80
        step: 6,
        //compress quality step, The bigger the fast, Smaller is more accurate, default 6
        mode: CompressMode.LARGE2SMALL, //default AUTO
      );
      Luban.compressImage(compressObject).then((_path) {
        setState(() {
          selectedFilePath = File(_path);
        });
      });
    } on Exception {}
  }

  void onPublish() {
    if (validateData()){
      //postCommunityApi(context);
    }
  }

  getRoleId()async{
    String data = await SharePreferencesHelper()
        .getString(SharePreferencesHelper.User_Data);
    //UserData userData = UserData.fromJson(jsonDecode(data));
    setState(() {
      //roleId = userData.user.roles[0].roleId;
    });
  }

  int getCategoryId(){
    if(isTalkSel){
      return 3;
    }else if(isSurgerySel){
      return 4;
    }else{
      return 5;
    }
  }

//  void postCommunityApi(BuildContext context) async {
//
//    WidgetHelper.progressBarShow(context: context, isDismissible: true);
//
//    int categoryId =  getCategoryId();
//
//    var request = new http.MultipartRequest(
//        "POST", Uri.parse('${Constants.baseUri}add/community'));
//    request.fields['role_id']  = '$roleId' ;
//    request.fields['category_id'] = '$categoryId';
//    request.fields['sub_category_id'] = '$subCategoryId' ;
//    request.fields['title'] = title ;
//    request.fields['description'] = description;
//
//    if (selectedFilePath != null) {
//      // open a byteStream
//      var stream =
//      http.ByteStream(DelegatingStream.typed(selectedFilePath.openRead()));
//      // get file length
//      var length = await selectedFilePath.length();
//      // multipart that takes file
//      var multipartFile = new http.MultipartFile('image', stream, length,
//          filename: Path.basename(selectedFilePath.path));
//      request.files.add(multipartFile);
//    }
//
//    final String autoToken = await SharePreferencesHelper()
//        .getAccessToken(SharePreferencesHelper.ACCESS_TOKEN);
//
//    Map<String, String> headers = {
//      'Accept': 'application/vnd.belletalk.v1+json',
//      'Content-Type': 'application/json',
//      'Authorization': 'Bearer $autoToken',
//    };
//    request.headers.addAll(headers);
//
//    http.Response response = await http.Response.fromStream(await request.send());
//
//    final Map parsed = json.decode(response.body);
//    final baseResponse = BaseResponse.fromJson(parsed);
//
//    Navigator.of(context).pop();
//    if (response.statusCode == 200) {
//      Navigator.of(context).pop(categoryId);
//    }
//    else if (response.statusCode == 401) {
//      Utility.showAlertDialogCallBack(
//          context: context, message: baseResponse.message, isConfirmationDialog: true, onOkClick: (){Utility.gotoLoginScreen(context);}
//      );
//    }
//    else {
//      Utility.showAlertDialogCallBack(context: context, message: baseResponse.message);
//    }
//  }


}

