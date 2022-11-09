import 'package:ferry_buddy/views/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/enums.dart';

final upcomingRunsProvider =
    StateProvider.family<List<DateTime>, FerrySide>((ref, ferrySide) {
  int listLength = 8;
  final scheduleProvider = ref.watch(ferryScheduleProvider);

  List<DateTime> upcomingRuns = [];

  scheduleProvider.whenData((ferrySchedule) {
    switch (ferrySide) {
      case FerrySide.Summerville:
        // upcomingRuns = ferrySchedule.summervilleSchedule.where((element) => false);
        upcomingRuns = ferrySchedule.summervilleSchedule
            .where((item) => item.isAfter(DateTime.now()))
            .take(listLength)
            .toList();
        break;
      case FerrySide.Millidgeville:
        upcomingRuns = ferrySchedule.millidgevilleSchedule
            .where((item) => item.isAfter(DateTime.now()))
            .take(listLength)
            .toList();
        break;
    }
  });

  print("Next run: ${upcomingRuns.first}");
  return upcomingRuns;
});
