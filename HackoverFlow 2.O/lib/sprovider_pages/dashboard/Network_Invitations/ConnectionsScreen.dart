import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawtrix/sprovider_pages/profiles/connection_profile.dart';

class ConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<Connection>>(
        future: _loadConnections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final connections = snapshot.data;
            return ListView.builder(
              itemCount: connections!.length,
              itemBuilder: (context, index) {
                final connection = connections[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(connection.headerImage),
                  ),
                  title: Text(connection.generalInformation['name']),
                  subtitle: Text(connection.profession),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConnectionProfilePage(connection.id),
                        ),
                      );
                    },
                    child: Text('Connect'),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Connection>> _loadConnections() async {
    final String jsonData = await rootBundle.loadString('assets/json/sprov_invitations.json');
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

void main() {
  runApp(MaterialApp(
    home: ConnectionScreen(),
  ));
}
