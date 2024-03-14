
import 'package:flutter/material.dart';

import '../../../client/forms/reqform.dart';
import 'SingleRequest.dart';

class Sprov_requests extends StatefulWidget {
  final List<Map<String, dynamic>> requests;

  Sprov_requests(this.requests);

  @override
  State<Sprov_requests> createState() => _Sprov_requestsState();
}

class _Sprov_requestsState extends State<Sprov_requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: widget.requests.length,
        itemBuilder: (context, index) {
          final request = widget.requests[index];

          return Card(
            child: ListTile(
              title: Text(request['title']),
              subtitle: Text(request['service_details']['description']),
              onTap: () {
                // Navigate to the new file that displays all the details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificaionDetails(request),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Adjust placement as needed
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80, right: 12), // Adjust margin as needed
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RequestForm()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}