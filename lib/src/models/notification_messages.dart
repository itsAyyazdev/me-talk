import 'package:flutter/material.dart';

@immutable
class NotificationMessages {
  final String title;
  final String body;

  const NotificationMessages({
   @required this.title,
   @required  this.body,
});
}