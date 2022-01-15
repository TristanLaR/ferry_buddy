import 'package:ferry_buddy/models/ferry_model.dart';
import 'package:ferry_buddy/views/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final upcomingRunsProvider =
    StateProvider.family<FerrySchedule, FerrySide>((ref, ferrySide) {
  int listLength = 8;
  final scheduleProvider = ref.watch(ferryScheduleProvider);
  scheduleProvider.whenData((ferrySchedule) {
    List<FerryScheduleItem> schedule = ferrySchedule.schedule
        .where((item) => item.ferrySide == ferrySide)
        .toList();
    for (int i = 0; i < schedule.length; i++) {
      List<FerryScheduleItem> items = schedule;
      if (items[i].getDateTime().isAfter(DateTime.now()) &&
          i + listLength < schedule.length) {
        return FerrySchedule(schedule: items.sublist(i, i + listLength));
      } else if (items[i].getDateTime().isAfter(DateTime.now()) &&
          i + listLength >= schedule.length) {
        int tomorrowRuns = listLength - schedule.length - i + listLength + 1;
        return FerrySchedule(
            schedule: items.sublist(i) + items.sublist(0, tomorrowRuns));
      }
    }
    return FerrySchedule(schedule: schedule.sublist(0, listLength - 1));
  });
  return FerrySchedule(schedule: []);
});

final nextRunProvider =
    StateProvider.family<FerryScheduleItem?, FerrySide?>((ref, ferrySide) {
  final scheduleProvider = ref.watch(ferryScheduleProvider);

  scheduleProvider.whenData((ferrySchedule) {
    if (ferrySide == null) {
      return ferrySchedule.schedule
          .firstWhere((item) => item.getDateTime().isAfter(DateTime.now()));
    } else {
      return ferrySchedule.schedule
          .where((item) => item.ferrySide == ferrySide)
          .firstWhere((item) => item.getDateTime().isAfter(DateTime.now()));
    }
  });
});
