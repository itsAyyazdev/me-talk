import 'package:flutter/material.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/home_page/mapview_screen.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class AddressSearchScreen extends StatefulWidget {
  @override
  _AddressSearchScreenState createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: Image.asset(
              ImageAssets.close_dialog,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Text(
                  StringHelper.text_address_road,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: WidgetHelper.customBoxDecorationWithOutShadow(
                          Colors.black.withOpacity(0.05),
                          Colors.black12,
                          0.5,
                          0),
                      width: MediaQuery.of(context).size.width - 100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextField(
                          textInputAction: TextInputAction.done,
                          //textAlign: TextAlign.center,
                          controller: controller,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                          onSubmitted: (String searchWord) {
                            print("$searchWord");
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration:
                            WidgetHelper.customBoxDecorationWithOutShadow(
                                Colors.white, Colors.black12, 1, 0),
                        width: 45,
                        height: 45,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              print("===search====");
                            },
                            child: Image.asset(
                              ImageAssets.search,
                              width: 25.0,
                              height: 25.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: WidgetHelper.customBoxDecorationWithOutShadow(
                    Colors.white, Colors.black12, 1, 0),
                width: MediaQuery.of(context).size.width - 40,
                height: 45,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      print("current location");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapViewScreen()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          ImageAssets.position,
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          StringHelper.present_position,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
