import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'main_schedule.g.dart';

@HiveType(typeId: 1)
enum ScheduleType {
  @HiveField(0)
  Regular,
  @HiveField(1)
  SatHoliday,
  @HiveField(2)
  Sunday,
}

@HiveType(typeId: 2)
enum FerrySide {
  @HiveField(0)
  Summerville,
  @HiveField(1)
  Millidgeville,
}

@HiveType(typeId: 0)
class FerryScheduleItem {
  @HiveField(0)
  final TimeOfDay departureTime;
  @HiveField(1)
  final ScheduleType scheduleType;
  @HiveField(2)
  final FerrySide ferrySide;

  const FerryScheduleItem({
    this.departureTime,
    this.scheduleType,
    this.ferrySide,
  });

  DateTime getDateTime() {
    DateTime now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, departureTime.hour, departureTime.minute);
  }
}

const List<FerryScheduleItem> schedule = [
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
      departureTime: TimeOfDay(hour: 6, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 6, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 7, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 7, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 8, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 8, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 9, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 9, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 10, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 10, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 11, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 11, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 12, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 12, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 13, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 13, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 14, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 14, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 15, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 15, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 16, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 16, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 17, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 17, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 18, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 18, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 19, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 19, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 20, minute: 15),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 20, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 21, minute: 30), // Night Schedule
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 22, minute: 30),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
  FerryScheduleItem(
      departureTime: TimeOfDay(hour: 23, minute: 45),
      scheduleType: ScheduleType.Regular,
      ferrySide: FerrySide.Millidgeville),
];
