import 'dart:convert';

import 'package:http/http.dart';

class LocationTime {
  String location;
  String time = "";
  bool isDay = true;
  String apiLocation;

  LocationTime({required this.location, required this.apiLocation});

  Future<void> setTime() async {
    try {
      Uri fullEndPoint = Uri.parse('http://worldtimeapi.org/api/timezone/$apiLocation');
      Response response = await get(fullEndPoint);
      Map body = jsonDecode(response.body);
      time = body['datetime'];
    } catch (e) {
      time = 'Error in getting time';
    }
  }

}