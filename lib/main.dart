import 'package:ferry_buddy/schedule.dart';
import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:intl/intl.dart';

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
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FerryTimer(ferrySide: FerrySide.Millidgeville),
          FerryTimer(ferrySide: FerrySide.Summerville),
        ],
      ),
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
  UniqueKey _buildKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    FerryScheduleItem nextRun = _getNextRun();
    return Container(
      key: _buildKey,
      // height: 200.0,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              EnumToString.convertToString(widget.ferrySide) +
                  " - " +
                  // DateFormat("h:mma").format(nextRun.departureTime) +
                  nextRun.departureTime.format(context),
              style: TextStyle(fontSize: 24.0),
            ),
            SlideCountdownClock(
              duration: nextRun.getDateTime().difference(DateTime.now()),
              // duration: Duration(seconds: 4),
              slideDirection: SlideDirection.Down,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              onDone: () {
                setState(() {
                  _buildKey = UniqueKey();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  FerryScheduleItem _getNextRun() {
    FerryScheduleItem nextRun;
    for (var item in schedule) {
      if (item.ferrySide == widget.ferrySide &&
          item.getDateTime().isAfter(DateTime.now())) {
        nextRun = item;
        break;
      }
    }
    return nextRun;
  }
}
