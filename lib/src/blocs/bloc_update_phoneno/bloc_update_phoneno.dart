import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:me_talk/src/data/repository/profile_repository.dart';
import 'package:me_talk/src/models/profileupdatebeans.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:rxdart/rxdart.dart';

import 'update_phoneno_event.dart';
import 'update_phoneno_state.dart';

class UpdatePhoneNoBloc extends Bloc<UpdatePhoneNoEvent, UpdatePhoneNoState> {
  ProfileRepository profileRepository = ProfileRepository();
  ProfileUpdateData profileUpdateData;
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
  FirebaseAuth _auth = FirebaseAuth.instance;

  void dispose() {
    isOtpSend.close();
    iserrorMessage.close();
  }

  Future<bool> onSignUpClick(final _formKey) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      autoValidation = true;
      return false;
    }
  }

  Future saveChange(
      String smsOTP, BuildContext context, String number, String code) async {
    iserrorMessage.sink.add(null);
    _auth.currentUser().then((user) {
      if (user != null) {
        //update phone number
        _auth.signOut();
        signIn(smsOTP, context, number, code);
      } else {
        signIn(smsOTP, context, number, code);
      }
    });
  }

  Future<void> verifyPhone(String phoneNumber) async {
    iserrorMessage.sink.add(null);
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      isOtpSend.sink.add(true);
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 5),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print("verificationCompleted phoneAuthCredential = " +
                phoneAuthCredential.toString());
          },
          verificationFailed: (AuthException exceptio) {
            print('verificationFailed =   ${exceptio.message}');
            handleAuthErrors(exceptio);
          });
    } catch (e) {
      handleErrors(e);
    }
  }

  Future signIn(
      String smsOTP, BuildContext context, String number, String code) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      print(user.phoneNumber);
      Map<String, dynamic> mobile = {"no": number, "code": code};
      SharePreferencesHelper.getInstant()
          .setString(SharePreferencesHelper.editedMobileCode, number);
      SharePreferencesHelper.getInstant()
          .setString(SharePreferencesHelper.editedMobileNumber, code);
//      profileRepository
//          .profileUpdateApiCall(
//              context, null, null, user.phoneNumber, null, null)
//          .then((onValue) {
//        if (onValue != null) {
//          profileUpdateData = onValue;
//          SharePreferencesHelper.getInstant().setInt(
//              SharePreferencesHelper.Phone_No, profileUpdateData.phoneNumber);
//          SharePreferencesHelper.getInstant().setInt(
//              SharePreferencesHelper.Phone_Code, profileUpdateData.phoneCode);
//          Navigator.pop(context);
//        }
//      });
      Navigator.pop(context, mobile);
    } catch (e) {
      handleErrors(e);
    }
  }

  handleErrors(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        iserrorMessage.sink.add('Invalid Code');
        break;
      default:
        iserrorMessage.sink.add(error.message);
        break;
    }
  }

  handleAuthErrors(AuthException error) {
    switch (error.code) {
      case 'quotaExceeded':
        iserrorMessage.sink.add(error.message);
        break;
      default:
        iserrorMessage.sink.add(error.message);
        break;
    }
  }

  @override
  UpdatePhoneNoState get initialState => InitialUpdatePhoneNoState();

  @override
  Stream<UpdatePhoneNoState> mapEventToState(
    UpdatePhoneNoEvent event,
  ) async* {}
}
