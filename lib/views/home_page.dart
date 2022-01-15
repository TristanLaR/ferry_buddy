import 'package:enum_to_string/enum_to_string.dart';
import 'package:ferry_buddy/controllers/ferry_schedule_provider.dart';
import 'package:ferry_buddy/models/ferry_model.dart';
import 'package:ferry_buddy/repositories/ferry_schedule_repo.dart';
import 'package:ferry_buddy/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Provides [FerrySchedule]
final ferryScheduleProvider = FutureProvider<FerrySchedule>((ref) async {
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
    final nextRun = ref.watch(nextRunProvider(ferrySide));
    print(nextRun);
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${ferrySide.name} - ${nextRun.departureTime.format(context)}",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    DateFormat('hh:mm:ss').format(DateTime.now()),
                    style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
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
          Text(
            ferrySide.name,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32.0),
          ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 12.0);
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: nextRuns.schedule.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(
                    child: Text(
                      nextRuns.schedule[index].departureTime.format(context),
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
}
