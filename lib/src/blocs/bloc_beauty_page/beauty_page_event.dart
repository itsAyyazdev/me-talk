import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BeautyPageEvent extends Equatable {
  const BeautyPageEvent();
}

class GetBeautyPageData extends BeautyPageEvent {
  final BuildContext context;

  GetBeautyPageData(this.context);
  @override
  List<Object> get props => null;
}
