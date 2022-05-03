import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});
  final url;

  Future getData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.requestPermission();
    } else {
      try {
        http.Response response = await http.get(Uri.parse(url));
        var data = response.body;
        return jsonDecode(data);
      } catch (e) {
        print(e);
      }
    }
  }
}
