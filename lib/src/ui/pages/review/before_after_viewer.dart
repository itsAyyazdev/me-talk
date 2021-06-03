import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:vibrate/vibrate.dart';

class BeforeAfterViewer extends StatefulWidget {
  BeforeAfterViewer({
this.before
  });
  bool before;
  @override
  _BeforeAfterViewerState createState() => _BeforeAfterViewerState(before: before);
}

class _BeforeAfterViewerState extends State<BeforeAfterViewer> {
  _BeforeAfterViewerState({
this.before
  });
  bool before;
  String beforeimg=ImageAssets.before;
  String afterimg=ImageAssets.after;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title:  Container(
                                        margin: EdgeInsets.only(left: 10),
                                        //color: Colors.black12,
                                        height: 51,
                                        width: 75,
                                        padding: EdgeInsets.all(0),
                                        child: FlareActor(
                                          'assets/logo_chactor1.flr',
                                          isPaused: true,
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          animation: "Logo",
                                          //controller: controls,
                                        ),
                                      ),
        centerTitle: true,
        actions: <Widget>[
         InkWell(
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
        ],
      //  bottom:PreferredSize(child: tabbar(), preferredSize: Size.fromHeight(50))
         ),
         body: Container( 
         //  padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.15),
           alignment: Alignment.center,
           color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 4,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
            return index==0?Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top:20),
              child: Text(  this.before? "Before":"After",style:TextStyle(color: Colors.black,fontSize:20,fontWeight:FontWeight.w500)),):
            
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.width*.65,
                width: MediaQuery.of(context).size.width*.65,
                margin: EdgeInsets.only(top:15),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15),
                  //color: Colors.black,
                boxShadow:[
                  BoxShadow(
                    color : Colors.black, offset : Offset(1,1),  blurRadius: 5.0,  spreadRadius : 1.0
                  )
                ]
                ),
                
                child:Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:Image.asset(this.before?"$beforeimg":"$afterimg",fit: BoxFit.cover,)),
                )
              ),
            );
          },),
         ),
   
    );
  }

}