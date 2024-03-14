import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lawtrix/client/ExplorePage/explore.dart';
import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

import '../client/forms/requesthome.dart';

class clientNav extends StatefulWidget {
  const clientNav({super.key});

  @override
  State<clientNav> createState() => _clientNavState();
}

class _clientNavState extends State<clientNav> {
  Map<String, dynamic>? profileData;
  @override
  void initState() {
    super.initState();
    loadProfileData();
  }
  Future<void> loadProfileData() async {
    // Load and parse the JSON data
    final String jsonContent = await rootBundle.loadString('assets/json/client_profileData.json');
    setState(() {
      profileData = json.decode(jsonContent);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

      UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xff632299),
          Color(0xff9e55f6),
        ],
      ),
    ),
    accountEmail: Text(profileData?['generalInformation']?['email'] ?? ""),
    currentAccountPictureSize: Size(50, 50),
    currentAccountPicture: CircleAvatar(
    backgroundColor: Colors.transparent,
    backgroundImage: AssetImage(profileData?['headerImage'] ?? "assets/images/logo.png"), // Provide a default image path
    ),
    accountName: Text(
    profileData?['generalInformation']?['name'] ?? "",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    ),
    textAlign: TextAlign.center,
    ),
    ),

    ListTile(
            leading: const Icon(Icons.grid_view_sharp),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.chome);
            },
          ),
          ListTile(
            leading: const Icon(Icons.travel_explore_sharp),
            title: const Text("Explore"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=> ExplorePage()
                  )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Schedule"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.Cal);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Manage Requests"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>const reqHome()
                  )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text("Legalese"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.legalese);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("LawBot"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.lawbot);
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: (){
              Navigator.popAndPushNamed(context, route.settingsPage);
            },
          ),
          const Spacer(),
          const Text(
            "Coditt © 2023. All rights reserved.",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async{
              var sharedpref = await SharedPreferences.getInstance();
              sharedpref.remove("token");
              Navigator.pushReplacementNamed(context, route.loginPage);
            },
          )

        ],
      ),
    );
  }
}
