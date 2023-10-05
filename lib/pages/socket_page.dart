import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class SocketPage extends StatefulWidget {
//   const SocketPage({super.key});

//   @override
//   State<SocketPage> createState() => _SocketPageState();
// }

// class _SocketPageState extends State<SocketPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Socket'),
//       ),
//       body: const Text('socket :)'),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// void main() => runApp(HomeAutomationApp());

// class HomeAutomationApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

class SocketScreen extends StatefulWidget {
  @override
  _SocketScreenState createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  bool isSocketOn = false;

  // Timer values
  int timerValue = 0;

  // Scheduled time
  TimeOfDay scheduledTime = TimeOfDay.now();

  // Current time
  DateTime _currentTime = DateTime.now();

  // Format for displaying the current time as "hh:mm"
  // final timeFormat = DateFormat('hh:mm a').format(_currentTime);
  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void toggleSocket() {
    setState(() {
      isSocketOn = !isSocketOn;
    });
  }

  void setTimer(int value) {
    setState(() {
      timerValue = value;
    });
  }

  void scheduleTime(BuildContext context) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: scheduledTime,
    );
    if (selectedTime != null) {
      setState(() {
        scheduledTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socket Options'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 107, 183, 246),
                    Color.fromARGB(255, 21, 89, 145),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Socket',
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(
                    isSocketOn ? Icons.power : Icons.power_off_outlined,
                    size: 70.0,
                    color: isSocketOn
                        ? Color.fromARGB(255, 152, 221, 73)
                        : Colors.white70,
                  ),
                  Switch(
                    value: isSocketOn,
                    onChanged: (value) {
                      toggleSocket();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Set Timer:',
              style: TextStyle(fontSize: 20.0),
            ),
            Slider(
              value: timerValue.toDouble(),
              min: 0,
              max: 60,
              onChanged: (value) {
                setTimer(value.toInt());
              },
            ),
            Text(
              '$timerValue minutes',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              readOnly: true,
              onTap: () {
                scheduleTime(context);
              },
              decoration: InputDecoration(
                labelText: 'Schedule Time:',
                labelStyle: TextStyle(fontSize: 20.0),
                hintText: scheduledTime.format(context),
                hintStyle: TextStyle(fontSize: 16.0),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Current Time:',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              // Format and display the current time as "hh:mm"
              DateFormat('hh:mm a').format(_currentTime),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
