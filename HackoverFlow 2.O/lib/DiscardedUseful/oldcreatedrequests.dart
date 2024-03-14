
import 'package:flutter/material.dart';
import '../../client/forms/reqform.dart';
import '../client/trials/edittrial.dart';

class CreatedRequests extends StatefulWidget {
  final List<Map<String, dynamic>> requests;

  const CreatedRequests(this.requests, {super.key});

  @override
  State<CreatedRequests> createState() => _CreatedRequestsState();
}

class _CreatedRequestsState extends State<CreatedRequests> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditRequests(request['id']),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Adjust placement as needed
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 35, right: 12), // Adjust margin as needed
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RequestForm()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}