import 'dart:convert';
import 'package:clima_project/services/request_location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'services/weather.dart';

import 'package:clima_project/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String ApiKey = 'c1ab2ac9c2af1f4f49a93333795c5208';
  Request_Location get_current_location = Request_Location();
  @override
  void initState() {
    super.initState();
    get_Location_Screen();
  }

  void get_Location_Screen() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.get_location_weather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.cyanAccent,
          size: 70,
        ),
      ),
    );
  }
}
