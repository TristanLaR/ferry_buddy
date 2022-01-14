import 'package:ferry_buddy/models/schedule_model.dart';
import 'package:ferry_buddy/views/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final upcomingRunsProvider = StateProvider<FerrySchedule>((ref) {
  int listLength = 16;
  final scheduleProvider = ref.watch(ferryScheduleProvider);
  scheduleProvider.whenData((ferrySchedule) {
    for (int i = 0; i < ferrySchedule.schedule.length; i++) {
      List<FerryScheduleItem> item = ferrySchedule.schedule;
      if (item[i].getDateTime().isAfter(DateTime.now()) &&
          i + listLength < ferrySchedule.schedule.length) {
        return FerrySchedule(schedule: item.sublist(i, i + listLength));
      } else if (item[i].getDateTime().isAfter(DateTime.now()) &&
          i + listLength >= ferrySchedule.schedule.length) {
        int tomorrowRuns =
            listLength - ferrySchedule.schedule.length - i + listLength + 1;
        return FerrySchedule(
            schedule: item.sublist(i) + item.sublist(0, tomorrowRuns));
      }
    }
    return FerrySchedule(
        schedule: ferrySchedule.schedule.sublist(0, listLength - 1));
  });
  return FerrySchedule(schedule: []);
});

final nextRunProvider =
    StateProvider.family<FerryScheduleItem, FerrySide?>((ref, ferrySide) {
  final upcomingRuns = ref.watch(upcomingRunsProvider);

  if (ferrySide == null) {
    return upcomingRuns.schedule.first;
  } else {
    return upcomingRuns.schedule.firstWhere((item) => item.ferrySide == ferrySide);
  }
});
