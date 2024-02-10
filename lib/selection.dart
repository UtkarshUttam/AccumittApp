import 'package:flutter/material.dart';
import 'controller.dart'; // Assuming you have a controller.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionPage(),
    );
  }
}

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select the Therapy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose your path to healing',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularImageButton(
                  imagePath: 'assets/pcos.jpg',
                  therapyName: 'PCOS',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PCOSControllerPage()),
                    );
                  },
                ),
                CircularImageButton(
                  imagePath: 'assets/abdomen.jpg',
                  therapyName: 'Abdomen',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AbdomenControllerPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularImageButton(
                  imagePath: 'assets/energy.png',
                  therapyName: 'Energy',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnergyControllerPage()),
                    );
                  },
                ),
                CircularImageButton(
                  imagePath: 'assets/heart.jpg',
                  therapyName: 'Heart',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HeartControllerPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularImageButton extends StatelessWidget {
  final String imagePath;
  final String therapyName;
  final VoidCallback onPressed;

  CircularImageButton({
    required this.imagePath,
    required this.therapyName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          therapyName,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
