import 'package:flutter/material.dart';
import 'package:innerve_accumitt/instructions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.bluetooth),
            onPressed: () {
              // Add logic to open a prompt for Bluetooth devices
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/user_image.png'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Add logic to navigate to the home page
              },
            ),
            ListTile(
              title: Text('Instructions'),
              onTap: () {
                // Add logic to navigate to the instructions page
              },
            ),
            ListTile(
              title: Text('Controller'),
              onTap: () {
                // Add logic to navigate to the controller page
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                // Add logic to navigate to the contact us page
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/hand.png', // Replace with the actual image asset
                height: 350.0,
                width: 350.0,
                // Adjust size as needed
              ),
            Text(
              'ACCUMITT',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tradition meets innovation as acupressure embraces AI, fostering harmony in body and mind.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for 'Get Started' button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstructionsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                
              ),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
