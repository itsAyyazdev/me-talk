import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_talk/src/data/repository/business_request_repository.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class BusinessRequestBloc
    extends Bloc<BusinessRequestEvent, BusinessRequestState> {
  //Form and phone verifications section
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
    portfolio.close();
    identification.close();
    business.close();
    isRequestSend.close();
  }

  Future<bool> onRequestClick(_formKey) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      autoValidation = true;
      return false;
    }
  }

  Future<bool> verifyNumber(String smsOTP, BuildContext context) async {
    bool result;
    iserrorMessage.sink.add(null);
    print("here");
    await _auth.currentUser().then((user) async {
      if (user != null) {
        //update phone number
        _auth.signOut();
        result = await signIn(smsOTP, context);
      } else {
        result = await signIn(smsOTP, context);
      }
    });
    return result;
  }

  Future<void> verifyPhone(String phoneNumber) async {
    iserrorMessage.sink.add(null);
    PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      print(verificationId);
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

  Future<bool> signIn(String smsOTP, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      print(user.phoneNumber);
      if (user.phoneNumber != null) {
        return true;
      }
      return false;
    } catch (e) {
      handleErrors(e);
      return false;
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

  //Upload Image section

  File imageFile;

  BehaviorSubject<File> portfolio = BehaviorSubject<File>();
  Observable<File> get portfoliohere {
    return portfolio.stream;
  }

  BehaviorSubject<File> identification = BehaviorSubject<File>();
  Observable<File> get identificationhere {
    return identification.stream;
  }

  BehaviorSubject<File> business = BehaviorSubject<File>();
  Observable<File> get businesshere {
    return business.stream;
  }

  void imagePicker(BuildContext context, int number) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (builder) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Wrap(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      StringHelper.str_choose_from,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.camera,
                      color: Colors.black,
                    ),
                    title: Text(
                      StringHelper.str_camera,
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _onCameraClick(context, number);
                    }),
                ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                    title: Text(
                      StringHelper.str_gallery,
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _onGalleryClick(context, number);
                    }),
              ],
            ),
          );
        });
  }

  Future _onCameraClick(BuildContext context, int number) async {
    Navigator.pop(context);
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      print(imageFile);
      // imageList.sink.add(imageFile);
      switch (number) {
        case 1:
          portfolio.sink.add(imageFile);
          break;
        case 2:
          identification.sink.add(imageFile);
          break;
        case 3:
          business.sink.add(imageFile);
          break;
        default:
      }
    }
  }

  Future _onGalleryClick(BuildContext context, int number) async {
    Navigator.pop(context);
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      switch (number) {
        case 1:
          portfolio.sink.add(imageFile);
          break;
        case 2:
          identification.sink.add(imageFile);
          break;
        case 3:
          business.sink.add(imageFile);
          break;
        default:
      }
    }
  }

  void deleteImage(File image, int number) {
    switch (number) {
      case 1:
        portfolio.sink.add(null);
        break;
      case 2:
        identification.sink.add(null);
        break;
      case 3:
        business.sink.add(null);
        break;
      default:
    }
  }

  @override
  BusinessRequestState get initialState => InitialBusinessRequestState();

  @override
  Stream<BusinessRequestState> mapEventToState(
    BusinessRequestEvent event,
  ) async* {
    if (event is UploadImages) {
      imagePicker(event.context, event.number);
    }
    if (event is DeleteImages) {
      deleteImage(event.image, event.number);
    }
    if (event is SendRequest) {
      sendrequest(event.context);
    }
  }

  //form veriables
  String name;
  String address;
  int phoneCode;
  int subCatId;
  int recomdedCode;
  String email;
  int phoneNo;
  int requestId;
  double lat;
  double long;
  String cityName;
  String countryName;
  File portfoliopic;
  File licencepic;
  File identificationPic;

  BehaviorSubject<bool> isRequestSend = BehaviorSubject<bool>();
  Observable<bool> get isRequestSendHere {
    return isRequestSend.stream;
  }

//  BuildContext context,
//      String name,
//  String address,
//      int subCatId,
//  int recommendedCode,
//      String email,
//  int requestId,
//      double lat,
//  double long,
//      String cityName,
//  String countryName,
//      File portfoliopic,
//  File licencepic,
     // File identificationPic

  Future sendrequest(BuildContext contextx) async {
    LoadingWidget.startLoadingWidget(contextx);
    await BusinessRequestRepository.businessRequestApiCall(
            contextx,
            name,
            address,
            subCatId,
            recomdedCode,
            email,
            requestId,
            lat,
            long,
            cityName,
            countryName,
            portfoliopic,
            licencepic,
            identificationPic)
        .then((onValue) {
      isRequestSend.sink.add(onValue);
      print(onValue);
    });
  }
}
