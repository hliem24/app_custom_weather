import 'package:flutter/material.dart';
import 'dart:async';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<Map<String, dynamic>> alarms = [];
  bool isEditing = false;

  void _addAlarm(String time, String label) {
    setState(() {
      alarms.add({'time': time, 'label': label, 'isActive': true});
    });
    _scheduleAlarm(time, alarms.length - 1);
  }

  void _editAlarm(int index) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null) {
      setState(() {
        alarms[index]['time'] = newTime.format(context);
      });
      _scheduleAlarm(newTime.format(context), index);
    }
  }

  void _deleteAlarm(int index) {
    setState(() {
      alarms.removeAt(index);
    });
  }

  void _toggleAlarm(int index, bool isActive) {
    setState(() {
      alarms[index]['isActive'] = isActive;
    });
    if (isActive) {
      _scheduleAlarm(alarms[index]['time'], index);
    }
  }

  void _scheduleAlarm(String alarmTime, int index) {
    TimeOfDay now = TimeOfDay.now();
    List<String> timeParts = alarmTime.split(':');
    int alarmHour = int.parse(timeParts[0]);
    int alarmMinute = int.parse(timeParts[1].split(' ')[0]);
    bool isPM = timeParts[1].contains('PM');

    if (isPM && alarmHour != 12) alarmHour += 12;
    if (!isPM && alarmHour == 12) alarmHour = 0;

    int nowMinutes = now.hour * 60 + now.minute;
    int alarmMinutes = alarmHour * 60 + alarmMinute;
    int delayMinutes = alarmMinutes - nowMinutes;

    if (delayMinutes < 0) return;

    Future.delayed(Duration(minutes: delayMinutes), () {
      if (alarms.length > index && alarms[index]['isActive']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('⏰ Báo thức "${alarms[index]['time']}" đến giờ!'),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.blue,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          icon: Icon(Icons.edit, color: Colors.orange),
          onPressed: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
        ),
        title: Text(
          'BÁO THỨC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (newTime != null) {
                _addAlarm(newTime.format(context), "New Alarm");
              }
            },
            icon: Icon(Icons.add, color: Colors.orange, size: 28),
          ),
        ],
      ),
      body:
          alarms.isEmpty
              ? Center(
                child: Text(
                  "Chưa có báo thức nào",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
              : ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  return AlarmTile(
                    time: alarms[index]['time'],
                    label: alarms[index]['label'],
                    isActive: alarms[index]['isActive'],
                    isEditing: isEditing,
                    onEdit: () => _editAlarm(index),
                    onDelete: () => _deleteAlarm(index),
                    onToggle: (isActive) => _toggleAlarm(index, isActive),
                  );
                },
              ),
    );
  }
}

class AlarmTile extends StatelessWidget {
  final String time;
  final String label;
  final bool isActive;
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const AlarmTile({
    super.key,
    required this.time,
    required this.label,
    required this.isActive,
    required this.isEditing,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade700, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Switch(
                value: isActive,
                onChanged: onToggle,
                activeColor: Colors.orange,
              ),
              if (isEditing) ...[
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.grey.shade400),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
