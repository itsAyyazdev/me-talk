import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class SetProfilePic extends ProfileEvent{
  final BuildContext context;

  SetProfilePic(this.context);
  List<Object> get props => null;
}
