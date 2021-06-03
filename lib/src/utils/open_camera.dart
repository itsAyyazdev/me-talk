import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OpenCamera {
  static init({BuildContext context, Function getImage(File file)}) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select Media From'),
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              _fromCamera(context: context, getImage: getImage);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Gallery'),
            onPressed: () {
              _fromGallery(context: context, getImage: getImage);
            },
          ),
        ],
      ),
    );
  }

  static _fromGallery(
      {BuildContext context, Function getImage(File file)}) async {
    Navigator.pop(context);
    final File _image =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      getImage(_image);
    }
  }

  static _fromCamera(
      {BuildContext context, Function getImage(File file)}) async {
    Navigator.pop(context);
    File _image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      getImage(_image);
    }
  }
}
