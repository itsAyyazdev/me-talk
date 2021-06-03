import 'package:flutter/material.dart';
import 'package:me_talk/src/data/repository/email_login_repository.dart';
import 'package:me_talk/src/models/logindatabeans.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'email_page_event.dart';
import 'email_page_state.dart';

class EmailLoginBloc extends Bloc<EmailPageEvent, EmailPageState> {
  LoginData loginData = LoginData();
  bool autoValidation = false;
  EmailLoginRepository loginRepository = EmailLoginRepository();

  BehaviorSubject<bool> isOtpSend = BehaviorSubject<bool>();
  BehaviorSubject<String> iserrorMessage = BehaviorSubject<String>();
  Observable<bool> get isOtpSendHere {
    return isOtpSend.stream;
  }

  Observable<String> get iserrorMessageHere {
    return iserrorMessage.stream;
  }

  String verificationId;

  void dispose() {
    isOtpSend.close();
    iserrorMessage.close();
  }

  Future<bool> onLoginClick(final formKey, BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
//      AppNavigator.launchDashboard(context);
       loginRepository.emailLoginApiCall(context).then((onValue) {
         if (onValue != null) {
           loginData = onValue;
//           SharePreferencesHelper.getInstant()
//               .setString(SharePreferencesHelper.User_Name, loginData.user.name);
//           SharePreferencesHelper.getInstant()
//               .setInt(SharePreferencesHelper.Id, loginData.user.id);
//           SharePreferencesHelper.getInstant().setInt(
//               SharePreferencesHelper.Phone_No, loginData.user.phoneNumber);
//           SharePreferencesHelper.getInstant().setInt(
//               SharePreferencesHelper.Phone_Code, loginData.user.phoneCode);
//           SharePreferencesHelper.getInstant()
//               .setInt(SharePreferencesHelper.Gender, loginData.user.gender);
//           SharePreferencesHelper.getInstant()
//               .setInt(SharePreferencesHelper.Language, loginData.user.language);
//           SharePreferencesHelper.getInstant()
//               .setString(SharePreferencesHelper.Avatar, loginData.user.avatar);
//           SharePreferencesHelper.getInstant()
//               .setString(SharePreferencesHelper.Access_Token, loginData.token);
          // LoadingWidget.endLoadingWidget(context);
           AppNavigator.launchDashboard(context);
         } else {}
       });
      return true;
    } else {
      autoValidation = true;
      return false;
    }
  }

  @override
  EmailPageState get initialState => InitialEmailPageState();

  @override
  Stream<EmailPageState> mapEventToState(
    EmailPageEvent event,
  ) async* {}
}
