import 'package:ferry_buddy/models/main_schedule.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ferryScheduleRepoProvider =
    Provider<FerryScheduleRepository>((ref) => FerryScheduleRepository());

class FerryScheduleRepository {
  Future<String> _loadScheduleAsset() async {
    return await rootBundle.loadString('assets/schedule.json');
  }

  Future<FerrySchedule> loadSchedule() async {
    String jsonString = await _loadScheduleAsset();
    // final jsonResponse = json.decode(jsonString);
    return new FerrySchedule.fromJson(jsonString);
  }
}
