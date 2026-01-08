import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Default values to avoid null crash
  Map<String, dynamic> data = {
    'location': 'Loading...',
    'time': 'Loading...',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null && args is Map<String, dynamic>) {
      setState(() {
        data = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: const Icon(Icons.edit_location),
                label: const Text("Edit Location"),
              ),

              const SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'] ?? 'Loading...',
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              Text(
                data['time'] ?? 'Loading...', //exception handling here 
                style: const TextStyle(
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
