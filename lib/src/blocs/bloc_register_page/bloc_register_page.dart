import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:me_talk/src/blocs/bloc_register_page/register_page_event.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
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

  Future nextPage(String smsOTP, BuildContext context,String phone, String phoneCode) async {
    iserrorMessage.sink.add(null);
    _auth.currentUser().then((user) {
      if (user != null) {
        AppNavigator.launchRegisterPage2(context,phone,phoneCode);
      } else {
        signIn(smsOTP, context,phone,phoneCode);
      }
    });
  }

  Future checkOTP(String smsOTP, BuildContext context) async {
    iserrorMessage.sink.add(null);
    _auth.currentUser().then((user) {
      if (user != null) {
        print('user is not null');
      } else {
        print('user is null');
        signInForCheckOTP(smsOTP, context);
      }
    });
  }

  Future<void> signInForCheckOTP(String smsOTP, BuildContext context) async {
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
    } catch (e) {
      handleErrors(e);
    }
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

  Future<void> signIn(String smsOTP, BuildContext context,String phone, String phoneCode) async {
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
      AppNavigator.launchRegisterPage2(context,phone,phoneCode);
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
  RegisterPageState get initialState => InitialRegisterPageState();

  @override
  Stream<RegisterPageState> mapEventToState(
    RegisterPageEvent event,
  ) async* {}
}
