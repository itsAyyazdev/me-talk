import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/utils/custom_switch_button.dart';

import 'chat.dart';

class VideoChat extends StatefulWidget {
  @override
  _VideoChatState createState() => _VideoChatState();
}

class _VideoChatState extends State<VideoChat> {
  String icon=ImageAssets.app_icon_2;
  bool isChecked=false;
//  Timer _timer;
// int _start = 10;

// void startTimer() {
//   const oneSec = const Duration(seconds: 1);
//   _timer = new Timer.periodic(
//     oneSec,
//     (Timer timer) => setState(
//       () {
//         if (_start < 1) {
//           timer.cancel();
//         } else {
//           _start = _start - 1;
//         }
//       },
//     ),
//   );
// }

 // String time=
  // DateFormat("hh:m").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar(
        backgroundColor: Color(0xff353A50),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset("assets/images/app_icon.png",width: 30,height: 30,),
        ),
        
actions: <Widget>[
 Center(
   
   child: Container(
     margin: EdgeInsets.only(right:10),
     child: Text("15:24",style: TextStyle(color:Colors.white,fontSize:25),)))
],
        //  bottom:PreferredSize(child: tabbar(), preferredSize: Size.fromHeight(50))
      ),
     body:  Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/images/before_profile.png",),fit:BoxFit.cover)
        ),
        child:
        Stack(children:
         <Widget>[
        //   Container(
        //       width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
      
        //   child: ListView.builder(
        //     itemCount: 2,
        //     itemBuilder: (BuildContext context, int index) {
        //     return index==1? nextUser():requestCard();
        //   },),),
     
          Positioned(
            bottom: 0,left: 0,right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.04),
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Color(0xff353A50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children:[
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat()));
                        setState(() {
                         
                          // addMedia=!addMedia;
                          //  print("add tapped");
                          //  print('$addMedia');
                        });
                      },
                      child: Container(
                      
                       
                          child: Icon(Icons.power_settings_new,color:Colors.white,size: 30,)
                        ),
                  
                    ),
                     SizedBox(width:MediaQuery.of(context).size.width*.04),
                      Expanded(child: 
                      
                      Container(height: 30,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(100),
                        color: Colors.white
                      ),
                      alignment: Alignment.centerRight,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration:InputDecoration(border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left:10,bottom: 15))
                      ),
                      ))
                  
                  ]
                ),
            ),)
          , Positioned(
            bottom: 90,//+45
            // right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
             width: MediaQuery.of(context).size.width,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                 Container(height:200,width:150,
                 decoration: BoxDecoration(
                   border:Border.all(color:Colors.grey),
                   
                 ),
                 child:Image.asset("assets/images/after_profile.png",fit: BoxFit.cover,)
                 ),
                 Container(
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color: Color(0xff353A50),
              ),
             height: 45,
             width: 70,
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                   Text("Translate",
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        isChecked=!isChecked;
                      });
                    },
                                    child: CustomSwitchButton(
              backgroundColor: Colors.white,
              buttonWidth: 50,
              unCheckedColor: Color(0xff353A50),
              animationDuration: Duration(milliseconds: 400),
              checkedColor:  Color(0xff353A50),
              //Color(0xff353A50),
              checked: isChecked,
            ),
                ),
               ],),
                 ),
               ],
          )
           )
          , 
          // Positioned(
          //   bottom: 0,left: 0,right: 0,
          //   child: Container(
          //     width:MediaQuery.of(context).size.width,
          //     height: 200,
          //     color: Colors.white,
          //     padding: EdgeInsets.only(top: 20),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children:[
          //         Card(
          //           elevation: 5,
          //           margin: EdgeInsets.only(left:20,right: 20),
          //         shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
          //           child: Padding(
          //             padding: const EdgeInsets.all(10.0),
          //             child: Icon(Icons.linked_camera,color:Color(0xff353A50),size: 40,),
          //           ),),
                 
          //       ]
          //     ),
          // ))
         
         ) ],)
      ),
  
    );
  }
}