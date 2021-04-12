import 'package:flutter/material.dart';
import 'dart:convert';

enum ScheduleType {
  Regular,
  SatHoliday,
  Sunday,
}

enum FerrySide {
  Summerville,
  Millidgeville,
}

class FerryScheduleItem {
  final TimeOfDay departureTime;
  final ScheduleType scheduleType;
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

  factory FerryScheduleItem.fromJson(String str) =>
      FerryScheduleItem.fromMap(json.decode(str));

  factory FerryScheduleItem.fromMap(Map<String, dynamic> json) =>
      FerryScheduleItem(
        departureTime: TimeOfDay(
            hour: json["departureTime"]["hour"],
            minute: json["departureTime"]["minute"]),
        scheduleType: json["scheduleType"],
        ferrySide: json["ferrySide"],
      );
}