import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lawtrix/sprovider_pages/dashboard/jobNotifications/JobRequest.dart';
import 'Sprov_Requests.dart';

class NotificationHome extends StatefulWidget {
  const NotificationHome({Key? key}) : super(key: key);

  @override
  State<NotificationHome> createState() => _NotificationHomeState();
}

class _NotificationHomeState extends State<NotificationHome> {
  late Future<List<Map<String, dynamic>>> requests;
  late Future<List<Map<String, dynamic>>> requests1;// Declare as a Future

  @override
  void initState() {
    super.initState();
    // Load the data when the widget is initialized
    requests = loadRequests();
    requests1 = loadRequests1();
  }

  Future<List<Map<String, dynamic>>> loadRequests() async {
    final data = await DefaultAssetBundle.of(context).loadString('assets/json/sprov_jobrequests.json');
    final jsonData = json.decode(data);
    final requestList = jsonData['requests'];
    return List<Map<String, dynamic>>.from(requestList);
  }
  Future<List<Map<String, dynamic>>> loadRequests1() async {
    final data1 = await DefaultAssetBundle.of(context).loadString('assets/json/sprov_jobrequests.json');
    final jsonData1 = json.decode(data1);
    final requestList1 = jsonData1['appliedReq'];
    return List<Map<String, dynamic>>.from(requestList1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Client Requests'),
              Tab(text: 'Applied Requests'),
            ],
          ),
        ),
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
                  return JobRequests(snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: requests1,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  return Sprov_requests(snapshot.data!);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
