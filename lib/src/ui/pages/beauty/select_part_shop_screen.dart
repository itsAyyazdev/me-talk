
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:flutter/material.dart';



class SelectPartShopScreen extends StatefulWidget {
  @override
  _SelectPartShopScreenState createState() => _SelectPartShopScreenState();
}

class _SelectPartShopScreenState extends State<SelectPartShopScreen> {

  List<String> appearancePlaceList,carePlacesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appearancePlaceList = [];
    carePlacesList = [];

    new Future.delayed(const Duration(microseconds: 100), () {
      //shopCategoryListApi();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 30),
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
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Text(
              StringHelper.appearance_care,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 70),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: appearancePlaceList.length   ,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,childAspectRatio:1.7),
                itemBuilder: getAppPartListView,
              ),
            ),
            Text(
              StringHelper.care_places,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: carePlacesList.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,childAspectRatio:1.7),
                itemBuilder: getCarePartListView,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppPartListView(BuildContext context, int index) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pop(appearancePlaceList[index]);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            appearancePlaceList[index],
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              appearancePlaceList[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCarePartListView(BuildContext context, int index) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pop(carePlacesList[index]);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            carePlacesList[index],
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              carePlacesList[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

//  void shopCategoryListApi() async {
//    ShopCategoryResponse _response =
//    await DataManagerInheritedWidget.of(context)
//        .apiRepos
//        .shopCategoryList(context, "${CategoryListId.Appearance.index},${CategoryListId.CarePlace.index}");
//
//    List<ShopCategoryData> categoryList = _response.data;
//
//    for(int i=0;i<categoryList.length;i++){
//      if(categoryList[i].categoryId==2){
//        appearancePlaceList.add(categoryList[i]);
//      }else{
//        carePlacesList.add(categoryList[i]);
//      }
//    }
//    setState(() {});
//
//    if (_response.statusCode == 200) {
//      //Utility.showAlertDialogCallBack(context: context, message: _response.message);
//    } else {
//      Utility.showAlertDialogCallBack(
//          context: context, message: _response.message);
//    }
//  }

}
