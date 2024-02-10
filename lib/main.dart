import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image of a hand with ACCUMITT text
              Image.asset(
                'assets/hand.png', // Replace with the actual image asset
                height: 350.0,
                width: 350.0,
                // Adjust size as needed
              ),
              SizedBox(height: 20.0),

              // Text "ACCUMITT" below the image
              Text(
                'ACCUMITT',
                style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),

              SizedBox(height: 20.0),

              // Quote text
              Text(
                '"आरोग़्यं हस्ते तवे"',
                style: TextStyle(
                  fontSize: 36.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40.0),

              // Login/Sign-up button with increased size and border radius
              ElevatedButton(
                onPressed: () {
                  // Navigate to the login or sign-up screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Adjust border radius as needed
                  ),
                ),
                child: Text(
                  'Login / Sign Up',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
