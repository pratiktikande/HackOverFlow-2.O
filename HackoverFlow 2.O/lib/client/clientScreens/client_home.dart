import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:lawtrix/screens/trial%20pages/fetdata.dart';
import 'package:lawtrix/sprovider_pages/dashboard/feed/addPost.dart';
import '../../components/clientNavigation.dart';
import '../../screens/trial pages/chatr.dart';
import '../../sprovider_pages/profiles/sprov_profile.dart';
import '../../sprovider_pages/sprov_trial/legalresources.dart';
import '../../sprovider_pages/sprov_trial/viewRequest.dart';
import '../forms/CreatedRequests.dart';
import '../forms/client_viewreq.dart';
import '../forms/requesthome.dart';
import '../trials/chattrial.dart';
import '../../DiscardedUseful/oldcreatedrequests.dart';
import '../trials/clsify.dart';
import '../trials/openmeet.dart';
import '../trials/retd.dart';

class clientHome extends StatelessWidget {
  const clientHome({Key? key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const clientNav(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:(context)=> Clsify(),
                    ),
                  );
                },
                child: const Text("Classify"),
              ),
              const SizedBox(height: 20), // Add some space between buttons
              ElevatedButton(
                onPressed: (){
                  // Add functionality for the second button here
                  _openMyApp();
                },
                child: const Text("Open Meet"),
              ),
            ],
          ),
        )
    );
  }
}
_openMyApp() async {
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