import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data['location'],
              style: const TextStyle(
                fontSize: 28.0,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              data['time'],
              style: const TextStyle(fontSize: 60.0, color: Colors.white),
            ),
            const SizedBox(height: 100.0),
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'location': result['location'],
                    'time': result['time'],
                  };
                });
              },
              icon: const Icon(Icons.edit_location),
              label: const Text('Edit Location'),
            ),
          ],
        ),
      ),
    );
  }
}
