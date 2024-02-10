import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ControllerPage extends StatefulWidget {
  final String title;
  final String imageURL;

  ControllerPage({required this.title, required this.imageURL});

  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  bool isTimerRunning = false;
  int selectedDuration = 1; // Default duration in minutes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              widget.imageURL, // Use the imageURL variable
              height: 450,
              width: 300,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isTimerRunning = !isTimerRunning;
                });
                // Add logic for starting/stopping the timer
                if (isTimerRunning) {
                  startTimer();
                } else {
                  // Add logic to stop the timer
                }
              },
              style: ElevatedButton.styleFrom(
                primary: isTimerRunning ? Colors.red : Colors.blue,
                minimumSize: Size(150, 50), // Adjust the size as needed
              ),
              child: Text(
                isTimerRunning ? 'STOP' : 'START',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Duration:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton<int>(
                  value: selectedDuration,
                  items: [1, 5, 10, 15, 20]
                      .map<DropdownMenuItem<int>>(
                        (int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value min'),
                        ),
                      )
                      .toList(),
                  onChanged: (int? value) {
                    setState(() {
                      selectedDuration = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Countdown(
              seconds: isTimerRunning ? selectedDuration * 60 : 0,
              build: (BuildContext context, double time) => Text(
                formatTime(time),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              interval: Duration(seconds: 1),
              onFinished: () {
                // Add logic when the timer finishes
              },
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    // Add logic to start the timer with selectedDuration
  }

  String formatTime(double time) {
    int minutes = (time / 60).floor();
    int seconds = (time % 60).floor();
    return '$minutes:${seconds < 10 ? '0$seconds' : seconds}';
  }
}

class PCOSControllerPage extends StatelessWidget {
  final String imageURL =
      'assets/pcosStart.png'; // Replace with the actual path
  @override
  Widget build(BuildContext context) {
    return ControllerPage(title: 'PCOS', imageURL: imageURL);
  }
}

class AbdomenControllerPage extends StatelessWidget {
  final String imageURL =
      'assets/abdomenStart.png'; // Replace with the actual path
  @override
  Widget build(BuildContext context) {
    return ControllerPage(title: 'Abdomen', imageURL: imageURL);
  }
}

class HeartControllerPage extends StatelessWidget {
  final String imageURL =
      'assets/heartStart.png'; // Replace with the actual path
  @override
  Widget build(BuildContext context) {
    return ControllerPage(title: 'Heart', imageURL: imageURL);
  }
}

class EnergyControllerPage extends StatelessWidget {
  final String imageURL =
      'assets/energyStart.png'; // Replace with the actual path
  @override
  Widget build(BuildContext context) {
    return ControllerPage(title: 'Energy', imageURL: imageURL);
  }
}
