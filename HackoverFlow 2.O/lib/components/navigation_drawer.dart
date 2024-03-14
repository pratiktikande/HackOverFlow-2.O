import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lawtrix/screens/trial%20pages/cases_screen.dart';
import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:lawtrix/sprovider_pages/profiles/sprov_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  Map<String, dynamic>? profileData;
  @override
  void initState() {
    super.initState();
    loadProfileData();
  }
  Future<void> loadProfileData() async {
    // Load and parse the JSON data
    final String jsonContent = await rootBundle.loadString('assets/json/sprov_profile.json');
    setState(() {
      profileData = json.decode(jsonContent);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          InkWell(
          // Wrap the profile image, name, and email with InkWell
          onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => ProfilePage(), // Navigate to the ProfileCreationPage
    ),
    );
    },

          child: UserAccountsDrawerHeader(

            decoration: BoxDecoration(

              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xff7a08d8),
                    Color(0xff8c4cd8),
                  ]),
            ),
            accountEmail: Text(profileData?['generalInformation']['email'] ?? ""),
            currentAccountPictureSize: Size(50, 50),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
            ),
            accountName: Text(
              profileData?['generalInformation']['name'] ?? "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),),
          ListTile(
            leading: const Icon(Icons.grid_view_sharp),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.homePage);
            },
          ),

          ListTile(
            leading: Icon(Icons.list),
            title: Text("Cases"),
            onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                builder: (context)=>const CasesPage()
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
            leading: const Icon(Icons.picture_as_pdf_sharp),
            title: const Text("Resources"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.lres);
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
              sharedpref.setString("usr_typ","");
              Navigator.pushReplacementNamed(context, route.fs);
            },
          )

        ],
      ),
    );
  }
}
