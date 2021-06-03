import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BusinessRequestEvent extends Equatable {
  const BusinessRequestEvent();
}

class UploadImages extends BusinessRequestEvent {
  final BuildContext context;
  final int number;
  UploadImages(this.context, this.number);
  @override
  List<Object> get props => null;
}

class DeleteImages extends BusinessRequestEvent {
  final File image;
  final int number;
  DeleteImages(this.image, this.number);

  @override
  List<Object> get props => null;
}

class SendRequest extends BusinessRequestEvent {
  final BuildContext context;
  SendRequest(this.context);

  @override
  List<Object> get props => null;
}
