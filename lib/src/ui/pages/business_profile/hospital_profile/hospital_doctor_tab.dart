import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';
import 'package:flutter/material.dart';

class HospitalDoctorTab extends StatefulWidget {
  @override
  _HospitalDoctorTabState createState() => _HospitalDoctorTabState();

}

class _HospitalDoctorTabState extends State<HospitalDoctorTab> {

  List<String> images = [
    'assets/images/Doctors/doctor1.png',
    'assets/images/Doctors/doctor2.png',
    'assets/images/Doctors/doctor3.png',
    'assets/images/Doctors/doctor4.png',
    'assets/images/Doctors/doctor5.png',
  ];

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
          padding: const EdgeInsets.only(top: 52,left: 31,right: 31,bottom: 80),
          child: Container(
            //color: Colors.white,
            decoration: WidgetHelper.customBoxDecorationWithShadow(Colors.white,Colors.black12,Colors.grey,1,10),
            child: Padding(
              padding: const EdgeInsets.only(top: 30,left: 28,right: 28,bottom: 30),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: images.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: getDoctorListView
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDoctorListView(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
          onTap: (){

          },
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsHelper.greyTextColor(),
                    width: 0.3
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                ),
                child: ClipRRect(
                  borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width/5.27,
                    height: MediaQuery.of(context).size.width/5.5,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Doctor name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                           //fontFamily: FontsHelper.fonts_HyGothic_regular
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Location. Review 231 Event 9',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 9.0,
                            //fontFamily: FontsHelper.fonts_HyGothic_regular
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}
