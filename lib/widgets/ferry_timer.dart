import 'dart:async';

import 'package:ferry_buddy/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FerryTimer extends HookConsumerWidget {
  FerryTimer({
    Key? key,
    required this.countdownTime,
    this.style = const TextStyle(
        fontSize: 42.0, fontWeight: FontWeight.bold, color: Colors.white),
    this.onDone,
  }) : super(key: key);

  final DateTime countdownTime;
  final TextStyle style;
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var duration = countdownTime.difference(DateTime.now());
    useEffect(() {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        print("Tick - ${duration.inSeconds}");
        if (duration.inSeconds <= 0) {
          print("countdown reached 0");
          timer.cancel();
          ref.refresh(ferryScheduleProvider);
        }
        duration = countdownTime.difference(DateTime.now());
      });
      return null;
    }, []);
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        "${(duration.inHours).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
        style: style,
      ),
    );
  }
}
