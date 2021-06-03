import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:me_talk/src/blocs/bloc_business_request/bloc.dart';
import 'package:me_talk/src/blocs/bloc_business_request/business_request_bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/constants.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/business_request/type_of_business.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/flutter_google_places/flutter_google_places.dart';
import 'package:me_talk/src/utils/popup_dialogs/Confirm_business_request_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

import 'event_category_list_screen.dart';

class HospitalRequest extends StatefulWidget {
  static const String routeName = "HospitalRequest";
  HospitalRequest({Key key}) : super(key: key);

  @override
  _HospitalRequestState createState() => _HospitalRequestState();
}

class _HospitalRequestState extends State<HospitalRequest> {
  BusinessRequestBloc businessRequestBloc;
  final formKey = GlobalKey<FormState>();

  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController recommendController = TextEditingController();

  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode fnodeHospitalName = FocusNode();
  FocusNode fnodeAddress = FocusNode();
  FocusNode fnodeCity = FocusNode();
  FocusNode fnodeRecomCode = FocusNode();
  FocusNode fnodeOtp = FocusNode();
  FocusNode fnodeEmail = FocusNode();

  String countryPhoneCode,
      smsOTP,
      phoneNumber = "",
      phoneIsoCode = "KR",
      errorMessage = '',
      typeOfBusiness;
  bool isCodeSend = true, hitSend = false, isPageLoaded = false;
  int countHitSend, subCatId;
  File interiorPhoto, businessLicenseHospital;


