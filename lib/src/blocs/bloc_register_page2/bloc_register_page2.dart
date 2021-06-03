import 'package:flutter/cupertino.dart';
import 'package:me_talk/src/data/repository/register_repository.dart';
import 'package:me_talk/src/models/registerdatabeans.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'register_page2_event.dart';
import 'register_page2_state.dart';

class RegisterPageBloc2 extends Bloc<RegisterPage2Event, RegisterPage2State> {
  RegisterData registerData = RegisterData();
  RegisterRepository registerRepository = RegisterRepository();
  bool autoValidation = false;
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

  Future<bool> onOkClick(final formKey, BuildContext context,String phone, String phoneCode) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      registerRepository.registerUserApiCall(context,phone,phoneCode).then((onValue) {
        if(onValue){
          AppNavigator.launchEmailLogin(context);
        }
//        SharePreferencesHelper.getInstant()
//              .setString(SharePreferencesHelper.User_Name, registerData.name);
//          SharePreferencesHelper.getInstant()
//              .setInt(SharePreferencesHelper.Id, registerData.id);
//          SharePreferencesHelper.getInstant().setInt(
//              SharePreferencesHelper.Phone_No, registerData.phoneNumber);
//          SharePreferencesHelper.getInstant().setInt(
//              SharePreferencesHelper.Phone_Code, registerData.phoneCode);
//          SharePreferencesHelper.getInstant()
//              .setInt(SharePreferencesHelper.Gender, registerData.gender);
//          SharePreferencesHelper.getInstant()
//              .setInt(SharePreferencesHelper.Language, registerData.language);
//          SharePreferencesHelper.getInstant()
//              .setString(SharePreferencesHelper.Avatar, registerData.avatar);
//          SharePreferencesHelper.getInstant()
//              .setString(SharePreferencesHelper.Access_Token, registerData.token);
//        SharePreferencesHelper.getInstant()
//            .setInt(SharePreferencesHelper.Id, registerData.id);
//        SharePreferencesHelper.getInstant()
//            .setString(SharePreferencesHelper.Avatar, registerData.avatar);
//        SharePreferencesHelper.getInstant()
//            .setString(SharePreferencesHelper.Access_Token, registerData.token);
        //AppNavigator.launchDashboard(context);

      });
      return true;
    } else {
      autoValidation = true;
      return false;
    }
  }

  @override
  RegisterPage2State get initialState => InitialRegisterPage2State();

  @override
  Stream<RegisterPage2State> mapEventToState(
    RegisterPage2Event event,
  ) async* {}
}
