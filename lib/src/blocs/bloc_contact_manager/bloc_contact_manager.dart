import 'package:flutter/material.dart';
import 'package:me_talk/src/data/repository/contact_manager_repository.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';

class ContactManagerBloc {
  static void contactManager(
      BuildContext context, String subject, String message) {
    ContactManagerRepository.contactManagertApiCall(context, subject, message)
        .then((onValue) {
      if (onValue) {
        AppNavigator.popBackStack(context);
      }
    });
  }
}
