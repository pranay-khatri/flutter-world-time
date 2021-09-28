import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/location');
          },
          child: const Text('Choose a location'),
        ),
        )
      ],
    );
  }
}
