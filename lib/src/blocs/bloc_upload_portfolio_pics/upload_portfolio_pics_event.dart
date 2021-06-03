import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class UploadPortfolioPicsEvent extends Equatable {
  const UploadPortfolioPicsEvent();
}

class UploadImages extends UploadPortfolioPicsEvent {
  @override
  List<Object> get props => null;
  
  
}

class DeleteImages extends UploadPortfolioPicsEvent {
  final File image;

  DeleteImages(this.image);

  @override
  List<Object> get props => null;
}
