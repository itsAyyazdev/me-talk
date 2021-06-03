import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_shop_profile/bloc.dart';
import 'package:me_talk/src/blocs/bloc_shop_profile/shop_profile_bloc.dart';
import 'package:me_talk/src/blocs/bloc_shop_profile/shop_profile_event.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:vibrate/vibrate.dart';

class UpdateShopProfile extends StatefulWidget {
  final int subCatProfileId;
  static const String routeName = "UpdateShopProfile";
  UpdateShopProfile({Key key, this.subCatProfileId}) : super(key: key);

  @override
  _UpdateShopProfileState createState() => _UpdateShopProfileState();
}

class _UpdateShopProfileState extends State<UpdateShopProfile> {
  ShopProfileBloc shopProfileBloc = ShopProfileBloc();
  ShopDetailsBeansData shopDetailsBeansData = ShopDetailsBeansData();

  final formKey = GlobalKey<FormState>();

  TextEditingController activateNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController specialOfController = TextEditingController();
  FocusNode fnodeActivateName = FocusNode();
  FocusNode fnodeShopName = FocusNode();
  FocusNode fnodeSpecialOf = FocusNode();

  File thumbnailPic;
  List<File> mainPhotoListPic;

  bool isYes = false,
      isNo = false,
      isdataLoaded = false,
      uploadThumnail = false;

  int discount = 0, count;

