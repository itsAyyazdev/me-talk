import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
@immutable
abstract class HomepageEvent extends Equatable {}

class GetHomePageData extends HomepageEvent{
  final BuildContext context;

  GetHomePageData(this.context);
  @override
  List<Object> get props => null;
}