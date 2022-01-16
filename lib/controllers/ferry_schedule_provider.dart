import 'package:ferry_buddy/models/ferry_model.dart';
import 'package:ferry_buddy/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final upcomingRunsProvider =
    StateProvider.family<FerrySchedule, FerrySide>((ref, ferrySide) {
  int listLength = 8;
  final scheduleProvider = ref.watch(ferryScheduleProvider);

  var upcomingRuns = FerrySchedule(schedule: []);

  scheduleProvider.whenData((ferrySchedule) {
    List<FerryScheduleItem> schedule = ferrySchedule.schedule
        .where((item) => item.ferrySide == ferrySide)
        .toList();
    for (int i = 0; i < schedule.length; i++) {
      List<FerryScheduleItem> items = schedule;
      if (items[i].getDateTime().isAfter(DateTime.now()) &&
          i + listLength < schedule.length) {
        upcomingRuns =
            FerrySchedule(schedule: items.sublist(i, i + listLength));
        break;
      } else if (items[i].getDateTime().isAfter(DateTime.now()) &&
          i + listLength >= schedule.length) {
        int tomorrowRuns = listLength - (schedule.length - i);
        upcomingRuns = FerrySchedule(
            schedule: items.sublist(i) + items.sublist(0, tomorrowRuns));
        break;
      } else {
        upcomingRuns = FerrySchedule(schedule: schedule.sublist(0, listLength));
      }
    }
  });
  return upcomingRuns;
});

final nextRunProvider =
    StateProvider.family<FerryScheduleItem, FerrySide?>((ref, ferrySide) {
  final scheduleProvider = ref.watch(ferryScheduleProvider);
  late FerryScheduleItem nextRun;

  scheduleProvider.whenData((ferrySchedule) {
    if (ferrySide == null) {
      if (DateTime.now().isBefore(ferrySchedule.schedule.last.getDateTime())) {
        nextRun = ferrySchedule.schedule
            .firstWhere((item) => item.getDateTime().isAfter(DateTime.now()));
      } else {
        nextRun = ferrySchedule.schedule.first;
      }
    } else {
      List<FerryScheduleItem> sideSchedule = ferrySchedule.schedule
          .where((item) => item.ferrySide == ferrySide)
          .toList();
      if (DateTime.now().isBefore(sideSchedule.last.getDateTime())) {
        nextRun = ferrySchedule.schedule
            .where((item) => item.ferrySide == ferrySide)
            .firstWhere((item) => item.getDateTime().isAfter(DateTime.now()));
      } else {
        nextRun = sideSchedule.first;
      }
    }
  });
  return nextRun;
});
