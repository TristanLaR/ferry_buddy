import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class FerryTimer extends HookWidget {
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
  Widget build(BuildContext context) {
    useEffect(() {
      final timer = Timer.periodic(duration, (time) {
        time.tick;
      });
      return timer.cancel;
    }, []);
    return Text(
      "${(duration.inHours).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
      style: style,
    );
  }
}
