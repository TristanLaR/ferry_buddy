import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));
Schedule scheduleFromLocalJson(String str) =>
    Schedule.fromLocalJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    required this.lastUpdated,
    required this.summervilleSchedule,
    required this.millidgevilleSchedule,
  });

  DateTime lastUpdated;
  List<DateTime> summervilleSchedule;
  List<DateTime> millidgevilleSchedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        summervilleSchedule: List<DateTime>.from(
            json["SummervilleSchedule"].map((x) => DateTime.parse(x))),
        millidgevilleSchedule: List<DateTime>.from(
            json["MillidgevilleSchedule"].map((x) => DateTime.parse(x))),
      );

  // parse json from local storage
  factory Schedule.fromLocalJson(Map<String, dynamic> json) => Schedule(
        // update lastUpdated from json
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        // parse json dates and set date to today, duplicate items in list and add 1 day
        summervilleSchedule: List<DateTime>.from(json["SummervilleSchedule"]
            .map((x) => DateTime.parse(x))
            .map((x) => DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, x.hour, x.minute))
            .toList()
          ..addAll(json["SummervilleSchedule"]
              .map((x) => DateTime.parse(x))
              .map((x) => DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day + 1, x.hour, x.minute))
              .toList())),
        // parse json dates and set date to today, duplicate items in list and add 1 day
        millidgevilleSchedule: List<DateTime>.from(json["MillidgevilleSchedule"]
            .map((x) => DateTime.parse(x))
            .map((x) => DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, x.hour, x.minute))
            .toList()
          ..addAll(json["MillidgevilleSchedule"]
              .map((x) => DateTime.parse(x))
              .map((x) => DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day + 1, x.hour, x.minute))
              .toList())),
      );

  Map<String, dynamic> toJson() => {
        "lastUpdated": lastUpdated.toIso8601String(),
        "SummervilleSchedule": List<dynamic>.from(
            summervilleSchedule.map((x) => x.toIso8601String())),
        "MillidgevilleSchedule": List<dynamic>.from(
            millidgevilleSchedule.map((x) => x.toIso8601String())),
      };
}
