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

class OldFerryScheduleItem {
  final TimeOfDay departureTime;
  final ScheduleType scheduleType;
  final FerrySide ferrySide;

  const OldFerryScheduleItem({
    required this.departureTime,
    required this.scheduleType,
    required this.ferrySide,
  });

  DateTime getDateTime() {
    DateTime now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, departureTime.hour, departureTime.minute);
  }

  factory OldFerryScheduleItem.fromMap(Map<String, dynamic> json) =>
      OldFerryScheduleItem(
        departureTime: TimeOfDay(
            hour: json["departureTime"]["hour"],
            minute: json["departureTime"]["minute"]),
        scheduleType: json["scheduleType"],
        ferrySide: json["ferrySide"],
      );
}

class OldFerrySchedule {
  final List<OldFerryScheduleItem> schedule;

  const OldFerrySchedule({
    required this.schedule,
  });

  factory OldFerrySchedule.fromJson(String str) =>
      OldFerrySchedule.fromMap(json.decode(str));

  factory OldFerrySchedule.fromMap(Map<String, dynamic> json) => OldFerrySchedule(
        schedule: List<OldFerryScheduleItem>.from(json[0].map((x) => OldFerryScheduleItem.fromMap(x))),
    );
}