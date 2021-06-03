import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_talk/src/blocs/bloc_upload_portfolio_pics/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:vibrate/vibrate.dart';

class UploadPortfolioPics extends StatefulWidget {
  final int subCatProfileId;
  static const String routeName = "UploadPortfolioPics";
  UploadPortfolioPics({Key key, this.subCatProfileId}) : super(key: key);

  @override
  _UploadPortfolioPicsState createState() => _UploadPortfolioPicsState();
}

class _UploadPortfolioPicsState extends State<UploadPortfolioPics> {
  UploadPortfolioPicsBloc uploadPortfolioPicsBloc = UploadPortfolioPicsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsHelper.whiteColor(),
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
            StringHelper.post,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            //publish button
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  print("Publish");
                  Navigator.of(context).pop();
                  // uploadPortfolioPicsBloc.uploadPic(
                  //     context, widget.subCatProfileId);
                },
                child: Container(
                  padding:
                      EdgeInsets.only(right: 5, top: 15, bottom: 15, left: 5),
                  child: Text(
                    StringHelper.publish,
                    style: TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                        color: ColorsHelper.themeBlackColor()),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocProvider(
          create: (BuildContext context) => uploadPortfolioPicsBloc,
          child: BlocBuilder(
            bloc: uploadPortfolioPicsBloc,
            builder: (BuildContext context, UploadPortfolioPicsState state) {
              return uploadPortfolioPicsBody();
            },
          ),
        ));
  }

  Widget uploadPortfolioPicsBody() {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Post",
              style: TextStyle(
                  color: ColorsHelper.darkGrayColor(),
                  //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
              ),
            ),
            SizedBox(
              height: 10,
            ),
            uploadPicsBody(),
            SizedBox(
              height: 10,
            ),
            //text hint
            Text(
              "! You mignt be block if the photo shows about phone number or price.\nbecareful",
              style:
                  TextStyle(fontSize: 10, color: ColorsHelper.darkGrayColor()),
            ),
            SizedBox(
              height: 10,
            ),
            //button instagram
            ButtonColor(
              radius: 15,
              color: ColorsHelper.themeBlackColor(),
              child: Text("Share on your instagram and take credit",
                  style: TextStyle(
                      //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                      fontSize: 14,
                      color: ColorsHelper.whiteColor())),
            )
          ],
        ),
      ),
    );
  }

  Widget uploadPicsBody() {
    return StreamBuilder(
      stream: uploadPortfolioPicsBloc.imageListhere,
      builder: (context, snapshot) {
        return GridView.builder(
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data != null ? snapshot.data.length + 1 : 1,
          itemBuilder: (BuildContext context, int index) {
            return showPortfolioPics(
                snapshot.data != null ? snapshot.data.length + 1 : 1,
                index,
                snapshot.data != null
                    ? index != (snapshot.data.length)
                        ? snapshot.data[index]
                        : null
                    : null);
          },
        );
      },
    );
  }

  Widget showPortfolioPics(int itemCount, int index, var image) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: index != (itemCount - 1)
          ? Container(
              child: imageList(image),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (itemCount <= 10) {
                      uploadPortfolioPicsBloc.imagePicker(context);
                    } else {
                      PopupDialogs.displayMessageOnly(
                          context, "Max 10 pic can upload at a time");
                    }
                  });
                },
                icon: Icon(Icons.add),
              ),
            ),
    );
  }

  Widget imageList(var image) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: double.infinity,
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
            IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                uploadPortfolioPicsBloc.add(DeleteImages(image));
              },
            ),
          ],
        ));
  }
}
