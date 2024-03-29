import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/schedule_model.dart';

final ferryScheduleRepoProvider =
    Provider<FerryScheduleRepository>((ref) => FerryScheduleRepository());

class FerryScheduleRepository {
  Future<String> _loadScheduleAsset() async {
    return await rootBundle.loadString('assets/testSchedule.json');
  }

  Future<Schedule> loadSchedule() async {
    print("LoadSchedule called");
    String jsonString = await _loadScheduleAsset();
    return scheduleFromLocalJson(jsonString);
  }
}
