import 'package:ferry_buddy/schedule.dart';
import 'package:flutter/material.dart';
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
          // ScheduleCard(),
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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              EnumToString.convertToString(widget.ferrySide) +
                  " - " +
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

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ScheduleCardColumn(ferrySide: FerrySide.Summerville,)
        ],
      ),
    );
  }
}

class ScheduleCardColumn extends StatelessWidget {
  final FerrySide ferrySide;

  const ScheduleCardColumn({
    this.ferrySide,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FerryScheduleItem> nextRuns = _getNextRuns();
    return Container(
      child: Column(
        children: [
          Text(
            EnumToString.convertToString(ferrySide),
            style: TextStyle(fontSize: 18.0),
          ),
          ListView.builder(
            itemCount: nextRuns.length,
            itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(nextRuns[index].departureTime.format(context)),
            );
           },
          ),
        ],
      ),
    );
  }

  List<FerryScheduleItem> _getNextRuns() {
    List<FerryScheduleItem> nextRuns;
    int listLength = 6;
    for (var item in schedule) {
      if (item.ferrySide == ferrySide &&
          item.getDateTime().isAfter(DateTime.now())) {
        nextRuns.add(item);
        listLength--;
        if (listLength == 0) break;
      }
    }
    return nextRuns;
  }
}
