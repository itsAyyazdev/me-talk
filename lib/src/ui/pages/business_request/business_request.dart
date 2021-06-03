import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_request/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:vibrate/vibrate.dart';

class BusinessRequest extends StatefulWidget {
  static const String routeName = "BusinessRequest";
  BusinessRequest({Key key}) : super(key: key);

  @override
  _BusinessRequestState createState() => _BusinessRequestState();
}

class _BusinessRequestState extends State<BusinessRequest> {
  BusinessRequestBloc businessRequestBloc = BusinessRequestBloc();
  @override
  void dispose() {
    businessRequestBloc.close();
    super.dispose();
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
                // appBar: AppBar(
                //   elevation: 0,
                //   backgroundColor: ColorsHelper.themeBlackColor(),
                //   leading: IconButton(
                //     icon: Image.asset(
                //       ImageAssets.back,
                //       width: 20.0,
                //       height: 20.0,
                //       fit: BoxFit.contain,
                //     ),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ),
                backgroundColor: ColorsHelper.themeBlackColor(),
                body: BlocProvider(
                  create: (BuildContext context) => businessRequestBloc,
                  child: BlocBuilder(
                    bloc: businessRequestBloc,
                    builder:
                        (BuildContext context, BusinessRequestState state) {
                      if (state is InitialBusinessRequestState) {
                        return businessRequestBody();
                      } else {
                        return Container(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                ))));
  }

  Widget businessRequestBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //Text
        Container(
          child: Text(
            StringHelper.select_what_your_text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorsHelper.whiteColor(),
                fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                fontSize: 20),
          ),
        ),

        //buttons
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: <Widget>[
              //Normal(shop)
              Flexible(
                child: ButtonColor(
                  height: 100,
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    AppNavigator.launchShopRequest(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        StringHelper.normal,
                        style: TextStyle(
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            fontSize: 17),
                      ),
                      Image.asset(
                        ImageAssets.shop,
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  color: ColorsHelper.whiteColor(),
                  radius: 10,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              //Hospital
              Flexible(
                child: ButtonColor(
                  height: 100,
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    AppNavigator.launchHospitalRequest(context);
                    // AppNavigator.launchBusinessProfile(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        StringHelper.hospital,
                        style: TextStyle(
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                            fontSize: 17),
                      ),
                      Image.asset(
                        ImageAssets.hospital,
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  color: ColorsHelper.whiteColor(),
                  radius: 10,
                ),
              )
            ],
          ),
        ),
//Cancel Button
        ButtonColor(
          height: 60,
          width: 60,
          onPressed: () {
            Vibrate.feedback(FeedbackType.light);
            Navigator.pop(context);
          },
          color: ColorsHelper.whiteColor(),
          radius: 35,
          child: Icon(Icons.clear,
              size: 30, color: ColorsHelper.themeBlackColor()),
        ),
      ],
    );
  }
}
