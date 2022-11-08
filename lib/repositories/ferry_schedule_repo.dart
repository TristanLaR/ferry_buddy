import 'dart:convert';

import 'package:ferry_buddy/models/ferry_model.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ferryScheduleRepoProvider =
    Provider<FerryScheduleRepository>((ref) => FerryScheduleRepository());

class FerryScheduleRepository {
  Future<String> _loadScheduleAsset() async {
    return await rootBundle.loadString('assets/schedule.json');
  }

  Future<FerrySchedule> loadLocalSchedule() async {
    String jsonString = await _loadScheduleAsset();
    return new FerrySchedule.fromJson(jsonString);
  }
}
