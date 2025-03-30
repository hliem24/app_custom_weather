import 'package:flutter/material.dart';
import 'alarm_screen.dart';
import 'stopwatch_screen.dart';
import 'countdown_timer_screen.dart';
import 'weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final List<Widget> screens = [
    AlarmScreen(),
    StopwatchScreen(),
    CountdownTimerScreen(),
    WeatherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.grey.shade900,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Báo thức'),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Bấm giờ'),
            BottomNavigationBarItem(
              icon: Icon(Icons.av_timer),
              label: 'Hẹn giờ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thermostat_rounded),
              label: 'Thời Tiết',
            ),
          ],
        ),
      ),
    );
  }
}
