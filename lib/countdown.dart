import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class CountDownWidget extends StatefulWidget {
  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SlideCountdownClock(
          duration: Duration(minutes: 10),
          slideDirection: SlideDirection.Up,
          separator: ":",
          textStyle: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          onDone: () {},
        ),
      ],
    );
  }
}
