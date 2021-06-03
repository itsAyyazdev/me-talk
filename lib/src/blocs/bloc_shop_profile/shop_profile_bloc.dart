import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_talk/src/data/network/api_response.dart';
import 'package:me_talk/src/data/repository/shop_details_repository.dart';
import 'package:me_talk/src/models/ShopDetailsBeans.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class ShopProfileBloc extends Bloc<ShopProfileEvent, ShopProfileState> {
  @override
  ShopProfileState get initialState => InitialShopProfileState();

  void dispose() {
    thumnail.close();
    imageLists.close();
  }

  File imageFile;
  List<File> images = [];

  BehaviorSubject<File> thumnail = BehaviorSubject<File>();
  Observable<File> get thumnailhere {
    return thumnail.stream;
  }

  BehaviorSubject<List<File>> imageLists = BehaviorSubject<List<File>>();
  Observable<List<File>> get imageListshere {
    return imageLists.stream;
  }

  // 1 for thumbnail, 2 for main photo
  void imagePicker(BuildContext context, int number) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (builder) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Wrap(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      StringHelper.str_choose_from,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          //fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.camera,
                      color: Colors.black,
                    ),
                    title: Text(
                      StringHelper.str_camera,
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _onCameraClick(context, number);
                    }),
                ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                    title: Text(
                      StringHelper.str_gallery,
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _onGalleryClick(context, number);
                    }),
              ],
            ),
          );
        });
  }

  Future _onCameraClick(BuildContext context, int number) async {
    Navigator.pop(context);
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      print(imageFile);
      // imageList.sink.add(imageFile);
      switch (number) {
        case 1:
          thumnail.sink.add(imageFile);
          break;
        case 2:
          images.add(imageFile);
          for (var i = 0; i < images.length; i++) {
            imageLists.sink.add(images.sublist(0, i + 1));
          }
          break;
        case 3:
          break;
        default:
      }
    }
  }

  Future _onGalleryClick(BuildContext context, int number) async {
    Navigator.pop(context);
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      switch (number) {
        case 1:
          thumnail.sink.add(imageFile);
          break;
        case 2:
          images.add(imageFile);
          for (var i = 0; i < images.length; i++) {
            imageLists.sink.add(images.sublist(0, i + 1));
          }
          break;
        case 3:
          break;
        default:
      }
    }
  }

  void deleteImage(File image, int number) {
    switch (number) {
      case 1:
        thumnail.sink.add(null);
        break;
      case 2:
        images.remove(image);
        if (images.length > 0) {
          for (var i = 0; i < images.length; i++) {
            imageLists.sink.add(images.sublist(0, i + 1));
          }
        } else {
          imageLists.sink.add(images);
        }
        break;
      case 3:
        break;
      default:
    }
  }

  Future<ShopDetailsBeansData> getShopCategoryDetails(
      BuildContext context, int categoryProfileId) async {
    
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json_files/business_category.json");
    final jsonResult = json.decode(data);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResult);
    ShopDetailsBeansData shopDetailsBeansData =
        ShopDetailsBeansData.fromJson(apiResponse.data);
    // await ShopDetailsRepository.shopDetailsApiCall(context, categoryProfileId)
    //     .then((onValue) {
    //   if (onValue != null) {
    //     shopDetailsBeansData = onValue;
    //   } else {
    //     shopDetailsBeansData = null;
    //   }
    // });
    return shopDetailsBeansData;
  }

  Future updateCategoryDetails(
      BuildContext context,
      int categoryProfileId,
      File thumnail,
      String address,
      String city,
      double latitude,
      double longitude,
      List<File> mainPhotoListPic,
      int discount,
      String activateName,
      String shopName,
      String specialOf,
      List<int> deleteIds) async {
    ShopDetailsBeansData shopDetailsBeansData;
    LoadingWidget.startLoadingWidget(context);
    await ShopDetailsRepository.updateShopDetailsApiCall(
            context,
            categoryProfileId,
            thumnail,
            address,
            city,
            latitude,
            longitude,
            mainPhotoListPic,
            discount,
            activateName,
            shopName,
            specialOf,
            deleteIds)
        .then((onValue) {
      if (onValue != null) {
        AppNavigator.popBackStack(context);
        //shopDetailsBeansData = onValue;
      } else {
        //s shopDetailsBeansData = null;
      }
    });
    return shopDetailsBeansData;
  }

  @override
  Stream<ShopProfileState> mapEventToState(
    ShopProfileEvent event,
  ) async* {
    if (event is UploadImagesShopProfile) {
      imagePicker(event.context, event.number);
    }
    if (event is DeleteImages) {
      deleteImage(event.image, event.number);
    }
  }
}
