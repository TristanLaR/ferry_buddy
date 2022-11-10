import 'package:ferry_buddy/controllers/ferry_schedule_provider.dart';
import 'package:ferry_buddy/models/enums.dart';
import 'package:ferry_buddy/models/schedule_model.dart';
import 'package:ferry_buddy/repositories/ferry_schedule_repo.dart';
import 'package:ferry_buddy/views/home_page.dart';
import 'package:ferry_buddy/widgets/background.dart';
import 'package:ferry_buddy/widgets/ferry_timer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class LandscapeView extends HookConsumerWidget {
  const LandscapeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(ferryScheduleProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightBlue.shade200,
                  Colors.blue.shade700,
                ],
              ),
            ),
          ),
          schedule.when(
            data: (schedule) => _buildPage(schedule),
            loading: () => Container(),
            error: (error, _) => Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Schedule scheduleItem) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimerWidget(ferrySide: FerrySide.Summerville),
                TimerWidget(ferrySide: FerrySide.Millidgeville),
                // ScheduleCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TimerWidget extends HookConsumerWidget {
  const TimerWidget({required this.ferrySide, Key? key}) : super(key: key);

  final FerrySide ferrySide;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextRun = ref.watch(upcomingRunsProvider(ferrySide))[0];
    // print(nextRun);
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "${ferrySide.name} - ${DateFormat.jm().format(nextRun)}",
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Center(
                  child: FerryTimer(
                    countdownTime: nextRun,
                    style: TextStyle(
                      fontSize: 64.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
