import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/widget_helper/widget_helper.dart';

class MapViewScreen extends StatefulWidget {
  @override
  _MapViewScreenState createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  int markerIdCounter = 0;
  Completer<GoogleMapController> mapController = Completer();
  CameraPosition cameraPosition;
  //Set<Marker> markers = Set();
  LatLng initLatLog, markerLatLog;
  String address = '';
  Marker marker;
  Position position;

  @override
  void initState() {
  
    super.initState();
    initLatLog = LatLng(0.0, 0.0);
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initLatLog,
              zoom: 11.0,
            ),
            myLocationButtonEnabled: false,
            markers: Set<Marker>.of(markers.values),
            onCameraMove: (CameraPosition position) {
              if (markers.length > 0) {
                markerLatLog = position.target;
                MarkerId markerId = MarkerId(markerIdVal());
                Marker marker = markers[markerId];
                Marker updatedMarker = marker.copyWith(
                  positionParam: position.target,
                );

                setState(() {
                  markers[markerId] = updatedMarker;
                });
              }
              getAddress(position.target.latitude, position.target.longitude);
              //updatePosition(_position);
            },
            //onCameraIdle: (){},
            onMapCreated: _onMapCreated,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 44, bottom: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  padding: const EdgeInsets.only(left: 20),
                  icon: Image.asset(
                    ImageAssets.close_dialog,
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration:
                            WidgetHelper.customBoxDecorationWithOutShadow(
                                Colors.white, Colors.black12, 1, 0),
                        width: MediaQuery.of(context).size.width - 50,
                        height: 80,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              address,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: RaisedButton(
                            color: ColorsHelper.pinkStarFillColor(),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              StringHelper.str_ok,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontFamily:
                                      FontsHelper.fonts_Nanum_Barun_Gothic),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController.complete(controller);
    if (initLatLog != null) {
      MarkerId markerId = MarkerId(markerIdVal());
      LatLng position = initLatLog;
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        draggable: false,
      );
      setState(() {
        markers[markerId] = marker;
      });

      Future.delayed(Duration(seconds: 1), () async {
        GoogleMapController controller = await mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 10.0,
            ),
          ),
        );
      });
    }
  }

  void updatePosition(CameraPosition _position) {
    Position newMarkerPosition = Position(
        latitude: _position.target.latitude,
        longitude: _position.target.longitude);
    setState(() {
      marker = marker.copyWith(
          positionParam:
              LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
    });
  }

  String markerIdVal({bool increment = false}) {
    String val = 'marker_id_$markerIdCounter';
    if (increment) markerIdCounter++;
    return val;
  }

  /*showMap() {
    mapView.show(
        new MapOptions(
          mapViewType: MapViewType.normal,
          showUserLocation: true,
          showMyLocationButton: false,
          showCompassButton: false,
          initialCameraPosition: cameraPosition,
          hideToolbar: true,));

    mapView.addMarker(marker);

    mapView.onAnnotationDragEnd.listen((markerMap) {
      var marker = markerMap.keys.first;
      var location = markerMap[marker]; // The actual position of the marker after finishing the dragging.
      print(location.latitude);
    });

  }*/

  Future<Position> getCurrentLocation() async {
    Position pos = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    position = pos;
    markerLatLog = LatLng(position.latitude, position.longitude);
    if (markerLatLog != null) {
      MarkerId markerId = MarkerId(markerIdVal());
      LatLng position = markerLatLog;
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        draggable: false,
      );
      setState(() {
        markers[markerId] = marker;
      });

      Future.delayed(Duration(seconds: 1), () async {
        GoogleMapController controller = await mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 17.0,
            ),
          ),
        );
      });
    }
    return pos;
  }

  Future<String> getAddress(latitude, longitude) async {
    String getAddress = '';
    final List<Placemark> placeMarks =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    if (placeMarks != null && placeMarks.isNotEmpty) {
      getAddress = placeMarks.first.name;
      address = getAddress;
//      latLong = LatLng(latitude, longitude);
//      cameraPosition = CameraPosition(target: latLong, zoom: 11);
//      marker = Marker(markerId: MarkerId('1'), draggable: true, position: latLong);
//      markers.clear();
//      markers.add(marker);
      print(address);
      setState(() {});
    }
    return getAddress;
  }
}
