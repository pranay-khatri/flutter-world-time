import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/location_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loadingText = "loading...";

  void setupLocationTime() async {
    LocationTime lt = LocationTime(location: 'Berlin', apiLocation: 'Europe/Berlin');
    await lt.setTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': lt.location,
      'time': lt.time,
      'isDay': lt.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setupLocationTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
