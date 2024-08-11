import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/functions/dialog_open_settings.dart';
import '../core/functions/snack_bar_denied.dart';

abstract class LocationController extends GetxController {
  getLocation();
  getYourDistance(double lat, double long);
}

class LocationControllerImp extends LocationController {
  double? currentDistance;
  bool? isLoading;
  Position? position;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  GoogleMapController? mapController;

  @override
  getLocation() async {
    markers.clear();
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      dialogOpenSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        snackBarDenied();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      snackBarDenied();
      return;
    }

    isLoading = true;
    update();
    position = await Geolocator.getCurrentPosition();

    final lat = position!.latitude;
    final log = position!.longitude;

    getYourDistance(lat, log);
    getMap();
  }

  void getMap() async {
    LatLng startLocation = LatLng(position!.latitude, position!.longitude);
    LatLng endLocation = const LatLng(31.776224226203812, 35.23569437331529);
    PolylinePoints polylinePoints = PolylinePoints();
    String googleAPiKey = "AIzaSyDbbYxpFOFaIUeF_wVcq4VPrDn0rkGjltI";
    List<LatLng> polylineCoordinates = [];

    markers.add(Marker(
      //add distination location marker
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'Al-Aqsa Mosque',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      polylineCoordinates.add(startLocation);
      polylineCoordinates.add(endLocation);
    }

    addPolyLine(polylineCoordinates);
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColor.textColorRed,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;

    isLoading = false;
    update();
  }

  @override
  getYourDistance(double lat, double long) {
    const double latOfMosque = 31.776224226203812;
    const double longOfMosque = 35.23569437331529;
    double distanceInMeters =
        Geolocator.distanceBetween(lat, long, latOfMosque, longOfMosque);
    currentDistance = distanceInMeters / 1000;
  }
}
