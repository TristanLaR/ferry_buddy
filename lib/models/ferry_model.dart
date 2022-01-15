import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScheduleType {
  Regular,
  SatHoliday,
  Sunday,
}

enum FerrySide {
  Summerville,
  Millidgeville,
}

class FerrySchedule {
  final List<FerryScheduleItem> schedule;

  const FerrySchedule({
    required this.schedule,
  });

  factory FerrySchedule.fromJson(String str) =>
      FerrySchedule.fromMap(json.decode(str));

  factory FerrySchedule.fromMap(List<dynamic> json) => FerrySchedule(
        schedule: List<FerryScheduleItem>.from(
            json.map((x) => FerryScheduleItem.fromMap(x))),
      );

  sort() {
    this.schedule.sort((a,b) => a.getDateTime().compareTo(b.getDateTime()));
  }
}

class FerryScheduleItem {
  final TimeOfDay departureTime;
  final String scheduleType;
  // enum
  final FerrySide ferrySide;
  FerryScheduleItem({
    required this.departureTime,
    required this.scheduleType,
    required this.ferrySide,
  });

  FerryScheduleItem copyWith({
    TimeOfDay? departureTime,
    String? scheduleType,
    FerrySide? ferrySide,
  }) {
    return FerryScheduleItem(
      departureTime: departureTime ?? this.departureTime,
      scheduleType: scheduleType ?? this.scheduleType,
      ferrySide: ferrySide ?? this.ferrySide,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'departureTime': Map<String, dynamic>.from({
        'hour': departureTime.hour,
        'minute': departureTime.minute,
      }),
      'scheduleType': scheduleType,
      'ferrySide': ferrySide.index,
    };
  }

  factory FerryScheduleItem.fromMap(Map<String, dynamic> map) {
    return FerryScheduleItem(
      departureTime: TimeOfDay(
          hour: map["departureTime"]["hour"],
          minute: map["departureTime"]["minute"]),
      scheduleType: map['scheduleType'] ?? '',
      ferrySide: FerrySide.values.singleWhere((side) => side.name == map['ferrySide']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FerryScheduleItem.fromJson(String source) =>
      FerryScheduleItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'FerryScheduleItem(departureTime: $departureTime, scheduleType: $scheduleType, ferrySide: $ferrySide)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FerryScheduleItem &&
        other.departureTime == departureTime &&
        other.scheduleType == scheduleType &&
        other.ferrySide == ferrySide;
  }

  @override
  int get hashCode =>
      departureTime.hashCode ^ scheduleType.hashCode ^ ferrySide.hashCode;

  DateTime getDateTime() {
    DateTime now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, departureTime.hour, departureTime.minute);
  }
}

class DepartureTime {
  final int hour;
  final int minute;
  DepartureTime({
    required this.hour,
    required this.minute,
  });

  DepartureTime copyWith({
    int? hour,
    int? minute,
  }) {
    return DepartureTime(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  factory DepartureTime.fromMap(Map<String, dynamic> map) {
    return DepartureTime(
      hour: map['hour']?.toInt() ?? 0,
      minute: map['minute']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartureTime.fromJson(String source) =>
      DepartureTime.fromMap(json.decode(source));

  @override
  String toString() => 'DepartureTime(hour: $hour, minute: $minute)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DepartureTime &&
        other.hour == hour &&
        other.minute == minute;
  }

  @override
  int get hashCode => hour.hashCode ^ minute.hashCode;
}
