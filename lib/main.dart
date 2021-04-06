import 'package:ferry_buddy/schedule.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferry Buddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FerryTimer(ferrySide: FerrySide.Millidgeville),
    );
  }
}

class FerryTimer extends StatefulWidget {
  final FerrySide ferrySide;
  const FerryTimer({
    this.ferrySide,
    Key key,
  }) : super(key: key);

  @override
  FerryTimerState createState() => FerryTimerState();
}

class FerryTimerState extends State<FerryTimer> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              EnumToString.convertToString(widget.ferrySide),
              style: TextStyle(fontSize: 36.0),
            ),
            SlideCountdownClock(
              duration: _getDuration(),
              // duration: Duration(seconds: 4),
              slideDirection: SlideDirection.Down,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              onDone: () {
                setState(() {
                  _scaffoldKey = GlobalKey();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Duration _getDuration() {
    FerryScheduleItem nextRun;
    for (var item in schedule) {
      if (item.getDateTime().isAfter(DateTime.now())) {
        nextRun = item;
        break;
      }
    }
    return nextRun.getDateTime().difference(DateTime.now());
  }
}
