import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_profile/bloc.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/profile/update_phoneno.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/open_camera.dart';
import 'package:me_talk/src/utils/popup_dialogs/change_password_popup.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = "EditProfile";
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();

  ProfileBloc profileBloc = ProfileBloc();
  bool isEdit = true, autovalidate = false;
  String userName, userPicture, userEmail, internationalPhoneNo;
  int phoneNo, phoneCode;
  File profilePic;
  TextEditingController userNameController = TextEditingController();

  FocusNode fnodeUserName = FocusNode();
  List<String> gender = ["MAN", "WOMAN", "OTHER"];
  List<String> language = ["English", "Koren"];
  String currentGender, currentlanguage;
  User userData;

  @override
  initState() {
    currentGender = gender[0];
    currentlanguage = language[0];
    super.initState();
    getUserData();
    profileBloc.isProfileUpdatedHere.listen((onData) {
      if (onData) {
        getUserData();
      }
    });
  }

  Future getUserData() async {
    String data = await SharePreferencesHelper()
        .getString(SharePreferencesHelper.User_Data);
    userData = LoginData.fromJson(jsonDecode(data)).user;

    userName = userData.username;
    userPicture = userData.avatar;
    userEmail = userData.email;
    phoneNo = int.parse(userData.phone);
    phoneCode = int.parse(userData.phoneCode);
    currentGender = gender[int.parse(userData.gender)] ?? gender[0];
//    currentlanguage = userData.phone;
    internationalPhoneNo = "+${phoneCode ?? 1}${phoneNo ?? 1234567890}";
    userNameController.text = userName ?? "userName";

    setState(() {});

//    userName = await SharePreferencesHelper.getInstant()
//        .getString(SharePreferencesHelper.User_Name);
//    userPicture = await SharePreferencesHelper.getInstant()
//        .getString(SharePreferencesHelper.Avatar);
//    userEmail = await SharePreferencesHelper.getInstant()
//        .getString(SharePreferencesHelper.User_Email);
//    phoneNo = await SharePreferencesHelper.getInstant()
//        .getInt(SharePreferencesHelper.Phone_No);
//    phoneCode = await SharePreferencesHelper.getInstant()
//        .getInt(SharePreferencesHelper.Phone_Code);
//    currentGender = gender[await SharePreferencesHelper.getInstant()
//            .getInt(SharePreferencesHelper.Gender) ??
//        0];
//    currentlanguage = language[await SharePreferencesHelper.getInstant()
//            .getInt(SharePreferencesHelper.Language) ??
//        0];
//    internationalPhoneNo = "+${phoneCode ?? 1}${phoneNo ?? 1234567890}";
//    setState(() {
//      userNameController.text = userName ?? "userName";
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.themeBlackColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
              backgroundColor: ColorsHelper.whiteColor(),
              body: BlocProvider(
                create: (BuildContext context) => profileBloc,
                child: BlocBuilder(
                  bloc: profileBloc,
                  builder: (BuildContext context, ProfileState state) {
                    if (state is InitialProfileState) {
                      return editProfileBody();
                    } else {
                      return Container(
                        color: Colors.black,
                      );
                    }
                  },
                ),
              ),
              bottomNavigationBar: Container(
                color: ColorsHelper.themeBlackColor(),
                height: MediaQuery.of(context).size.height*.1,

                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Vibrate.feedback(FeedbackType.light);
                      setState(() {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          profileBloc.updateProfile(
                              context,
                              userName,
                              profilePic,
                              currentGender,
                              int.parse(internationalPhoneNo),
                              userEmail);
                          //Navigator.of(context).pop();
                        } else {
                          autovalidate = true;
                        }
                      });
                      Vibrate.feedback(FeedbackType.light);
                      Navigator.of(context).pop();

                    },
                    child: Container(
                     alignment:Alignment.topCenter,
                      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.02),
                      child: Text(
                        StringHelper.save,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            //fontWeight: FontWeight.bold,
                           // fontWeight: FontWeight.w700,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget editProfileBody() {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          //App bar
          SliverAppBar(
            elevation: 5,
            backgroundColor: ColorsHelper.whiteColor(),
            centerTitle: true,
            title: Text(
              StringHelper.user_page,
              style: TextStyle(
                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                  fontSize: 15),
            ),
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
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                child: InkWell(
                  child: Image.asset(
                    ImageAssets.notification,
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.contain,
                  ),
                  onTap: () {
                    Vibrate.feedback(FeedbackType.light);
                  },
                ),
              ),
            ],
            expandedHeight: 400.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .38,
                  ),
                  //Profile Pic
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: ColorsHelper.grayColor(), width: 1)),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      width: 110,
                      height: 110,
                      child: InkWell(
                        onTap: () {},
                        child: Material(
                          child: profilePic == null
                              ? CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  placeholder: (context, url) => Container(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black,
                                      ),
                                    ),
                                    width: 110.0,
                                    height: 110.0,
                                    padding: EdgeInsets.all(40.0),
                                  ),
                                  imageUrl: userPicture != null
                                      ? userPicture
                                      : StringHelper.default_Avatar,
                                  width: 110.0,
                                  height: 110.0,
                                  fit: BoxFit.cover,
                                )
                              : CircleAvatar(
                                  radius: 55,
                                  child: Container(
                                    width: 110.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      //border: Border.all(width: 3, color: Colors.black12),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: profilePic == null
                                              ? Image.network(
                                                  StringHelper.default_Avatar)
                                              : FileImage(profilePic)),
                                    ),
                                  ),
                                ),
                          borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          clipBehavior: Clip.antiAlias,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Edit images
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonColor(
                          blurRadius: 5,
                          height: 30,
                          radius: 25,
                          width: 120,
                          color: ColorsHelper.lightGreenColor(),
                          onPressed: () {
                            Vibrate.feedback(FeedbackType.light);
                            OpenCamera.init(
                              context: context,
                              getImage: (file) {
                                profilePic = file;
                                userPicture = file.path;
                                setState(() {});
                                return;
                              },
                            );
//                            profileBloc.imagePicker(context);
                          },
                          child: Text(
                            StringHelper.edit_image,
                            style: TextStyle(
                                color: ColorsHelper.whiteColor(),
                                fontSize: 15,
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  //user email
                  Container(
                    child: Text(
                      userEmail != null
                          ? userEmail
                          : "gwb9160@nate.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //change password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonBlackBroder(
                        blurRadius: 3,
                        broderWidth: 1,
                        height: 35,
                        width: 200,
                        radius: 20,
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                          ChangePasswordPopupDialog.changePasswordPopup(
                              context, userEmail ?? "gwb9160@nate.com");
                        },
                        child: Text(
                          StringHelper.change_password,
                          style: TextStyle(
                              fontSize: 15,
                              //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              //username
              editRowHelper(StringHelper.user_name, userName ?? "userName", 1),
              SizedBox(
                height: 27,
              ),
              //phone
              GestureDetector(
                onTap: () {
                  Vibrate.feedback(FeedbackType.light);
                  //  AppNavigator.launchUpdatePhoneNo(context);
                  Navigator.pushNamed(context, UpdatePhoneNo.routeName)
                      .then((onValue) async {
                    String test1 = await SharePreferencesHelper.getInstant()
                        .getString("editedMobileCode");
                    String test2 = await SharePreferencesHelper.getInstant()
                        .getString("editedMobileNumber");
                    internationalPhoneNo = "+$test2$test1";
                    setState(() {
//                      getUserData();
                    });
                  });
                },
                child: rowHelper(
                    StringHelper.phone, internationalPhoneNo ?? "1234567890"),
              ),
              SizedBox(
                height: 10,
              ),
              //Gender
              rowHelperDropDown(StringHelper.gender, gender, 1),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget rowHelper(String feild, String data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 90,
            child: Text(
              feild,
              style: TextStyle(
                  fontSize: 16,
                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                data ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 1,
                color: ColorsHelper.grayColor(),
                width: double.infinity,
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget rowHelperDropDown(String feild, List<String> list, int number) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 90,
            child: Text(
              feild,
              style: TextStyle(
                  fontSize: 16,
                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Flexible(
              child: DropdownButton<String>(
            underline: Container(
              margin: EdgeInsets.only(top: 5),
              height: 1,
              color: ColorsHelper.grayColor(),
              width: double.infinity,
            ),
            isExpanded: true,
            iconEnabledColor: ColorsHelper.themeBlackColor(),
            items: list.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorsHelper.themeBlackColor(),
                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                  ),
                ),
              );
            }).toList(),
            onChanged: (String newValueSelected) {
              switch (number) {
                case 1:
                  setState(() {
                    currentGender = newValueSelected;
                    // profileBloc.updateGender(
                    //     context, gender.indexOf(currentGender));
                  });
                  break;
                case 2:
                  setState(() {
                    currentlanguage = newValueSelected;
                    profileBloc.updatelanguage(
                        context, language.indexOf(currentlanguage));
                  });
                  break;
                default:
              }
            },
            value: number == 1 ? currentGender : currentlanguage,
          )),
        ],
      ),
    );
  }

  Widget editRowHelper(String feild, String data, int number) {
    //number = 1 for username
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 90,
            child: Text(
              feild,
              style: TextStyle(
                  fontSize: 16,
                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Flexible(
            child: Form(
              key: formKey,
              autovalidate: autovalidate,
              child: commonTextFormField(
                  hint: data,
                  imageAssets: null,
                  validation: CommonValidator.emptyValidation,
                  controller: userNameController,
                  textCapitalization: TextCapitalization.none,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  focusNode: fnodeUserName,
                  nextFocusNode: null,
                  maxLength: 30,
                  save: (String value) {
                    switch (number) {
                      case 1:
                        return userName = value;
                        break;
                      default:
                        return null;
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget commonTextFormField(
      {String hint,
      String imageAssets,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      int maxLength = 100,
      obscureText = false,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction textInputAction,
      String save(String val)}) {
    return TextFormField(
      scrollPadding: EdgeInsets.all(0),
      //initialValue: userName,
      textAlign: TextAlign.center,
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      controller: controller,
      keyboardType: textInputType,
      validator: validation,
      cursorColor: ColorsHelper.themeBlackColor(),
      style: TextStyle(
          color: ColorsHelper.themeBlackColor(),
          fontSize: 16.0,
          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
      ),
      obscureText: obscureText,
      onSaved: save,
      focusNode: focusNode,
      onFieldSubmitted: (str) => nextFocusNode != null
          ? FocusScope.of(context).requestFocus(nextFocusNode)
          : null,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsHelper.themeBlackColor()),
        ),
        hintText: hint,
        hintStyle:
            TextStyle(color: ColorsHelper.txtHintEditText(), fontSize: 16),
      ),
    );
  }
}