  List<int> deleteIds = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      getshopDetailsBeansData(context).then((onValue) {
        setState(() {});
      });
    });
  }

  Future getshopDetailsBeansData(BuildContext contextx) async {
    await shopProfileBloc
        .getShopCategoryDetails(contextx, widget.subCatProfileId)
        .then((onValue) {
      shopDetailsBeansData = onValue;
      activateNameController.text = shopDetailsBeansData.activeName;
      shopNameController.text = shopDetailsBeansData.shopName;
      specialOfController.text = shopDetailsBeansData.specialtyOf;
      count = shopDetailsBeansData.slider.length;
      if (shopDetailsBeansData.discountIntension == 1) {
        isYes = true;
      } else {
        isNo = true;
      }
      isdataLoaded = true;
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
        bottom: true,
        child: Scaffold(
            backgroundColor: ColorsHelper.whiteColor(),
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
              title: Text(
                StringHelper.profile_photo,
                style: TextStyle(fontSize: 14,
                   // fontWeight: FontWeight.bold
                ),
              ),
              centerTitle: true,
              actions: <Widget>[
                //publish button
                Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if (isYes) {
                        discount = 1;
                      }
                      AppNavigator.popBackStack(context);
                      // shopProfileBloc.updateCategoryDetails(
                      //     context,
                      //     widget.subCatProfileId,
                      //     thumbnailPic,
                      //     null,
                      //     null,
                      //     null,
                      //     null,
                      //     mainPhotoListPic,
                      //     discount,
                      //     activateNameController.text,
                      //     shopNameController.text,
                      //     specialOfController.text,
                      //     deleteIds);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          right: 5, top: 15, bottom: 15, left: 5),
                      child: Text(
                        StringHelper.publish,
                        style: TextStyle(
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                            color: ColorsHelper.themeBlackColor()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //body
            body: BlocProvider(
              create: (BuildContext context) => shopProfileBloc,
              child: BlocBuilder(
                bloc: shopProfileBloc,
                builder: (BuildContext context, ShopProfileState state) {
                  if (state is InitialShopProfileState) {
                    return updateShopBody();
                  } else {
                    return Container(
                      color: Colors.black,
                    );
                  }
                },
              ),
            )),
      ),
    );
  }

  Widget updateShopBody() {
    return isdataLoaded
        ? Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //thumnail
                  Text(
                    StringHelper.thumnail,
                    style: TextStyle(
                        color: ColorsHelper.darkGrayColor(),
                       // fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //thumnail image
                  shopDetailsBeansData.thumbnail == "" || uploadThumnail
                      ? addItems(1, shopProfileBloc.thumnailhere)
                      : Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.height * 0.18,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: Color(0xffE1E1E2)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Image.network(
                                        shopDetailsBeansData.thumbnail,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )),
                                  IconButton(
                                    alignment: Alignment.topLeft,
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        uploadThumnail = true;
                                      });
                                    },
                                  ),
                                ],
                              )),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    //main_photo_text
                    StringHelper.main_photo_text,
                    style: TextStyle(
                        color: ColorsHelper.darkGrayColor(),
                        //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  uploadPicsBody(),
                  SizedBox(
                    height: 10,
                  ),
                  //connect_instagram
                  ButtonColor(
                    width: MediaQuery.of(context).size.width * .7,
                    radius: 7,
                    color: ColorsHelper.themeBlackColor(),
                    child: Text(StringHelper.connect_instagram,
                        style: TextStyle(
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            fontSize: 14,
                            color: ColorsHelper.whiteColor())),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //address_information
                  ButtonColor(
                    onPressed: () {
                      Vibrate.feedback(FeedbackType.light);
                      AppNavigator.launchPostAddressPick(
                        context,
                        widget.subCatProfileId,
                      );
                    },
                    width: MediaQuery.of(context).size.width * .7,
                    radius: 7,
                    color: ColorsHelper.themeBlackColor(),
                    child: Text(StringHelper.address_information,
                        style: TextStyle(
                            //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            fontSize: 14,
                            color: ColorsHelper.whiteColor())),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Discount
                  Text(
                    StringHelper.do_you_have,
                    style: TextStyle(
                        color: ColorsHelper.themeBlackColor(),
                        //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //yes and no button
                  Row(
                    children: <Widget>[
                      //yes
                      isYes
                          ? ButtonColor(
                              height: 50,
                              width: 100,
                              radius: 25,
                              color: ColorsHelper.themeBlackColor(),
                              child: Text(StringHelper.yes.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      //fontFamily: 'Poppins SemiBold'
                                    )
                              ),
                              onPressed: () {
                                Vibrate.feedback(FeedbackType.light);
                                setState(() {
                                  isYes = !isYes;
                                });
                              },
                            )
                          : ButtonBlackBroder(
                              onPressed: () {
                                Vibrate.feedback(FeedbackType.light);
                                setState(() {
                                  isYes = !isYes;
                                  isNo = false;
                                });
                              },
                              height: 50,
                              width: 100,
                              radius: 25,
                              child: Text(
                                StringHelper.yes.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorsHelper.themeBlackColor(),
                                   // fontFamily: 'Poppins SemiBold'
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15.0,
                      ),
                      //No
                      isNo
                          ? ButtonColor(
                              height: 50,
                              width: 100,
                              radius: 25,
                              color: ColorsHelper.themeBlackColor(),
                              child: Text(StringHelper.no.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      //fontFamily: 'Poppins SemiBold'
                                  )),
                              onPressed: () {
                                Vibrate.feedback(FeedbackType.light);
                                setState(() {
                                  isNo = !isNo;
                                });
                              },
                            )
                          : ButtonBlackBroder(
                              onPressed: () {
                                Vibrate.feedback(FeedbackType.light);
                                setState(() {
                                  isNo = !isNo;
                                  isYes = false;
                                });
                              },
                              height: 50,
                              width: 100,
                              radius: 25,
                              child: Text(
                                StringHelper.no.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorsHelper.themeBlackColor(),
                                    //fontFamily: 'Poppins SemiBold'
                                ),
                              ),
                            ),
                    ],
                  ),
                  shopForm()
                ],
              ),
            ),
          )
        : Center(child: Container());
  }

  Widget shopForm() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 5, right: 20),
        child: Form(
          key: formKey,
          autovalidate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Activate name
              nameFeild(
                  StringHelper.activate_name,
                  StringHelper.main_name,
                  fnodeActivateName,
                  null,
                  //fnodeShopName,
                  activateNameController,
                  TextInputType.text,
                  TextInputAction.done,
                  null),
              //shop name
              nameFeild(
                  StringHelper.shop_name,
                  StringHelper.not_essential,
                  fnodeShopName,
                  null,
                  //   fnodeSpecialOf,
                  shopNameController,
                  TextInputType.text,
                  TextInputAction.done,
                  null),
              //Speacialty of
              nameFeild(
                  StringHelper.special_of,
                  StringHelper.not_essential,
                  fnodeSpecialOf,
                  null,
                  specialOfController,
                  TextInputType.text,
                  TextInputAction.done,
                  null),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameFeild(
      String heading,
      String subHeading,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController controller,
      TextInputType textInputType,
      TextInputAction textInputAction,
      String validation(String val)) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 5),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: heading,
                  style: TextStyle(
                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                      color: ColorsHelper.darkGrayColor())),
              TextSpan(
                  text: " ($subHeading)",
                  style: TextStyle(
                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                      color: ColorsHelper.darkGrayColor()))
            ]))),
        SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                blurRadius: 6,
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: TextFormField(
            focusNode: focusNode,
            onFieldSubmitted: (str) => nextFocusNode != null
                ? FocusScope.of(context).requestFocus(nextFocusNode)
                : null,
            textCapitalization: TextCapitalization.sentences,
            validator: validation,
            // (value) {
            //   return CommonValidator.emptyValidation(value);
            // },
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.white),
          ),
        ),
        SizedBox(
          height: 9,
        ),
      ],
    );
  }

  Widget addItems(int number, var stream) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.height * 0.18,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.0,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Color(0xffE1E1E2)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      thumbnailPic = snapshot.data;
                    }
                    return snapshot.data == null
                        ? GestureDetector(
                            onTap: () {
                              Vibrate.feedback(FeedbackType.light);
                              shopProfileBloc.add(
                                  UploadImagesShopProfile(context, number));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : imageList(snapshot.data, number);
                  },
                ),
              )),
        )
      ],
    );
  }

  Widget uploadPicsBody() {
    return StreamBuilder(
      stream: shopProfileBloc.imageListshere,
      builder: (context, snapshot) {
        return GridView.builder(
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data != null
              ? snapshot.data.length + 1 + count
              : 1 + count,
          itemBuilder: (BuildContext context, int index) {
            if (snapshot.data != null) {
              mainPhotoListPic = snapshot.data;
            }
            return index < count
                ? Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.height * 0.18,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Color(0xffE1E1E2)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Image.network(
                                  shopDetailsBeansData.slider[index].imageUrl,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                )),
                            IconButton(
                              alignment: Alignment.topLeft,
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  count--;
                                  deleteIds.add(
                                      shopDetailsBeansData.slider[index].id);
                                  shopDetailsBeansData.slider.removeAt(index);
                                });
                              },
                            ),
                          ],
                        )),
                  )
                : showPortfolioPics(
                    snapshot.data != null ? snapshot.data.length + 1 : 1,
                    index - count,
                    snapshot.data != null
                        ? index - count != (snapshot.data.length)
                            ? snapshot.data[index - count]
                            : null
                        : null);
          },
        );
      },
    );
  }

  Widget showPortfolioPics(int itemCount, int index, var image) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: index != (itemCount - 1)
          ? Container(
              child: imageList(image, 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (itemCount <= 5) {
                      // shopProfileBloc.imagePicker(context, 2);
                      shopProfileBloc.add(UploadImagesShopProfile(context, 2));
                    } else {
                      PopupDialogs.displayMessageOnly(
                          context, "Max 5 pic can upload at a time");
                    }
                  });
                },
                icon: Icon(Icons.add),
              ),
            ),
    );
  }

  //Original code

  // Widget uploadPicsBody() {
  //   return StreamBuilder(
  //     stream: shopProfileBloc.imageListshere,
  //     builder: (context, snapshot) {
  //       return GridView.builder(
  //         padding: EdgeInsets.all(0),
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 3,
  //           mainAxisSpacing: 2,
  //           crossAxisSpacing: 1,
  //         ),
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         itemCount: snapshot.data != null ? snapshot.data.length + 1  : 1,
  //         itemBuilder: (BuildContext context, int index) {
  //           if (snapshot.data != null) {
  //             mainPhotoListPic = snapshot.data;
  //           }
  //           return showPortfolioPics(
  //               snapshot.data != null ? snapshot.data.length + 1 : 1,
  //               index,
  //               snapshot.data != null
  //                   ? index != (snapshot.data.length)
  //                       ? snapshot.data[index]
  //                       : null
  //                   : null);
  //         },
  //       );
  //     },
  //   );
  // }

  // Widget showPortfolioPics(int itemCount, int index, var image) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     elevation: 2,
  //     child: index != (itemCount - 1)
  //         ? Container(
  //             child: imageList(image, 2),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //             ),
  //           )
  //         : Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //             ),
  //             child: IconButton(
  //               onPressed: () {
  //                 setState(() {
  //                   if (itemCount <= 5) {
  //                     // shopProfileBloc.imagePicker(context, 2);
  //                     shopProfileBloc.add(UploadImagesShopProfile(context, 2));
  //                   } else {
  //                     PopupDialogs.displayMessageOnly(
  //                         context, "Max 5 pic can upload at a time");
  //                   }
  //                 });
  //               },
  //               icon: Icon(Icons.add),
  //             ),
  //           ),
  //   );
  // }

  Widget imageList(var image, int number) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: double.infinity,
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
            IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                shopProfileBloc.add(DeleteImages(image, number));
              },
            ),
          ],
        ));
  }
}
