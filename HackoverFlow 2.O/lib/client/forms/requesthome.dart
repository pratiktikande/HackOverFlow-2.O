import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lawtrix/client/forms/CreatedRequests.dart';
import 'package:lawtrix/components/clientNavigation.dart';
import '../../DiscardedUseful/oldcreatedrequests.dart';
import 'AppliedRequests.dart';
import 'ongoingRequests.dart';

class reqHome extends StatefulWidget {
  const reqHome({Key? key}) : super(key: key);

  @override
  State<reqHome> createState() => _reqHomeState();
}

class _reqHomeState extends State<reqHome> {
  late Future<List<Map<String, dynamic>>> requests;// Declare as a Future
  late Future<List<Map<String, dynamic>>> requestsTemplates;
  late Future<List<Map<String, dynamic>>> requestsApplied;

  @override
  void initState() {
    super.initState();
    // Load the data when the widget is initialized
    requests = loadRequests('assets/json/templates.json');
    requestsTemplates = loadRequests('assets/json/created_requests.json');
    requestsApplied = loadRequests('assets/json/client_applied_request.json');
  }

  Future<List<Map<String, dynamic>>> loadRequests(path) async {
    final data = await DefaultAssetBundle.of(context).loadString(path);
    final jsonData = json.decode(data);
    final requestList = jsonData['requests'];
    return List<Map<String, dynamic>>.from(requestList);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Requests'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Accepted\nRequests'),
              Tab(text: 'Applied\nRequests'),
              Tab(text: 'Created\nRequests'),
            ],
          ),
        ),
        drawer: clientNav(),
        body: TabBarView(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: requests,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  return OngoingRequests(snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: requestsApplied,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  return AppliedRequests(snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: requestsTemplates,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  // return CreatedRequests(snapshot.data!);
                  return CaseListWidget('655aedef3c0f33d37e9ee923');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
