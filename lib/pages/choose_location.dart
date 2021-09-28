import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({ Key? key }) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Choose a Location"),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}