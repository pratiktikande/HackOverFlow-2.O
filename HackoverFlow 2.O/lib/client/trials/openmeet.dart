import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_apps/device_apps.dart'; // Import for checking app installation

class Opena extends StatelessWidget {
  const Opena({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                // Example usage: Call _openMyApp function when button is pressed
                _openMyApp({'MyApp': 'Your data or URL here'});
              },
              child: const Text("Open My App"),
            ),
          ],
        ),
      ),
    );
  }

  _openMyApp(data) async {
    // String dt = data['MyApp'] as String; // Assuming 'MyApp' is the key for your app's URL or data

    // Check if your app is installed on the device
    bool isInstalled = await DeviceApps.isAppInstalled('com.codewithkael.javawebrtcyoutube');
    DeviceApps.openApp('com.codewithkael.javawebrtcyoutube');
    // If your app is installed, open the app with a specific data (URL)
    // if (isInstalled != false) {
    //   AndroidIntent intent = AndroidIntent(
    //     action: 'action_view',
    //     // data: dt,
    //   );
    //   await intent.launch();
    // }
    // If your app is not installed, you can handle this case as needed
    // else {
    //   // You may want to provide some fallback behavior, such as opening a webpage or showing a message
    //   String url = dt;
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }
  }
}
