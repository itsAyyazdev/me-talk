import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ShopProfileEvent extends Equatable {
  const ShopProfileEvent();
}

class UploadImagesShopProfile extends ShopProfileEvent {
  final BuildContext context;
  final int number;
  UploadImagesShopProfile(this.context, this.number);
  @override
  List<Object> get props => null;
}

class DeleteImages extends ShopProfileEvent {
  final File image;
  final int number;
  DeleteImages(this.image, this.number);

  @override
  List<Object> get props => null;
}

class SendRequest extends ShopProfileEvent {
  final BuildContext context;
  SendRequest(this.context);

  @override
  List<Object> get props => null;
}
