import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_talk/src/data/repository/uploadPortfolio_repository.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class UploadPortfolioPicsBloc
    extends Bloc<UploadPortfolioPicsEvent, UploadPortfolioPicsState> {
  File imageFile;
  List<File> images = [];

  BehaviorSubject<List<File>> imageList = BehaviorSubject<List<File>>();
  Observable<List<File>> get imageListhere {
    return imageList.stream;
  }

  void dispose() {
    imageList.close();
  }

  @override
  UploadPortfolioPicsState get initialState =>
      InitialUploadPortfolioPicsState();

  @override
  Stream<UploadPortfolioPicsState> mapEventToState(
    UploadPortfolioPicsEvent event,
  ) async* {
    if (event is UploadImages) {}
    if (event is DeleteImages) {
      deleteImage(event.image);
    }
  }

  //experiment
  void imagePicker(BuildContext context) {
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
                          fontWeight: FontWeight.w700,
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
                      _onCameraClick(context);
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
                      _onGalleryClick(context);
                    }),
              ],
            ),
          );
        });
  }

  Future _onCameraClick(BuildContext context) async {
    Navigator.pop(context);
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      images.add(imageFile);
      for (var i = 0; i < images.length; i++) {
        imageList.sink.add(images.sublist(0, i + 1));
      }
    }
  }

  Future _onGalleryClick(BuildContext context) async {
    Navigator.pop(context);
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      images.add(imageFile);
      for (var i = 0; i < images.length; i++) {
        imageList.sink.add(images.sublist(0, i + 1));
      }
    }
  }

  void deleteImage(File image) {
    images.remove(image);
    if (images.length > 0) {
      for (var i = 0; i < images.length; i++) {
        imageList.sink.add(images.sublist(0, i + 1));
      }
    } else {
      imageList.sink.add(images);
    }
  }

  Future uploadPic(BuildContext context, int subCatProfileId) async {
    if (images.length >= 1) {
      LoadingWidget.startLoadingWidget(context);
      await UploadPortfolioPicRepository.uploadPortfolioPicApiCall(
              context, subCatProfileId, images)
          .then((onValue) {
        if (onValue) {
          AppNavigator.popBackStack(context);
        } else {}
      });
    } else {
      PopupDialogs.displayMessage(context, "No image to add");
    }
  }
}
