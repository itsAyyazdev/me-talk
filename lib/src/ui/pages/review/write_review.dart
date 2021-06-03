import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/ui/pages/review/write_review_data.dart';

class WriteReview extends StatefulWidget {
  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview>
    with SingleTickerProviderStateMixin {
 int tabSelector=1;
 String hospital=ImageAssets.hospital1;
 String review1=ImageAssets.beauty_event5;
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
        title: Text("able list to write review"),
        centerTitle: true,
        actions: <Widget>[],
        bottom:PreferredSize(child: tabbar(), preferredSize: Size.fromHeight(50))
         ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal:15),
        child:tabSelector==1? beautyBody():hospitalBody(),
      )
    );
  }

  Widget tabbar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                tabSelector=1;
              });
            },
            child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: tabSelector==1? Colors.black:Colors.grey, width:tabSelector==1? 3:1.5))),
            alignment: Alignment.center,
            child: Text("Beauty",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          ),
        ),

       Expanded(
         child: GestureDetector(
           onTap: (){
              setState(() {
                tabSelector=2;
              });
            },
           child:Container(

          decoration: BoxDecoration(
            border:Border(bottom: BorderSide(color:tabSelector==2? Colors.black:Colors.grey,width:tabSelector==2? 3:1.5))
          ),
          alignment: Alignment.center,
          child: Text("Hospital",style:TextStyle(color: Colors.black,fontSize:15)),
      ),
         ),
       ),


      ]),
    );
  }

  Widget beautyBody(){
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
    return beautyCard();
    },);
  }
 Widget hospitalBody(){
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
      return hospitalCard();
    },);
  }
  Widget beautyCard(){

    return InkWell(
      onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WriteReviewData(hospital: false,beautyScreen1: true,)));

      },
          child: Container(
        
        margin: EdgeInsets.only(top:15),
        width: MediaQuery.of(context).size.width,
       
        color: Colors.white,
        child: Row(
          children:[
            Expanded(
                        child: Container(
                width: MediaQuery.of(context).size.width*.3,
                   height: MediaQuery.of(context).size.width*.3,

                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  border: Border.all(color:Colors.grey),

                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("$review1",fit: BoxFit.cover,),)),
            )
         ,   Expanded(
           
                  child: Container(
                      height: MediaQuery.of(context).size.width*.3,

             margin: EdgeInsets.only(left:10,top: 3,bottom: 3),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
               Text("2019. 9. 20",style: TextStyle(color: Colors.black,fontSize: 15),),
                 Text("name",style: TextStyle(color: Colors.black,fontSize: 15),),
                   Text("Location.",style: TextStyle(color: Colors.black,fontSize: 15),),
                     Text("specialty of",style: TextStyle(color: Colors.pink,fontSize: 15),),
             ],),

           ),
         )
          ,Expanded(
                    child: Container(
                      alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical:5),
              decoration: BoxDecoration(
                color:Color(0xff353A50),
                borderRadius:BorderRadius.circular(100),

              ),
             child:Text("write review",style: TextStyle(color: Colors.white,fontSize: 15),),
               
            ),
          )
          
          ]
        ),
      ),
    );
  }
 Widget hospitalCard(){
    return InkWell(
      onTap: ()
      {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WriteReviewData(hospital: true,beautyScreen1: false,)));

      },
          child: Container(
        
        margin: EdgeInsets.only(top:15),
        width: MediaQuery.of(context).size.width,
       
        color: Colors.white,
        child: Row(
          children:[
           Container(
                width: MediaQuery.of(context).size.width*.3,
                   height: MediaQuery.of(context).size.width*.3,

                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  border: Border.all(color:Colors.grey),

                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("$hospital",fit: BoxFit.cover,),)),
            
          Container(
             margin: EdgeInsets.only(left:10),
               height: MediaQuery.of(context).size.width*.3,

             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
               Text("Location. Hopspital name",style: TextStyle(color: Colors.black,fontSize: 9),),
                 Text("Rear Great Breast (title)",style: TextStyle(color: Colors.black,fontSize: 12),),
                   Text("will be ok after oprtion (subtitle).",style: TextStyle(color: Colors.black,fontSize: 9),),
                    Container(
                      alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical:5,horizontal: 17),
              decoration: BoxDecoration(
                color:Color(0xff353A50),
                borderRadius:BorderRadius.circular(100),

              ),
             child:Text("write review",style: TextStyle(color: Colors.white,fontSize: 15),),
               
            ),
             ],),

           ),
        
          
          ]
        ),
      ),
    );
  }

}

