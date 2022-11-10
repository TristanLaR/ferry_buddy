import 'package:ferry_buddy/controllers/ferry_schedule_provider.dart';
import 'package:ferry_buddy/models/enums.dart';
import 'package:ferry_buddy/models/schedule_model.dart';
import 'package:ferry_buddy/repositories/ferry_schedule_repo.dart';
import 'package:ferry_buddy/widgets/background.dart';
import 'package:ferry_buddy/widgets/ferry_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Provides [Schedule]
final ferryScheduleProvider = FutureProvider<Schedule>((ref) async {
  print("ferryScheduleProvider loaded");
  return ref.watch(ferryScheduleRepoProvider).loadSchedule();
});

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(ferryScheduleProvider);

    final appLifecycleState = useAppLifecycleState();

    useEffect(() {
      print("current app state $appLifecycleState");
      if (appLifecycleState == AppLifecycleState.resumed) {
        ref.refresh(ferryScheduleProvider);
      }
      return null;
    }, [appLifecycleState]);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Background(),
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
        Flexible(
          flex: 7,
          child: ScheduleCard(),
        ),
      ],
    );
  }

  // check if the app is in the foreground
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
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
                  fontSize: 24.0,
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

class ScheduleCard extends HookConsumerWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 36.0,
        vertical: 0.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(child: ScheduleCardColumn(ferrySide: FerrySide.Summerville)),
          Flexible(
              child: ScheduleCardColumn(ferrySide: FerrySide.Millidgeville)),
        ],
      ),
    );
  }
}

class ScheduleCardColumn extends HookConsumerWidget {
  final FerrySide ferrySide;

  const ScheduleCardColumn({
    required this.ferrySide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextRuns = ref.watch(upcomingRunsProvider(ferrySide));
    return Container(
      margin: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              ferrySide.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 32.0),
          ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 12.0);
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: nextRuns.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        DateFormat.jm().format(nextRuns[index]),
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
