import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../components/navigation_drawer.dart';

class ConnectionProfilePage extends StatefulWidget {
  final String selectedProfileId;

  ConnectionProfilePage(this.selectedProfileId);

  @override
  _ConnectionProfilePageState createState() => _ConnectionProfilePageState();
}

class _ConnectionProfilePageState extends State<ConnectionProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  Map<String, dynamic>? profileData;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _offset = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Load and parse the JSON data for the selected ID
    loadProfileData(widget.selectedProfileId);

    // Start the animations with delays
    startAnimations();
  }

  Future<void> loadProfileData(String id) async {
    final String jsonContent = await rootBundle.loadString('assets/json/other_profiles.json');
    final List<dynamic> connections = json.decode(jsonContent)['connections'];

    final connection = connections.firstWhere((connection) => connection['id'] == id, orElse: () => null);

    setState(() {
      profileData = connection;
    });
  }

  Future<void> startAnimations() async {
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Profile'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header Section
            Hero(
              tag: 'profileImage',
              child: SlideTransition(
                position: _offset,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue, Colors.teal],
                    ),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(profileData?['headerImage'] ?? 'assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'General Information',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Name: ${profileData?['generalInformation']['name'] ?? ''}'),
                    Text('Location: ${profileData?['generalInformation']['location'] ?? ''}'),
                    Text('Email: ${profileData?['generalInformation']['email'] ?? ''}'),
                    Text('Phone: ${profileData?['generalInformation']['phone'] ?? ''}'),
                  ],
                ),
              ),
            ),
            // Add the +Connect Button with Curved Edges
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center, // Center the button
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0), // Adjust the border radius as needed
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the +Connect button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '+ Connect',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Skills Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Skills',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var skill in profileData?['skills'] ?? [])
                      Text('$skill'),
                  ],
                ),
              ),
            ),

            // Notable Cases Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Notable Cases',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var notableCase in profileData?['notableCases'] ?? [])
                      Text('$notableCase'),
                  ],
                ),
              ),
            ),

            // Education Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Education',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var education in profileData?['education'] ?? [])
                      Text('$education'),
                  ],
                ),
              ),
            ),

            // Awards and Recognitions Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Awards and Recognitions',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    for (var award in profileData?['awardsAndRecognitions'] ?? [])
                      Text('$award'),
                  ],
                ),
              ),
            ),

            // Contact Information Section
            SlideTransition(
              position: _offset,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Contact Information',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Website: ${profileData?['contactInformation']['website'] ?? ''}'),
                    Text('LinkedIn: ${profileData?['contactInformation']['linkedin'] ?? ''}'),
                  ],
                ),
              ),
            ),
            // Rest of your profile display widgets, using profileData as needed
            // ...
          ],
        ),
      ),
    );
  }
}
