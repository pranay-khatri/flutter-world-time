import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class LocationTime {
  String location;
  String time = "";
  bool isDay = true;
  String apiLocation;
  String offSet = "";

  LocationTime({required this.location, required this.apiLocation});

  Future<void> setTime() async {
    try {
      Uri fullEndPoint =
          Uri.parse('http://worldtimeapi.org/api/timezone/$apiLocation');
      Response response = await get(fullEndPoint);
      Map body = jsonDecode(response.body);
      String utcTime = body['utc_datetime'];
      offSet = body['utc_offset'];
      DateTime now = DateTime.parse(utcTime);
      now = offSet.codeUnitAt(0) == 43
          ? now.add(Duration(
              hours: int.parse(offSet.substring(1, 3)),
              minutes: int.parse(offSet.substring(4, offSet.length))))
          : now.subtract(Duration(
              hours: int.parse(offSet.substring(1, 3)),
              minutes: int.parse(offSet.substring(4, offSet.length))));
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Error in getting time';
    }
  }
}
