import 'package:ferry_buddy/views/home_page.dart';
import 'package:ferry_buddy/views/landscape_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const mainScheduleBox = 'schedule';

void main() async {
  // FerryScheduleItem schedule = await loadSchedule();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLifecycleState = useAppLifecycleState();

    useEffect(() {
      print("current app state $appLifecycleState");
      if (appLifecycleState == AppLifecycleState.resumed) {
        ref.refresh(ferryScheduleProvider);
      }
      return null;
    }, [appLifecycleState]);

    return MaterialApp(
      title: 'Ferry Buddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: OrientationBuilder(builder: (_, orientation) {
            print("Orientation: $orientation");
            if (orientation == Orientation.portrait)
              return HomePage();
            else
              return LandscapeView();
          }),
        ),
      ),
    );
  }
}
