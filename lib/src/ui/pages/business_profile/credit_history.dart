import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:vibrate/vibrate.dart';

class CreditHistory extends StatefulWidget {
  static const String routeName = "CreditHistory";
  CreditHistory({Key key}) : super(key: key);

  @override
  _CreditHistoryState createState() => _CreditHistoryState();
}

class _CreditHistoryState extends State<CreditHistory> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
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
            color: ColorsHelper.whiteColor(),
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
                    StringHelper.HISTORY,
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
                        return creditHistoryBody();
                      } else {
                        return Container(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                ),
              ),
            )));
  }

  Widget creditHistoryBody() {
    return Center(
        child: Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.07,
            color: ColorsHelper.themeBlackColor(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  StringHelper.cpa_time,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 15,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                Text(
                  StringHelper.username,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 15,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                Text(
                  StringHelper.deduct,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 15,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
                Text(
                  StringHelper.balance,
                  style: TextStyle(
                      color: ColorsHelper.whiteColor(),
                      fontSize: 15,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
              ],
            )),
        Expanded(
          child: ListView.separated(
            itemCount: 7,
            itemBuilder: (context, index) => Container(
                height: MediaQuery.of(context).size.height * 0.07,
                //color: ColorsHelper.themeBlackColor(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "2019.06.20\n 20:11",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                    Text(
                      "user name",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                    Text(
                      "-1,000",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                    Text(
                      "1,520,000",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                    ),
                  ],
                )),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: ColorsHelper.grayColor(),
            ),
          ),
        )
      ],
    ));
  }
}
