import 'package:flutter/material.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class HospitalInfoTab extends StatefulWidget {
  @override
  _HospitalInfoTabState createState() => _HospitalInfoTabState();
}

class _HospitalInfoTabState extends State<HospitalInfoTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 75),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: WidgetHelper.customBoxDecorationShadow(
                    Colors.white,
                    Colors.white,
                    Colors.black.withOpacity(0.16),
                    0,
                    15,
                    0,
                    5,
                    0,
                    1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25,bottom: 25,left: 21,right: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringHelper.hospital_introduce,
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        //maxLines: 1,
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black.withOpacity(0.16),
                            )
                          ],
                          color: Colors.black,
                          fontSize: 15.0,
                          //fontFamily: FontsHelper.fonts_bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectet ur adipiscing elit, sed do eiusmod tem por incididunt ut labore et dolore magna aliqua.\n\nUt enim ad minim veniam, quis nostrud exerc itation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in rep rehenderit i\n\nnvoluptate velit esse cillum dolor e eu fugiat nulla pariatur. Excepteur sin t occaecat cupidatat non proident, sunt in cul pa qui officia deserunt mollit anim id est laborum.',
                          textAlign: TextAlign.left,
                          //overflow: TextOverflow.ellipsis,
                          //maxLines: 1,
                          style: TextStyle(shadows: [
                            Shadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black.withOpacity(0.16),
                            )
                          ], color: Colors.black87, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 17,bottom: 17),
//                child: Container(
//                  width: MediaQuery.of(context).size.width-20,
//                  decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white,Colors.black12,Colors.grey,1,10),
//                  child: Padding(
//                    padding: const EdgeInsets.all(20),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          StringHelper.consultation_hours,
//                          textAlign: TextAlign.left,
//                          // overflow: TextOverflow.ellipsis,
//                          //maxLines: 1,
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 17.0,
//                              fontFamily: FontsHelper.fonts_bold
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 10),
//                          child: Text(
//                            'WEEK Day' +'  '+'10:00 ~ 19:00',
//                            textAlign: TextAlign.left,
//                            //overflow: TextOverflow.ellipsis,
//                            //maxLines: 1,
//                            style: TextStyle(
//                                color: Colors.black87,
//                                fontSize: 14.0
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 10),
//                          child: Text(
//                            'SATURDAY' +'  '+ '10:00 ~ 17:00',
//                            textAlign: TextAlign.left,
//                            //overflow: TextOverflow.ellipsis,
//                            //maxLines: 1,
//                            style: TextStyle(
//                                color: Colors.black87,
//                                fontSize: 14.0
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                width: MediaQuery.of(context).size.width-20,
//                decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white,Colors.black12,Colors.grey,1,10),
//                child: Padding(
//                  padding: const EdgeInsets.all(20),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        StringHelper.directions,
//                        textAlign: TextAlign.left,
//                        // overflow: TextOverflow.ellipsis,
//                        //maxLines: 1,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 17.0,
//                            fontFamily: FontsHelper.fonts_bold
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 10),
//                        child: Text(
//                          'South kore Gang nam gu 119-11',
//                          textAlign: TextAlign.left,
//                          //overflow: TextOverflow.ellipsis,
//                          //maxLines: 1,
//                          style: TextStyle(
//                              color: Colors.black87,
//                              fontSize: 14.0
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 17,bottom: 50),
//                child: Container(
//                    width: MediaQuery.of(context).size.width-20,
//                    height: 350,
//                    decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white,Colors.black12,Colors.grey,1,10),
//                    child: WidgetHelper.getMapFromLatLong(23.0225,72.5714,11),
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
