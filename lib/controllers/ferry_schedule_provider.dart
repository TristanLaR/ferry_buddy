import 'package:ferry_buddy/models/ferry_model.dart';
import 'package:ferry_buddy/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final upcomingRunsProvider =
    StateProvider.family<FerrySide>((ref, ferrySide) {
  int listLength = 8;
  final scheduleProvider = ref.watch(ferryScheduleProvider);

  List<DateTime> upcomingRuns = List<DateTime> [];

  scheduleProvider.whenData((ferrySchedule) {
    switch (ferrySide) {
      case FerrySide.Summerville:
        upcomingRuns = ferrySchedule.summervilleSchedule.where((item) => item > DateTime.now()).take(listLength);
        break;
      case FerrySide.Millidgeville:
        upcomingRuns = ferrySchedule.millidgevilleSchedule.where((item) => item > DateTime.now()).take(listLength);
        break;
    }
  });

  return upcomingRuns;
});