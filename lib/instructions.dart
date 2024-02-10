import 'package:flutter/material.dart';
import 'selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstructionsPage(),
    );
  }
}

class InstructionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Instructions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/acupoints.jpg', // Replace with your image path
              height: 400,
              width: 400,
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  // Add your instructions here
                  '1. Open the designated application on your mobile device. \n2.Navigate to the menu by tapping on the menu button.\n3. To access the device, select the \'Controller\' option from the menu.\n4. Ensure that your mobile device\'s Bluetooth is enabled and successfully connected to the intended device.\n5. Choose the specific organ for which you seek acupressure treatment.\n6. Place your hand into the designated gloves.\n7. Adjust the position of your hand in accordance with the alignment of metallic balls.\n8. Exercise patience while the indicator transitions from red to green, signifying appropriate hand placement.\n9. Initiate the treatment by selecting the \'Start\' button.\n10. Tailor the parameters to suit your preferences and requirements.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for the 'Proceed' button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
