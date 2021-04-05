import 'package:flutter/material.dart';

enum ScheduleType { Regular, SatHoliday, Sunday }
enum FerrySide { Summerville, Millidgeville }

class FerryScheduleItem {
  final TimeOfDay departureTime;
  final ScheduleType scheduleType;
  final FerrySide ferrySide;

  const FerryScheduleItem({
    this.departureTime,
    this.scheduleType,
    this.ferrySide,
  });
}

List<FerryScheduleItem> schedule = [
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 6, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 6, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 7, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 7, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 8, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 8, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 9, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 9, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 10, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 10, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 11, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 11, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 12, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 12, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 13, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 13, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 14, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 14, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 15, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 15, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 16, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 16, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 17, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 17, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 18, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 18, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 19, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 19, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 20, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 20, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 21, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 22, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 23, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Summerville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 6, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 6, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 7, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 7, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 8, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 8, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 9, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 9, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 10, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 10, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 11, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 11, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 12, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 12, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 13, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 13, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 14, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 14, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 15, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 15, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 16, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 16, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 17, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 17, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 18, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 18, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 19, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 19, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 20, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 20, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 21, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 22, minute: 0),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 23, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
];