  int countryId;
  int stateId;
  String countryCode = '';
  List<File> arrImg = List();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: Constants.Google_API_KEY);
  bool autoValidation = false;
  double latitude, longitude;
  String cityName,stateName,countryName;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(isoCode);
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
      countryPhoneCode =
          internationalizedPhoneNumber.split(number)[0].split("+")[1];
      SharePreferencesHelper.getInstant().setInt(
          SharePreferencesHelper.Phone_Code, int.parse(countryPhoneCode));
    });
  }

  Future setTypeOfBusiness() async {
    typeOfBusiness = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Type_of_business);
    subCatId = await SharePreferencesHelper.getInstant()
        .getInt(SharePreferencesHelper.Business_Id);
  }

  void openDilogBox(BuildContext context, Map<String, dynamic> requestData) {
    BlocProvider.value(
        value: BlocProvider.of<BusinessRequestBloc>(context),
        child: ConfirmBusinessRequestPopup.openPopup(context,requestData));
  }

  @override
  void initState() {
    SharePreferencesHelper.getInstant()
        .setString(SharePreferencesHelper.Type_of_business, null);
    countHitSend = 0;
    super.initState();
    businessRequestBloc = BusinessRequestBloc();
    businessRequestBloc.isOtpSendHere.listen((onData) {
      if (onData == true) {
        setState(() {
          isCodeSend = onData;
          hitSend = false;
        });
      }
    });
    businessRequestBloc.iserrorMessageHere.listen((String onData) {
      setState(() {
        if (onData != null) {
          errorMessage = onData;
        } else {
          errorMessage = '';
        }
      });
    });
    Future.delayed(Duration(milliseconds: 455), () {
      setState(() {
        isPageLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusinessRequestBloc>(
      create: (BuildContext context) => businessRequestBloc,
      child: BlocBuilder(
          bloc: businessRequestBloc,
          builder: (BuildContext context, BusinessRequestState state) {
            return Container(
              color: ColorsHelper.themeBlackColor(),
              child: SafeArea(
                left: false,
                right: false,
                top: false,
                bottom: true,
                child: Scaffold(
                  backgroundColor: ColorsHelper.whiteColor(),
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: ColorsHelper.whiteColor(),
                    leading: IconButton(
                      icon: Image.asset(
                        ImageAssets.back_arrow,
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Vibrate.feedback(FeedbackType.light);
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text(
                      StringHelper.request_To_Import,
                      style: TextStyle(
                          fontSize: 16,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          //fontWeight: FontWeight.w700,
                          color: ColorsHelper.themeBlackColor()),
                    ),
                    centerTitle: true,
                  ),
                  body: isPageLoaded ? hospitalForm() : Container(),
                  //Request
                  bottomNavigationBar: Container(
                    color: ColorsHelper.themeBlackColor(),
                    height: MediaQuery.of(context).size.height*.1,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          //openDilogBox(context);
                           businessRequestBloc
                               .onRequestClick(formKey)
                               .then((onValue) async {
                             if (onValue) {
                               if (typeOfBusiness != null) {
                                 if (interiorPhoto != null &&
                                     businessLicenseHospital != null) {

                                   Map<String, dynamic> map = Map<String, dynamic>();

                                   map = {
                                     "name": hospitalNameController.text,
                                     "entity_type_id": '2',
                                     "category_id": subCatId,
                                     "address": addressController.text,
                                     "latitude": latitude,
                                     "longitude": longitude,
                                     "email": emailController.text,
                                     "city_id": cityName,
                                     "state_id": stateName,
                                     "country_id": countryName,
                                     "recommend_code": recommendController.text,
                                     "business_licence": businessLicenseHospital ,
                                     "identification_card":  interiorPhoto
                                   };

                                   openDilogBox(context,map);
//                                   if (phoneNumber != "") {
//                                     await Geolocator()
//                                         .placemarkFromAddress(
//                                             "${addressController.text}, ${cityController.text}")
//                                         .then((result) {
//                                       print(
//                                           "${addressController.text}, ${cityController.text}");
//                                       if (isCodeSend) {
//                                         businessRequestBloc
//                                             .verifyNumber(smsOTP, context)
//                                             .then((onValue) {
//                                           if (onValue) {
//                                             businessRequestBloc.name =
//                                                 hospitalNameController.text;
//                                             businessRequestBloc.address =
//                                                 addressController.text;
//                                             businessRequestBloc.phoneCode =
//                                                 int.parse(countryPhoneCode);
//                                             businessRequestBloc.subCatId =
//                                                 subCatId;
//                                             businessRequestBloc.recomdedCode =
//                                                 int.parse(
//                                                     recommendController.text);
//                                             businessRequestBloc.email =
//                                                 emailController.text;
//                                             businessRequestBloc.phoneNo =
//                                                 int.parse(phoneNumber);
//                                             businessRequestBloc.requestId = 2;
//                                             businessRequestBloc.lat =
//                                                 result[0].position.latitude;
//                                             businessRequestBloc.long =
//                                                 result[0].position.longitude;
//                                             businessRequestBloc.cityName =
//                                                 cityController.text;
//                                             businessRequestBloc.portfoliopic =
//                                                 interiorPhoto;
//                                             businessRequestBloc
//                                                 .identificationPic = null;
//                                             businessRequestBloc.licencepic =
//                                                 businessLicenseHospital;
//                                             openDilogBox(context);
//                                           } else {
//                                             setState(() {});
//                                           }
//                                         });
//                                       }
//                                     }).catchError((onError) {
//                                       PopupDialogs.displayMessage(context,
//                                           StringHelper.address_location);
//                                     });
//                                   } else {
//                                     PopupDialogs.displayMessage(
//                                         context, StringHelper.please_verify);
//                                   }
                                 } else {
                                   PopupDialogs.displayMessage(context,
                                       StringHelper.please_select_image);
                                 }
                               } else {
                                 PopupDialogs.displayMessage(
                                     context, StringHelper.please_select_type);
                               }
                             } else {
                               setState(() {});
                             }
                           });
                        },
                        child: Center(
                          child: Text(
                           "REQUEST",
                            style: TextStyle(
                              height: 0,
                                color: Colors.white,
                                //fontWeight: FontWeight.w700,
                                fontSize: 20,
                                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget hospitalForm() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Hospital name
              nameFeild(
                StringHelper.shop_name.toUpperCase(),
                fnodeHospitalName,
                fnodeAddress,
                hospitalNameController,
                TextInputType.text,
                TextInputAction.next,
                CommonValidator.emptyValidation,
              ),
              //Address
              InkWell(
                onTap: () {
                  openPlacesAutocomplete();
                },
                child: Container(
                  child: nameFeild(
                      StringHelper.address.toUpperCase(),
                      fnodeAddress,
                      fnodeCity,
                      addressController,
                      TextInputType.text,
                      TextInputAction.next,
                      CommonValidator.emptyValidation,
                      enable: false),
                ),
              ),
              //City and type of business
              Container(
                width: MediaQuery.of(context).size.width*.3,
                child: nameFeild(
                    StringHelper.city.toUpperCase(),
                    fnodeCity,
                    null,
                    cityController,
                    TextInputType.text,
                    TextInputAction.done,
                    CommonValidator.emptyValidation,
                    enable: false),
              ),
              //Recommend code
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      StringHelper.recommend_Code,
                      style: TextStyle(
                          fontSize: 16,
                          //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 43,
                    width: 150,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500],
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: TextFormField(
                      focusNode: fnodeRecomCode,
                      controller: recommendController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: StringHelper.not_essential,
                          hintStyle: TextStyle(
                              //fontWeight: FontWeight.w500
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                ],
              ),
              //Row
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //interior_Photo
                  addItems(StringHelper.your_best_portfolio, 0,
                      businessRequestBloc.portfoliohere),
                  addItems(StringHelper.interior_Photo, 1,
                      businessRequestBloc.portfoliohere),
                  //business_license_hospital
                  addItems("Business lisence (Essential)", 3,
                      businessRequestBloc.businesshere),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              nameFeild(
                  StringHelper.email.toUpperCase(),
                  fnodeEmail,
                  null,
                  emailController,
                  TextInputType.emailAddress,
                  TextInputAction.done,
                  CommonValidator.emailValidation),
            ],
          ),
        ),
      ),
    );
  }

  Widget addItems(String data, int number, var stream) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(data),
        SizedBox(
          height: 10,
        ),
        Container(
          //alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.height * 0.13,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.0,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Color(0xffE1E1E2)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? GestureDetector(
                            onTap: () {
                              Vibrate.feedback(FeedbackType.light);
                              businessRequestBloc
                                  .add(UploadImages(context, number));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : imageList(context, snapshot.data, number);
                  },
                ),
              )),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget imageList(BuildContext context, var image, int number) {
    switch (number) {
      case 1:
        interiorPhoto = image;
        break;
      case 3:
        businessLicenseHospital = image;
        break;
      default:
    }
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.135,
              width: MediaQuery.of(context).size.height * 0.135,
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
            IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                Vibrate.feedback(FeedbackType.light);
                if(number==1){
                  interiorPhoto = null;
                }else if(number==2){
                  businessLicenseHospital = null;
                }
                businessRequestBloc.add(DeleteImages(image, number));
              },
            ),
          ],
        ));
  }

  Future<void> openPlacesAutocomplete() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: Constants.Google_API_KEY,
      onError: onError,
      mode: Mode.fullscreen,
      language: "en",
      components: [],
    );

    displayPrediction(p, homeScaffoldKey.currentState);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      latitude = lat;
      longitude = lng;
      addressController.text = p.description;

      final List<Placemark> placemarks =
      await Geolocator().placemarkFromCoordinates(latitude, longitude);

      if (placemarks != null && placemarks.isNotEmpty) {
        cityName = placemarks[0].locality;
        countryName = placemarks[0].country;
        stateName = placemarks[0].administrativeArea;
        cityController.text = cityName;
      }

      setState(() {});
//    scaffold.showSnackBar(
//      SnackBar(content: Text("${p.description} - $lat/$lng"),),
//    );
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Widget nameFeild(
      String heading,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController controller,
      TextInputType textInputType,
      TextInputAction textInputAction,
      String validation(String val),{enable=true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(
            heading.toUpperCase(),
            style: TextStyle(
                fontSize: 16,
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                //fontWeight: FontWeight.w700
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                blurRadius: 6,
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: TextFormField(
            enabled: enable,
            focusNode: focusNode,
            onFieldSubmitted: (str) => nextFocusNode != null
                ? FocusScope.of(context).requestFocus(nextFocusNode)
                : null,
            textCapitalization: TextCapitalization.sentences,
            validator: validation,
            // (value) {
            //   return CommonValidator.emptyValidation(value);
            // },
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.white,
                errorStyle: TextStyle(
                color: Theme.of(context).errorColor, // or any other color
              ),
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
      ],
    );
  }

  Widget otpFeild(
    String heading,
    FocusNode focusNode,
    FocusNode nextFocusNode,
    TextEditingController controller,
    TextInputType textInputType,
    TextInputAction textInputAction,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(
            heading,
            style: TextStyle(
                fontSize: 16,
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                //fontWeight: FontWeight.w700
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            color: ColorsHelper.whiteColor(),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                blurRadius: 6,
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  this.smsOTP = value;
                },
                focusNode: focusNode,
                onFieldSubmitted: (str) => nextFocusNode != null
                    ? FocusScope.of(context).requestFocus(nextFocusNode)
                    : null,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  return CommonValidator.otpValidation(value);
                },
                controller: controller,
                keyboardType: textInputType,
                textInputAction: textInputAction,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: ColorsHelper.whiteColor()),
              ),
              (errorMessage != ''
                  ? Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    )
                  : Container()),
            ],
          ),
        ),
        SizedBox(
          height: 9,
        ),
      ],
    );
  }
}
