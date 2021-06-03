import 'package:flutter/material.dart';
import 'event_detail_screen.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';

import 'event_details_view.dart';



class EventListScreen extends StatefulWidget {

   bool isFromHomeTab = false;
   String eventCategory = '';

   EventListScreen(
      {Key key,
        this.isFromHomeTab,
        this.eventCategory,
        })
      : super(key: key);

  @override
  _EventListScreenState createState() => _EventListScreenState();

}

class _EventListScreenState extends State<EventListScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: getTitleWidget(),
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Image.asset(
            ImageAssets.back_arrow,
            width: 25.0,
            height: 25.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.isFromHomeTab?Text(''):InkWell(
                child: Image.asset(
                  ImageAssets.search,
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                },
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Image.asset(
                  ImageAssets.notification,
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                },
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Image.asset(
                  ImageAssets.user_nav,
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          onCellItemClick(index);
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 10, bottom: 10),
                            child: EventDetailsView()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCellItemClick(int index) async {
    print('Row $index');
    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }

  Widget getTopTitleWidget() {
    if (widget.isFromHomeTab){
      return Text(
        ''
      );
    }else{
      return Padding(
        padding: const EdgeInsets.only(top: 20,left: 20),
        child: Text(
          widget.eventCategory,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              //fontFamily: FontsHelper.fonts_regular
          ),
        ),
      );
    }
  }

   Widget getTitleWidget() {
     if (widget.isFromHomeTab){
       return Text(
         widget.eventCategory,
         style: TextStyle(
             color: Colors.black,
             fontSize: 20.0,
             //fontFamily: FontsHelper.fonts_medium
         ),
       );
     }else{
       return null;
     }
  }
}
