import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/schedule_model.dart';

final ferryScheduleRepoProvider =
    Provider<FerryScheduleRepository>((ref) => FerryScheduleRepository());

class FerryScheduleRepository {
  Future<String> _loadScheduleAsset() async {
    return await rootBundle.loadString('assets/schedule.json');
  }

  Future<Schedule> loadSchedule() async {
    String jsonString = await _loadScheduleAsset();
    return scheduleFromJson(jsonString);
  }
}
