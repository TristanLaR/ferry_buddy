import 'package:ferry_buddy/models/schedule_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FerryScheduleNotifier extends StateNotifier<FerrySchedule> {
  FerryScheduleNotifier(FerrySchedule schedule) : super(schedule);

  late FerrySchedule ferrySchedule;

  void upcomingRuns() {
    int listLength = 16;
    for (int i=0; i < ferrySchedule.schedule.length; i++) {
      List<FerryScheduleItem> item = ferrySchedule.schedule;
      if (item[i].getDateTime().isAfter(DateTime.now()) && i + listLength < ferrySchedule.schedule.length) {
        state = FerrySchedule(schedule: item.sublist(i, i+listLength));
        return;
      } else if (item[i].getDateTime().isAfter(DateTime.now()) && i + listLength >= ferrySchedule.schedule.length) {
        int tomorrowRuns = listLength - ferrySchedule.schedule.length - i + listLength + 1;
        state = FerrySchedule(schedule: item.sublist(i) + item.sublist(0, tomorrowRuns));
        return;
      }
    }
    state = FerrySchedule(schedule: ferrySchedule.schedule.sublist(0, listLength-1));
  }
}
