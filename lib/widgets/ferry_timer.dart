import 'dart:async';

import 'package:ferry_buddy/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FerryTimer extends HookConsumerWidget {
  FerryTimer({
    Key? key,
    required this.duration,
    this.style = const TextStyle(
        fontSize: 42.0, fontWeight: FontWeight.bold, color: Colors.white),
    this.onDone,
  }) : super(key: key);

  final Duration duration;
  final TextStyle style;
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final timer = Timer.periodic(duration, (time) {
        time.tick;
      });
      if (duration.inSeconds == 0) {
        ref.refresh(ferryScheduleProvider);
      }
      return timer.cancel;
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
