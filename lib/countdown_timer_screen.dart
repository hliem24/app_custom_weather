import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountdownTimerScreen extends StatefulWidget {
  const CountdownTimerScreen({super.key});

  @override
  _CountdownTimerScreenState createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  Duration duration = Duration(minutes: 1, seconds: 0);
  Timer? timer;
  bool isRunning = false;

  FixedExtentScrollController minuteController = FixedExtentScrollController();
  FixedExtentScrollController secondController = FixedExtentScrollController();

  void startTimer() {
    if (timer != null) timer!.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration.inSeconds > 0) {
        setState(() {
          duration = Duration(seconds: duration.inSeconds - 1);
        });
      } else {
        timer.cancel();
        setState(() {
          isRunning = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Hẹn giờ đã kết thúc!", textAlign: TextAlign.center),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    });
    setState(() {
      isRunning = true;
    });
  }

  void stopTimer() {
    if (timer != null) timer!.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      duration = Duration(minutes: 1, seconds: 0);
      minuteController.jumpToItem(1);
      secondController.jumpToItem(0);
    });
  }

  String formatDuration(Duration d) {
    String minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isRunning)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: CupertinoPicker(
                      backgroundColor: Colors.grey.shade900,
                      itemExtent: 32,
                      scrollController: minuteController,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          duration = Duration(
                            minutes: index,
                            seconds: duration.inSeconds.remainder(60),
                          );
                        });
                      },
                      children: List.generate(
                        60,
                        (index) => Center(
                          child: Text(
                            index.toString().padLeft(2, '0'),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: CupertinoPicker(
                      backgroundColor: Colors.grey.shade900,
                      itemExtent: 32,
                      scrollController: secondController,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          duration = Duration(
                            minutes: duration.inMinutes,
                            seconds: index,
                          );
                        });
                      },
                      children: List.generate(
                        60,
                        (index) => Center(
                          child: Text(
                            index.toString().padLeft(2, '0'),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            Text(
              formatDuration(duration),
              style: TextStyle(
                fontSize: 90,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: resetTimer,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                    backgroundColor: Colors.grey[800],
                  ),
                  child: Text("Đặt lại", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: isRunning ? stopTimer : startTimer,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                    backgroundColor: isRunning ? Colors.red : Colors.green,
                  ),
                  child: Text(
                    isRunning ? "Dừng" : "Bắt đầu",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
