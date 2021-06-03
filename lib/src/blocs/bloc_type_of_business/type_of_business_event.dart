import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TypeOfBusinessEvent extends Equatable {
  const TypeOfBusinessEvent();
}

class GetBusinessListData extends TypeOfBusinessEvent {
  final BuildContext context;
  final String type;

  GetBusinessListData(this.context, this.type);
  @override
  List<Object> get props => null;
}
