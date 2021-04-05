import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }

  Widget _buildCountdown(BuildContext context) {
    final DateTime currentTime = DateTime.now();
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Summerville: ",
              style: TextStyle(fontSize: 18.0),
            )
          ],
        )
      ],
    );
  }
}
