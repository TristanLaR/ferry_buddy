import 'package:enum_to_string/enum_to_string.dart';
import 'package:ferry_buddy/models/schedule_model.dart';
import 'package:ferry_buddy/repositories/ferry_schedule_repo.dart';
import 'package:ferry_buddy/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

// Provides [FerrySchedule]
final ferryScheduleProvider =
    FutureProvider<FerrySchedule>((ref) async {
  return ref.watch(ferryScheduleRepoProvider).loadSchedule();
});

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(ferryScheduleProvider);
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

  Widget _buildPage(FerrySchedule scheduleItem) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FerryTimer(ferrySide: FerrySide.Millidgeville),
                FerryTimer(ferrySide: FerrySide.Summerville),
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
}

class FerryTimer extends HookConsumerWidget {
  const FerryTimer({required this.ferrySide, Key? key}) : super(key: key);

  final FerrySide ferrySide; 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FerryScheduleItem nextRun = _getNextRun();
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              EnumToString.convertToString(ferrySide) +
                  " - " +
                  nextRun.departureTime.format(context),
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SlideCountdownClock(
              duration: nextRun.getDateTime().difference(DateTime.now()),
              // duration: Duration(seconds: 4),
              slideDirection: SlideDirection.Down,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onDone: () {},
            ),
          ],
        ),
      ),
    );
  }

  FerryScheduleItem _getNextRun() {
    final scheduleProvider = ;
    scheduleProvider.whenData(
      (schedule) {
        FerryScheduleItem nextRun;
        for (var item in schedule.schedule) {
          if (item.ferrySide == widget.ferrySide &&
              item.getDateTime().isAfter(DateTime.now())) {
            nextRun = item;
            break;
          }
        }
        return nextRun;
      },
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class ScheduleCardColumn extends StatelessWidget {
  final FerrySide ferrySide;

  const ScheduleCardColumn({
    this.ferrySide,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FerryScheduleItem> nextRuns = _testData();
    return Container(
      margin: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            EnumToString.convertToString(ferrySide),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                    child: Text(
                      nextRuns[index].departureTime.format(context),
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  List<FerryScheduleItem> _testData() {
    final scheduleProvider = useProvider(ferryScheduleProvider);
    scheduleProvider.whenData(
      (schedule) {
        List<FerryScheduleItem> nextRuns = [];
        int listLength = 8;
        for (var item in schedule.schedule) {
          nextRuns.add(item);
          listLength--;
          if (listLength == 0) break;
        }
        return nextRuns;
      },
    );
  }

  List<FerryScheduleItem> _getNextRuns() {
    final scheduleProvider = useProvider(ferryScheduleProvider);
    scheduleProvider.whenData(
      (schedule) {
        List<FerryScheduleItem> nextRuns = [];
        int listLength = 6;
        bool rightSide;
        bool rightTime;
        for (var item in schedule.schedule) {
          rightSide = item.ferrySide == ferrySide;
          rightTime = item
              .getDateTime()
              .isAfter(DateTime.now().subtract(Duration(hours: 5)));
          if (rightSide && rightTime) {
            nextRuns.add(item);
            listLength--;
            if (listLength == 0) break;
          }
        }
        return nextRuns;
      },
    );
  }
}