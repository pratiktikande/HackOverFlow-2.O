import 'package:flutter/material.dart';
import 'SingleRequest.dart';

class JobRequests extends StatefulWidget {
  final List<Map<String, dynamic>> requests;

  JobRequests(this.requests);

  @override
  State<JobRequests> createState() => _JobRequestsState();
}

class _JobRequestsState extends State<JobRequests> {
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
    );
  }
}
