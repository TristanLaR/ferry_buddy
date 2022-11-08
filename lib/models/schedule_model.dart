import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
    Schedule({
        this.lastUpdated,
        this.summervilleSchedule,
        this.millidgevilleSchedule,
    });

    DateTime lastUpdated;
    List<DateTime> summervilleSchedule;
    List<DateTime> millidgevilleSchedule;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        summervilleSchedule: List<DateTime>.from(json["SummervilleSchedule"].map((x) => DateTime.parse(x))),
        millidgevilleSchedule: List<DateTime>.from(json["MillidgevilleSchedule"].map((x) => DateTime.parse(x))),
    );
    
    // TODO: If local, change parsed date to today + duplicate list for tomorrow
    factory Schedule.fromLocalJson(Map<String, dynamic> json) => Schedule(
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        summervilleSchedule: List<DateTime>.from(json["SummervilleSchedule"].map((x) => DateTime.parse(x))),
        millidgevilleSchedule: List<DateTime>.from(json["MillidgevilleSchedule"].map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "lastUpdated": lastUpdated.toIso8601String(),
        "SummervilleSchedule": List<dynamic>.from(summervilleSchedule.map((x) => x.toIso8601String())),
        "MillidgevilleSchedule": List<dynamic>.from(millidgevilleSchedule.map((x) => x.toIso8601String())),
    };
}