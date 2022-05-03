import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Request_Location {
  dynamic latitude;
  dynamic longitude;
  Future getlocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        Geolocator.requestPermission();
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
