

import 'package:flutter/material.dart';
import 'package:lawtrix/client/ExplorePage/RequesterProfilePage.dart';

import '../ExplorePage/explore.dart';
import '../trials/edittrial.dart';

class AppliedRequests extends StatefulWidget {
  final List<Map<String, dynamic>> requests;

  const AppliedRequests(this.requests);

  @override
  State<AppliedRequests> createState() => _AppliedRequestsState();
}

class _AppliedRequestsState extends State<AppliedRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.requests.length,
        itemBuilder: (context, index) {
          final request = widget.requests[index];

          return Card(
            child: ListTile(
              title: Text(request['provinfor']['name']),
              subtitle: Text(request['reqinfor']['title']),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'view_request') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditRequests(request['reqinfor']['id'])));
                  } else if (value == 'view_profile') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  RequesterProfilePage(request['provinfor']['id'])));

                  }
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'view_request',
                      child: Text('View Request'),
                    ),
                    PopupMenuItem<String>(
                      value: 'view_profile',
                      child: Text('View Profile'),
                    ),
                  ];
                },
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 35, right: 12),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
