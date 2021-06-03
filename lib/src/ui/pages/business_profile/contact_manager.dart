import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/popup_dialogs/contact_manager_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:vibrate/vibrate.dart';

class ContactManager extends StatefulWidget {
  static const String routeName = "ContactManager";

  ContactManager({Key key}) : super(key: key);

  @override
  _ContactManagerState createState() => _ContactManagerState();
}

class _ContactManagerState extends State<ContactManager> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  String category = StringHelper.select_category;
  TextEditingController description = TextEditingController();

  @override
  void dispose() {
    businessProfileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
            color: ColorsHelper.themeBlackColor(),
            child: SafeArea(
              left: false,
              right: false,
              top: false,
              bottom: true,
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
                  title: Text(
                    StringHelper.contact_manager,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
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
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                body: BlocProvider(
                  create: (BuildContext context) => businessProfileBloc,
                  child: BlocBuilder(
                    bloc: businessProfileBloc,
                    builder:
                        (BuildContext context, BusinessProfileState state) {
                      if (state is InitialBusinessProfileState) {
                        return contactManagerBody();
                      } else {
                        return Container(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                ),

                //send button
                bottomNavigationBar: Container(
                  color: ColorsHelper.themeBlackColor(),
                  height: MediaQuery.of(context).size.height * .1,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Vibrate.feedback(FeedbackType.light);
                        if (category.contains(StringHelper.select_category))
                          PopupDialogs.displayMessageOnly(
                              context, StringHelper.category_not_selected);
                        else if (description.text.isEmpty)
                          PopupDialogs.displayMessageOnly(
                              context, StringHelper.description_not_filled);
                        else
                          AppNavigator.popBackStack(context);
                        // ContactManagerBloc.contactManager(
                        //     context, category, description.text);
                      },
                      child: Center(
                        child: Text(
                          StringHelper.send,
                          style: TextStyle(
                              color: Colors.white,
                              height: 0,
                              fontSize: 18,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget contactManagerBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //category button
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: ColorsHelper.themeBlackColor(),
              splashColor: Colors.white38,
              onPressed: getCategory,
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.72,
                  child: Center(
                      child: Text(
                    category,
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
            //text box
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  maxLines: 10,
                  controller: description,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.grey[100], width: 1.3)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.4))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getCategory() async {
    Vibrate.feedback(FeedbackType.light);
    String etc = await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return ContactManagerPopup.openPopup(context);
        }));
    if (etc == null) return;
    setState(() {
      category = etc;
    });
  }
}
