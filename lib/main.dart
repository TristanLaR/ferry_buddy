import 'package:ferry_buddy/schedule.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideCountdownClock(
              duration: _getDuration(),
              slideDirection: SlideDirection.Down,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              onDone: () {},
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
