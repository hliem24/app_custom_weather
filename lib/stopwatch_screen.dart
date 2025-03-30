import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  List<String> _laps = [];

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String milliseconds = (duration.inMilliseconds % 1000).toString().padLeft(
      3,
      '0',
    );
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)},${milliseconds.substring(0, 2)}";
  }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        setState(() {});
      });
    } else {
      _stopwatch.stop();
      _timer?.cancel();
    }
    setState(() {});
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _laps.clear();
    setState(() {});
  }

  void _recordLap() {
    if (_stopwatch.isRunning) {
      setState(() {
        _laps.insert(0, _formatTime(_stopwatch.elapsed));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _formatTime(_stopwatch.elapsed),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _recordLap,
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30),
                        backgroundColor: Colors.grey[800],
                      ),
                      child: Text(
                        "Vòng",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _startStopwatch,
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30),
                        backgroundColor:
                            _stopwatch.isRunning ? Colors.red : Colors.green,
                      ),
                      child: Text(
                        _stopwatch.isRunning ? "Dừng" : "Bắt đầu",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _resetStopwatch,
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30),
                        backgroundColor: Colors.blueGrey,
                      ),
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: _laps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "Vòng ${_laps.length - index}: ${_laps[index]}",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
