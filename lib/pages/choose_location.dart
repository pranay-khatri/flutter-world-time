import 'package:flutter/material.dart';
import 'package:world_time/services/location_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<LocationTime> locations = [
    LocationTime(location: 'Delhi', apiLocation: 'Asia/Kolkata'),
    LocationTime(location: 'Los Angeles', apiLocation: 'America/Los_Angeles'),
    LocationTime(location: 'London', apiLocation: 'Europe/London'),
    LocationTime(location: 'Sydney', apiLocation: 'Australia/Sydney'),
    LocationTime(location: 'Singapore', apiLocation: 'Asia/Singapore'),
  ];

  Future<void> updateTime(index) async {
    LocationTime lt = LocationTime(location: locations[index].location, apiLocation: locations[index].apiLocation);
    await lt.setTime();
    Navigator.pop(context, {
      'location': lt.location,
      'time': lt.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Choose a Location"),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[800],
            child: ListTile(
              title: Text(
                locations[index].location,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () => {updateTime(index)},
            ),
          );
        },
      ),
    );
  }
}
