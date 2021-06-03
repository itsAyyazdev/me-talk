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
import 'package:me_talk/src/utils/buttons/button.dart';
import 'package:me_talk/src/utils/constant_enum/constant_enum.dart';
import 'package:me_talk/src/utils/flutter_google_places/flutter_google_places.dart';
import 'package:me_talk/src/utils/popup_dialogs/Confirm_business_request_popup.dart';
import 'package:me_talk/src/utils/popup_dialogs/popup_dialogs.dart';
import 'package:me_talk/src/utils/sharedpreference_helper/sharepreference_helper.dart';
import 'package:me_talk/src/utils/validator/validator.dart';
import 'package:vibrate/vibrate.dart';

class ShopRequest extends StatefulWidget {
  static const String routeName = "ShopRequest";
  ShopRequest({Key key}) : super(key: key);

  @override
  _ShopRequestState createState() => _ShopRequestState();
}

class _ShopRequestState extends State<ShopRequest> {
  final formKey = GlobalKey<FormState>();
  BusinessRequestBloc businessRequestBloc;

  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController recommendController = TextEditingController();
  FocusNode fnodeShopName = FocusNode();
  FocusNode fnodeAddress = FocusNode();
  FocusNode fnodeCity = FocusNode();
  FocusNode fnodeOtp = FocusNode();
  FocusNode fnodeEmail = FocusNode();
  FocusNode fnodeRecomCode = FocusNode();
  String countryPhoneCode,
      smsOTP,
      phoneNumber = "",
      phoneIsoCode = "KR",
      errorMessage = '',
      typeOfBusiness;
  bool isCodeSend = true, hitSend = false, isPageLoaded = false;
  int countHitSend, subCatId;
  File portfolio, identificationCard, businessLicense;

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
//    businessRequestBloc.isOtpSendHere.listen((onData) {
//      if (onData == true) {
//        setState(() {
//          isCodeSend = onData;
//          hitSend = false;
//        });
//      }
//    });
//    businessRequestBloc.iserrorMessageHere.listen((String onData) {
//      setState(() {
//        if (onData != null) {
//          errorMessage = onData;
//        } else {
//          errorMessage = '';
//        }
//      });
//    });
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
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          fontWeight: FontWeight.w700,
                          color: ColorsHelper.themeBlackColor()),
                    ),
                    centerTitle: true,
                  ),
                  body: isPageLoaded ? shopForm() : Container(),
                  // shopForm(),
                  bottomNavigationBar: Container(
                    color: ColorsHelper.themeBlackColor(),
                    height: MediaQuery.of(context).size.height*.1,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          //openDilogBox(context,null);
                           businessRequestBloc
                               .onRequestClick(formKey)
                               .then((onValue) {
                             if (onValue) {
                               if (typeOfBusiness != null) {
                                 if (portfolio != null &&
                                     identificationCard != null && businessLicense!=null) {
                                   Map<String, dynamic> map = Map<String, dynamic>();
                                   map = {
                                     "name": shopNameController.text,
                                     "entity_type_id": '3',
                                     "category_id": subCatId,
                                     "address": addressController.text,
                                     "latitude": latitude,
                                     "longitude": longitude,
                                     "email": emailController.text,
                                     "city_id": cityName,
                                     "state_id": stateName,
                                     "country_id": countryName,
                                     "recommend_code": recommendController.text,
                                     "best_portfolio": portfolio ,
                                     "business_licence": businessLicense ,
                                     "identification_card":  identificationCard
                                   };

                                     openDilogBox(context,map);

//                                   if (phoneNumber != "") {
//                                     print("see hereeeeeeee " +
//                                         recommendController.text.length
//                                             .toString());
//                                     print(
//                                         "${addressController.text}, ${cityController.text}");
//                                     Geolocator()
//                                         .placemarkFromAddress(
//                                             "${addressController.text}, ${cityController.text}")
//                                         .then((result) {
//                                       print(
//                                           "${addressController.text}, ${cityController.text}");
//                                       print(result[0]
//                                           .position
//                                           .latitude
//                                           .toString());
//                                       print(result[0]
//                                           .position
//                                           .longitude
//                                           .toString());
//                                       if (isCodeSend) {
//                                         businessRequestBloc
//                                             .verifyNumber(smsOTP, context)
//                                             .then((onValue) {
//                                           if (onValue) {
//                                             businessRequestBloc.name =
//                                                 shopNameController.text;
//                                             businessRequestBloc.address =
//                                                 addressController.text;
//                                             businessRequestBloc.phoneCode =
//                                                 int.parse(countryPhoneCode);
//                                             businessRequestBloc.subCatId =
//                                                 subCatId;
//                                             businessRequestBloc.recomdedCode =
//                                                 recommendController
//                                                             .text.length !=
//                                                         0
//                                                     ? int.parse(
//                                                         recommendController
//                                                             .text)
//                                                     : null;
//                                             businessRequestBloc.email =
//                                                 emailController.text;
//                                             businessRequestBloc.phoneNo =
//                                                 int.parse(phoneNumber);
//                                             businessRequestBloc.requestId = 1;
//                                             businessRequestBloc.lat =
//                                                 result[0].position.latitude;
//                                             businessRequestBloc.long =
//                                                 result[0].position.longitude;
//                                             businessRequestBloc.cityName =
//                                                 cityController.text;
//                                             businessRequestBloc.portfoliopic =
//                                                 portfolio;
//                                             businessRequestBloc
//                                                     .identificationPic =
//                                                 identificationCard;
//                                             businessRequestBloc.licencepic =
//                                                 businessLicense;
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
                                   PopupDialogs.displayMessageOnly(context,
                                       StringHelper.please_select_image);
                                 }
                               } else {
                                 PopupDialogs.displayMessageOnly(
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
                                color: Colors.white,
                                //fontWeight: FontWeight.w700,
                                fontSize: 20,
                                height: 0,
                                fontFamily:
                                    FontsHelper.fonts_Nanum_Barun_Gothic),
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

  Widget shopForm() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
          key: formKey,
          autovalidate: businessRequestBloc.autoValidation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Shop name
              nameFeild(
                StringHelper.shop_name.toUpperCase(),
                fnodeShopName,
                fnodeAddress,
                shopNameController,
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
              Row(
                children: <Widget>[
                  Expanded(
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
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          StringHelper.type_of_business,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      InkWell(
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          Navigator.pushNamed(context, TypeOfBusiness.routeName,
                                  arguments: CategoryListId.Shop.index.toString())
                              .then((onValue) {
                            setState(() {
                              setTypeOfBusiness();
                            });
                          });
                        },
                        child: Container(
                          height: 43,
                          width: 150,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
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
                          child: Text(
                            typeOfBusiness ?? StringHelper.select.toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                    ],
                  )
                ],
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
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
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
                        validator: null,
                        focusNode: fnodeRecomCode,
                        controller: recommendController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: StringHelper.not_essential,
                            hintStyle: TextStyle(fontWeight: FontWeight.w500)),
                      )),
                  SizedBox(
                    height: 13,
                  ),
                ],
              ),
              //your_best_portfolio
              addItems(StringHelper.your_best_portfolio, 1,
                  businessRequestBloc.portfoliohere),
              SizedBox(
                height: 20,
              ),
              //identification_card
              addItems(StringHelper.identification_card, 2,
                  businessRequestBloc.identificationhere),
              SizedBox(
                height: 20,
              ),
              //business_license
              addItems(StringHelper.business_license, 3,
                  businessRequestBloc.businesshere),
              SizedBox(
                height: 20,
              ),
              /* //Phone No.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      StringHelper.phone_number,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        //Phone number feild
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              color: ColorsHelper.whiteColor(),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[500],
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: InternationalPhoneInput(
                              onPhoneNumberChange: onPhoneNumberChange,
                              initialPhoneNumber: phoneNumber,
                              initialSelection: phoneIsoCode,
                              errorMaxLines: 1,
                              // errorText: '',
                              //  errorStyle: TextStyle(fontSize: 1),
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      //send button
                      ButtonColor(
                        height: 57,
                        width: countHitSend == 0 ? 60 : 80,
                        color: ColorsHelper.themeBlackColor(),
                        onPressed: () {
                          Vibrate.feedback(FeedbackType.light);
                          if (phoneNumber != null) {
                            businessRequestBloc
                                .verifyPhone(phoneNumber)
                                .then((onValue) {
                              setState(() {
                                hitSend = true;
                                countHitSend++;
                              });
                            });
                          }
                        },
                        child: !hitSend
                            ? Text(
                                countHitSend == 0
                                    ? StringHelper.send
                                    : StringHelper.reSend,
                                style: TextStyle(
                                    color: ColorsHelper.whiteColor(),
                                    fontFamily:
                                        FontsHelper.fonts_Nanum_Barun_Gothic,
                                    fontWeight: FontWeight.w700),
                              )
                            : Center(
                                child: SpinKitCircle(
                                color: ColorsHelper.whiteColor(),
                                size: 25.0,
                              )),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
//otp
              isCodeSend
                  ? otpFeild(
                      StringHelper.very_code,
                      fnodeOtp,
                      null,
                      otpController,
                      TextInputType.number,
                      TextInputAction.done,
                    )
                  : Container(),*/
              //Email
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
          alignment: Alignment.center,
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
        )
      ],
    );
  }

  Widget imageList(BuildContext context, var image, int number) {
    switch (number) {
      case 1:
        portfolio = image;
        break;
      case 2:
        identificationCard = image;
        break;
      case 3:
        businessLicense = image;
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
              // width: MediaQuery.of(context).size.height * 0.13,
              // height: double.infinity,
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
                  portfolio = null;
                }else if(number==2){
                  identificationCard = null;
                }else{
                  businessLicense = null;
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
            heading,
            style: TextStyle(
                fontSize: 16,
                fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                fontWeight: FontWeight.w700),
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
            focusNode: focusNode,
            enabled: enable,
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
                fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
                fontWeight: FontWeight.w700),
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
