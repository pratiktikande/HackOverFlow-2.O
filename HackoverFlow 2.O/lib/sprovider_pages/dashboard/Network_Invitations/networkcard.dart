import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../profiles/connection_profile.dart';

class NetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'People You May Know',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildNetworkGrid(),
        ],
      ),
    );
  }

  Widget _buildNetworkGrid() {
    return FutureBuilder<List<Connection>>(
      future: _loadConnections(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          final connections = snapshot.data;
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: connections!.length,
            itemBuilder: (context, index) {
              return _buildNetworkCard(connections[index],context);
            },
          );
        }
      },
    );
  }


  Widget _buildNetworkCard(Connection connection, BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Image.asset(
            connection.headerImage, // Use the image from the connection object
            scale: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              connection.generalInformation['name'], // Use the name from the connection object
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Text(
            connection.profession, // Use the profession from the connection object
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Implement the functionality to connect with the user.
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ConnectionProfilePage(connection.id),
                ),
              );
            },
            child: Text('View'),
          ),
        ],
      ),
    );
  }

  Future<List<Connection>> _loadConnections() async {
    final String jsonData = await rootBundle.loadString('assets/json/other_profiles.json');
    final List<dynamic> jsonList = json.decode(jsonData)['connections'];
    return jsonList.map((json) => Connection.fromJson(json)).toList();
  }
}
class Connection {
  final String id;
  final String headerImage;
  final Map<String, dynamic> generalInformation;
  final String profession;

  Connection({
    required this.id,
    required this.headerImage,
    required this.generalInformation,
    required this.profession,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      id: json['id'],
      headerImage: json['headerImage'],
      generalInformation: json['generalInformation'],
      profession: json['profession'],
    );
  }
}
