import 'package:flutter/material.dart';
import 'package:lawtrix/client/forms/singler.dart';
// import 'package:your_project_name/request_details_page.dart';

class OngoingRequests extends StatefulWidget {
  final List<Map<String, dynamic>> requests;

  OngoingRequests(this.requests);

  @override
  State<OngoingRequests> createState() => _OngoingRequestsState();
}

class _OngoingRequestsState extends State<OngoingRequests> {
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
                    builder: (context) => RequestDetailsPage(request),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
