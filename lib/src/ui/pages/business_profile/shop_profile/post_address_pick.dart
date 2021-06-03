import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:me_talk/src/blocs/bloc_shop_profile/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/app_navigator/app_navigator.dart';
import 'package:place_picker/place_picker.dart';
import 'package:vibrate/vibrate.dart';
import 'dart:async';

class PostAddressPick extends StatefulWidget {
  final int subCatProfileId;
  static const String routeName = "postAddressPick";
  PostAddressPick({Key key, this.subCatProfileId}) : super(key: key);

  @override
  _PostAddressPickState createState() => _PostAddressPickState();
}

class _PostAddressPickState extends State<PostAddressPick> {
  void showPlacePicker() async {
    fnodeMainAddress.unfocus();
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(StringHelper.maps_api_key)));

    // Handle the result in your way

    if (result != null) {
      setState(() {
        locationResult = result;
        mainAddressController.text = result.formattedAddress;
        detailAddressController.text = result.locality;
        _kPointer = CameraPosition(
          target: LatLng(
              locationResult.latLng.latitude, locationResult.latLng.longitude),
          zoom: 14.4746,
        );
        _gotoHere(_kPointer);
        pointMark.add(Marker(
            markerId: MarkerId("Your Location"),
            position: LatLng(locationResult.latLng.latitude,
                locationResult.latLng.longitude)));
      });
    } else {
      locationResult = result;
    }
  }

  ShopProfileBloc shopProfileBloc = ShopProfileBloc();
  final formKey = GlobalKey<FormState>();
  TextEditingController mainAddressController = TextEditingController();
  TextEditingController detailAddressController = TextEditingController();
  FocusNode fnodeMainAddress = FocusNode();
  FocusNode fnodeSubAddress = FocusNode();
  Set<Marker> pointMark = Set();
  LocationResult locationResult;
  CameraPosition _kPointer = CameraPosition(
    target: LatLng(22.9, 77.4),
    zoom: 14.4746,
  );
  @override
  void initState() {
    start();
    fnodeMainAddress.addListener(showPlacePicker);
    super.initState();
  }

  @override
  void dispose() {
    shopProfileBloc.close();
    super.dispose();
  }

  start() async {
    LocationData ld = await Location().getLocation();
    print(ld.heading);
    setState(() {
      _kPointer = CameraPosition(
        target: LatLng(ld.latitude, ld.longitude),
        zoom: 14.4746,
      );
      _gotoHere(_kPointer);
      pointMark.add(Marker(
          markerId: MarkerId("Your Location"),
          position: LatLng(ld.latitude, ld.longitude)));
    });
  }

  Future<void> _gotoHere(CameraPosition camPos) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(camPos));
  }

  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsHelper.whiteColor(),
        appBar: AppBar(
          elevation: 6,
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
            StringHelper.address,
            style: TextStyle(fontSize: 14,
                //fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            //publish button
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  AppNavigator.popBackStack(context);
                  // if (locationResult != null) {
                  //   print("Publish");

                  //   // shopProfileBloc.updateCategoryDetails(
                  //   //     context,
                  //   //     widget.subCatProfileId,
                  //   //     null,
                  //   //     // locationResult.formattedAddress,
                  //   //     locationResult.locality,
                  //   //     null,
                  //   //     locationResult.latLng.latitude,
                  //   //     locationResult.latLng.longitude,
                  //   //     null,
                  //   //     null,
                  //   //     null,
                  //   //     null,
                  //   //     null,
                  //   //     null);
                  // } else {
                  //   PopupDialogs.displayMessageOnly(
                  //       context, "Please select location");
                  // }
                },
                child: Container(
                  padding:
                      EdgeInsets.only(right: 5, top: 15, bottom: 15, left: 5),
                  child: Text(
                    StringHelper.publish,
                    style: TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                        color: ColorsHelper.themeBlackColor()),
                  ),
                ),
              ),
            ),
          ],
        ),
        //body
        body: BlocProvider(
          create: (BuildContext context) => shopProfileBloc,
          child: BlocBuilder(
            bloc: shopProfileBloc,
            builder: (BuildContext context, ShopProfileState state) {
              if (state is InitialShopProfileState) {
                return postAddressBody();
              } else {
                return Container(
                  color: Colors.black,
                );
              }
            },
          ),
        ));
  }

  Widget postAddressBody() {
    return Container(
      //
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //thumnail
          Container(padding: EdgeInsets.all(15), child: shopForm()),
          SizedBox(
            height: 15,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: pointMark,
              initialCameraPosition: _kPointer,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget shopForm() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 20),
        child: Form(
          key: formKey,
          autovalidate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(StringHelper.address),
              SizedBox(
                height: 15,
              ),
              //main address
              nameFeild(
                  StringHelper.main_address,
                  fnodeMainAddress,
                  fnodeSubAddress,
                  mainAddressController,
                  TextInputType.text,
                  TextInputAction.next,
                  null),
              SizedBox(
                height: 30,
              ),
              //detailed address
              nameFeild(
                  StringHelper.sub_address,
                  fnodeSubAddress,
                  null,
                  detailAddressController,
                  TextInputType.text,
                  TextInputAction.next,
                  null,
                  disabled: true),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget nameFeild(
      String heading,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController controller,
      TextInputType textInputType,
      TextInputAction textInputAction,
      String validation(String val),
      {bool disabled = false}) {
    return Container(
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
        enabled: !disabled,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            hintText: heading,
            hintStyle: TextStyle(
                //fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
               // fontWeight: FontWeight.w700,
                color: Colors.black),
            border: InputBorder.none,
            fillColor: Colors.white),
      ),
    );
  }
}
